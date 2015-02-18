/*
* SQL statements to create the database and its tables.
* File: createTables.sql
* Created: May 2013
* Updated: Oct 2013
* Authors: Dave and Mihaela
*/
CREATE DATABASE QuizPower;
USE QuizPower;

/* Current values for courseName are COMP415 and COMP505 */
CREATE TABLE course (
	courseID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	courseName VARCHAR(20) NOT NULL
);

/* 
* Most of topicName values belong to COMP415 
* To do: 
*    CourseID must be foreign key in the course table
*    CourseID should not be capitalized
*    Need unique constraint for (topicName, CourseID) to avoid duplicating
*      topic, course combinations.
*/
CREATE TABLE topic (
	topicID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	topicName VARCHAR(30) NOT NULL,
	CourseID INT NOT NULL
);

/* 
* Duplicates here don't seem critical. 
* No constraint to ensure uniqueness of questions. Seems ok, given that
* the question text introduces enough variability and/or answer 
* might have slight variations (in case of duplicates. 
*/
CREATE TABLE questionAnswer (
	questionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	question VARCHAR(200) NOT NULL,
	answer VARCHAR(200) NOT NULL
);

CREATE TABLE questionTopicMapping (
	questionID INT NOT NULL,
	topicID INT NOT NULL,
	CONSTRAINT PRIMARY KEY (questionID, topicID),
	CONSTRAINT FOREIGN KEY (questionID) REFERENCES questionAnswer(questionID),
	CONSTRAINT FOREIGN KEY (topicID) REFERENCES topic(topicID)
);

CREATE VIEW questions_vw AS SELECT qa.question, qa.answer, t.topicName, c.courseName
	FROM questionAnswer AS qa
	INNER JOIN questiontopicMapping AS qcm ON qcm.questionID = qa.questionID
	INNER JOIN topic AS t ON qcm.topicID = t.topicID
	INNER JOIN course AS c ON t.courseID = c.courseID;
	
SELECT t.topicName
	FROM topic AS t
	INNER JOIN course AS c ON t.courseID = c.courseID WHERE c.courseName="COMP415";