CREATE DATABASE IF NOT EXISTS SchoolDB;

USE SchoolDB;

CREATE TABLE IF NOT EXISTS student (
	studentID INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(256) NOT NULL,
    yearGroup TINYINT NOT NULL,
    address TEXT NOT NULL,
    emergencyContactPhone VARCHAR(16) NOT NULL,
    emergencyContactName VARCHAR(256) NOT NULL,
    emergencyContactRelation VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS staff (
	staffID INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(256) NOT NULL,
    occupation VARCHAR(256),
    email VARCHAR(321) NOT NULL,
    emergencyContactPhone VARCHAR(16) NOT NULL,
    emergencyContactName VARCHAR(256) NOT NULL,
    emergencyContactRelation VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS class (
	classID INT AUTO_INCREMENT PRIMARY KEY,
    teacher INT,
    classSubject VARCHAR(256),
    timePeriod TINYINT NOT NULL,
    dayOfWeek TINYINT NOT NULL,
    room VARCHAR(16),
    FOREIGN KEY (teacher) REFERENCES staff(staffID)
);

CREATE TABLE IF NOT EXISTS enrolment (
	studentID INT NOT NULL,
    classID INT NOT NULL,
    PRIMARY KEY (studentID, classID),
    FOREIGN KEY (studentID) REFERENCES student(studentID),
    FOREIGN KEY (classID) REFERENCES class(classID)
);

CREATE TABLE IF NOT EXISTS specialNeed (
	needID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    needDescription TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS studentNeed (
	studentID INT NOT NULL,
    needID INT NOT NULL,
    PRIMARY KEY (studentID, needID),
    FOREIGN KEY (studentID) REFERENCES student(studentID),
    FOREIGN KEY (needID) REFERENCES specialNeed(needID)
);