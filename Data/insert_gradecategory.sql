-- ==================================================
-- INSERT: GRADE_CATEGORY 
-- Each course's weight must sum to exactly 100%
-- 
-- Course 101 (Introduction to Psychology):
--  Homework 15% | Quizzes 10% | Projects 15% | Midterm Exam 25% | Final Exam 35%
-- 
-- Course 188: (Psychology of Language):
--  Homework 20% | Quizzes 15% | Projects 25% | Midterm Exam 15% | Final Exam 25%
-- 
-- Course 411: (Animal Psychology):
--  Homework 10% | Quizzes 20% | Projects 30% | Midterm Exam 20% | Final Exam 20%
-- ================================================== 

-- Course 101: Introduction to Psychology
INSERT INTO GRADECATEGORY VALUES (1, 101, 'Homework', 15.00, 1, 'Homework assignments');
INSERT INTO GRADECATEGORY VALUES (2, 101, 'Quizzes', 10.00, 0, 'Course quizzes');
INSERT INTO GRADECATEGORY VALUES (3, 101, 'Projects', 15.00, 0, 'Course projects');
INSERT INTO GRADECATEGORY VALUES (4, 101, 'Midterm Exam', 25.00, 0, 'Midterm examination');
INSERT INTO GRADECATEGORY VALUES (5, 101, 'Final Exam', 35.00, 0, 'Comprehensive final exam');

-- Course 188: Psychology of Language
INSERT INTO GRADECATEGORY VALUES (6, 188, 'Homework', 20.00, 1, 'Homework assignments');
INSERT INTO GRADECATEGORY VALUES (7, 188, 'Quizzes', 15.00, 0, 'Course quizzes');
INSERT INTO GRADECATEGORY VALUES (8, 188, 'Projects', 25.00, 0, 'Course projects');
INSERT INTO GRADECATEGORY VALUES (9, 188, 'Midterm Exam', 15.00, 0, 'Midterm examination');
INSERT INTO GRADECATEGORY VALUES (10, 188, 'Final Exam', 25.00, 0, 'Comprehensive final exam');

-- Course 411: Animal Psychology
INSERT INTO GRADECATEGORY VALUES (11, 411, 'Homework', 10.00, 1, 'Homework assignments');
INSERT INTO GRADECATEGORY VALUES (12, 411, 'Quizzes', 20.00, 0, 'Course quizzes');
INSERT INTO GRADECATEGORY VALUES (13, 411, 'Projects', 30.00, 0, 'Course projects');
INSERT INTO GRADECATEGORY VALUES (14, 411, 'Midterm Exam', 20.00, 0, 'Midterm examination');
INSERT INTO GRADECATEGORY VALUES (15, 411, 'Final Exam', 20.00, 0, 'Comprehensive final exam');
