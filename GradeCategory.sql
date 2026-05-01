CREATE TABLE GRADECATEGORY(
    category_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    category_name VARCHAR(20) NOT NULL,
    weight_pct DECIMAL(5,2) CHECK (weight_pct > 0),
    drop_lowest INT DEFAULT 0 CHECK (drop_lowest >= 0),
    description TEXT,

    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO GRADECATEGORY VALUES (1, 101, 'Homework', 20.00, 1, 'Homework assignments');
INSERT INTO GRADECATEGORY VALUES (2, 101, 'Quizzes', 10.00, 0, 'Course quizzes');
INSERT INTO GRADECATEGORY VALUES (3, 101, 'Projects', 20.00, 0, 'Course projects');
INSERT INTO GRADECATEGORY VALUES (4, 101, 'Midterm Exam', 20.00, 0, 'Midterm examination');
INSERT INTO GRADECATEGORY VALUES (5, 101, 'Final Exam', 30.00, 0, 'Comprehensive final exam');
INSERT INTO GRADECATEGORY VALUES (6, 188, 'Homework', 20.00, 1, 'Homework assignments');
INSERT INTO GRADECATEGORY VALUES (7, 188, 'Quizzes', 10.00, 0, 'Course quizzes');
INSERT INTO GRADECATEGORY VALUES (8, 188, 'Projects', 20.00, 0, 'Course projects');
INSERT INTO GRADECATEGORY VALUES (9, 188, 'Midterm Exam', 20.00, 0, 'Midterm examination');
INSERT INTO GRADECATEGORY VALUES (10, 188, 'Final Exam', 30.00, 0, 'Comprehensive final exam');
INSERT INTO GRADECATEGORY VALUES (11, 411, 'Homework', 20.00, 1, 'Homework assignments');
INSERT INTO GRADECATEGORY VALUES (12, 411, 'Quizzes', 10.00, 0, 'Course quizzes');
INSERT INTO GRADECATEGORY VALUES (13, 411, 'Projects', 20.00, 0, 'Course projects');
INSERT INTO GRADECATEGORY VALUES (14, 411, 'Midterm Exam', 20.00, 0, 'Midterm examination');
INSERT INTO GRADECATEGORY VALUES (15, 411, 'Final Exam', 30.00, 0, 'Comprehensive final exam');