<?php
/*
* File: index.php
* Created: February 2013
* Updated: October 2013
* Authors: Dave and Mihaela
*/


main( );

/*
* 
*/
function main() {
  //changes to lowercase value keyed by "course" OR "comp415" if none specified
	$_GET["course"] = isset($_GET["course"]) ? strtolower($_GET["course"]) 
	                                         : "comp415";
	//determines what query to send to the database based on value keyed by 
	//"method" OR old query string information is translated into 
	//appropriate query requests.
	$method = isset($_GET["method"]) ? strtolower($_GET["method"]) 
	                                 : getOldMethodType();
	if($method == "course") {
		dbGetCourses( );
	} 
	elseif($method == "question") {
		$_GET["topics"] = isset($_GET["topics"]) ? $_GET["topics"] : "";
		getAllQuestions($_GET["course"], $_GET["topics"]);
	} 
	elseif($method == "topic") {
		dbGetTopics($_GET["course"]);
	}
}

/*
* Ensures compatibility of current version of mobile app with older versions.
* Hard to understand. Harder to be maintained in the future. 
*
* Creates new keys from existing values in the $_GET array as follows:
*  "topics" is new and has value of element keyed by old "categories"
*  "course" is new and has value of element keyed by old "class"
*  "class" is recycled and has value of element keyed by new "getTopics"
*          - Most puzzling! Why recycle and keep "class"?
*
* @return string (or no return!) to translate GET query string to 
* appropriate DB queries as follows:
*    "question" - get all questions for given course and topic
*    "topic" - get topics for given course
*    "course - get all courses.
*/
function getOldMethodType() {
	if(isset($_GET["categories"])) {
	//"topics" is compatible with "categories", which will be deprecated
		$_GET["topics"] = $_GET["categories"];
		return "question";
	} 
	//maps getTopic query string (old) with course query string
	//query will be performed 
	if(isset($_GET["getTopics"])) {
		$_GET["course"] = $_GET["getTopics"]; //!!!! Why is this necessary? !!!!
		return "topic";
	} 
	//acknowledges that get course query will be performed
	if(isset($_GET["getCourse"])) {
		return "course";
	} 
	//"course" is compatible with "class", which will be deprecated
	if(isset($_GET["class"])) { 
		$_GET["course"] = $_GET["class"];
	}
}

/*
* Gets all questions filtered by topics and outputs content with
* question and answer occurrences separated by <!--> marker. 
* Question and answer are separated by <answer> marker. 
* @param $course string with course name
* @param $topics string with topic names separated by comma
*/
function getAllQuestions($course, $topics) {
	$connect = connect();
	if($connect == false) {
		echo "";
	} 
	else {
		$questions = dbGetQuestions(parseTopics($topics), $course);
		$results = "";
		foreach($questions as $question)
			$results .= "{$question['question']}<answer>{$question['answer']}<!-->";
	  //removes last marker <!--> from $results
		echo(substr($results, 0, strlen($results)-5));
	}
}


/*
* Transforms comma separted topic values into WHERE clause for SQL query, 
* in which topic names are OR-ed together using the template
*    topicName=topic1 OR topicName=topic2 OR ...
* @return $results string topic names OR-ed together.
*/
function parseTopics($topics) {
	$topics = explode(',', $topics);
	$results = "";
	$joint = " OR topicName=";
	$size = count($topics);
	
	for($i = 0; $i < $size; $i++) {
		if($i > 0)
			$results .= " $joint '{$topics[$i]}'";
		else
			$results .= " topicName='{$topics[$i]}'";
	}
	return $results;
}

//========== Database functions ================

/*
* Gets all questions for $course using the WHERE clause coded into $topics
* @param $topics string with topic names OR-ed together.
* @param $course string with course name
*
* @return $questions 2-dimensional array. Subarrays are associative arrays
* with "question" and "answer" keys. 
*/
function dbGetQuestions($topics, $course="comp415") {
	$query = "SELECT question, answer FROM questions_vw 
	              WHERE ($topics) AND courseName=\"$course\"";
	$db = connect( );
	//!!!!!!!!
	//Using prepared statement with ? placeholder is safer. 
	//Because of $topics complexity, some new data structure (array) must be
	//set up and used for sth->bind_param( ) call. 
	//!!!!!!!!
	$sth = $db->prepare($query);
	if($sth === false) {
		echo "Failed to prepare the SQL statement: " . htmlspecialchars($db->error);
		return false;
	}
	$result = $sth->execute();
	if($result == false) {
		echo "Failed to execute: " . htmlspecialchars($sth->error);
		return false;
	}
	$sth->bind_result($question, $answer);

	$questions = array( );
	while($sth->fetch( )){
		$questions[] = array("question"=>$question, "answer"=>$answer);
	}
	return $questions;
}

/*
* Gets topic names for course and outputs them on separate lines.
* @param $course string
*/
function dbGetTopics($course) {
	$query = "SELECT t.topicName FROM topic AS t 
	          INNER JOIN course AS c ON t.courseID = c.courseID 
	          WHERE c.courseName=\"$course\" 
	          ORDER BY topicName LIMIT 16;";
	$db = connect( );
	//!!!! Very easy to use prepare statement with ? placehodler instead
	$sth = $db->prepare($query);
	if($sth === false) {
		echo "Failed to prepare the SQL statement: " . htmlspecialchars($db->error);
		return false;
	}
	$result = $sth->execute();
	if($result == false) {
		echo "Failed to execute: " . htmlspecialchars($sth->error);
		return false;
	}
	$sth->bind_result($topic);

	while($sth->fetch( )){
		echo($topic . "<br />");
	}
}

/*
* Gets course names and outputs them on separate lines.
*/
function dbGetCourses() {
	$query = "SELECT courseName FROM course;";
	$db = connect( );
	$sth = $db->prepare($query);
	if($sth === false) {
		echo "Failed to prepare the SQL statement: " . htmlspecialchars($db->error);
		return false;
	}
	$result = $sth->execute( );
	if($result == false) {
		echo "Failed to execute: " . htmlspecialchars($sth->error);
		return false;
	}
	$sth->bind_result($course);

	while($sth->fetch()){
		echo($course . "<br />");
	}
}
?>