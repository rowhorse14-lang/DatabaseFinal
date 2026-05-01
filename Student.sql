CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    major VARCHAR(20)
);

INSERT INTO Student VALUES (8, 'Faith', 'Widgins-Brown', 'fwidgins@villanova.edu', 'Sociology');
INSERT INTO Student VALUES (6, 'Umu', 'Diallo', 'udiallo@villanova.edu', 'Comprehensive Science');
INSERT INTO Student VALUES (13, 'Sasha', 'Caines', 'scaines@villanova.edu', 'Political Science');
INSERT INTO Student VALUES (19, 'Sidney', 'Mbah', 'smbah@villanova.edu', 'Psychology');
INSERT INTO Student VALUES (1, 'Aaliyah', 'Brown', 'aaliyah.brown@villanova.edu', 'Biology');
INSERT INTO Student VALUES (2, 'Jordan', 'Smith', 'jordan.smith@villanova.edu', 'Mathematics');
INSERT INTO Student VALUES (3, 'Maya', 'Johnson', 'maya.johnson@villanova.edu', 'Computer Science');
INSERT INTO Student VALUES (4, 'Daniel', 'Lee', 'daniel.lee@villanova.edu', 'Engineering');
INSERT INTO Student VALUES (5, 'Kayla', 'Davis', 'kayla.davis@villanova.edu', 'Nursing');