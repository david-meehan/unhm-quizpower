<?php

main();

function main() {
	if(isset($_GET["categories"])) {
		appInventorGetQuestions();
	} elseif(isset($_GET["getTopics"])) {
	
	}
}

function appInventorGetQuestions() {
	$query = explode(',', $_GET['categories']);
	$connect = connect();
	if($connect == false) {
		echo "";
	} else {
		$questions = getQuestions(parseCategories($query));
		$results = "";
		foreach($questions as $question)
			$results .= "{$question['question']}<answer>{$question['answer']}<!-->";
		echo(substr($results, 0, strlen($results)-5));
	}
}

function parseCategories($categories) {
	$results = "";
	$joint = " OR category=";
	$size = count($categories);
	for($i=0; $i<$size; $i++) {
		if($i>0)
			$results .= " $joint '{$categories[$i]}'";
		else
			$results .= " category='{$categories[$i]}'";
	}
	return $results;
}

function connect() {
	$host = 'stem.unh.edu';
	$username = 'CISadmin1';
	$password = 'CISadmin1';
	$database = 'QuizPower';
	
	$connection = new mysqli($host, $username, $password, $database);
	if(mysqli_connect_errno()) {
		exit();
		return false; //no need to return. exit( ) terminates the program.
	}
	return $connection;
}

function getQuestions($categories) {
	$query = "SELECT question, answer FROM questions_vw WHERE $categories";
	$db = connect( );
	$sth = $db->prepare($query);
	if($sth === false) { //Mihaela: is === needed? 
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
	while($sth->fetch()){
		$questions[] = array("question"=>$question, "answer"=>$answer);
	}
	return $questions;
}
?>