CREATE TABLE COURSE (
  Course_ID int PRIMARY KEY,
  Professor_ID int NOT NULL,
  Department VARCHAR2(20) NOT NULL,
  Course_number VARCHAR2(8) NOT NULL,
  Course_name VARCHAR2(50) NOT NULL,
  Semester VARCHAR2(25) NOT NULL,
  Year int NOT NULL,
  CONSTRAINT fk_course_professor FOREIGN KEY (Professor_ID) REFERENCES PROFESSOR(Professor_ID)
);

-- fetch 
SELECT * FROM COURSE;