CREATE TABLE ENROLLMENT (
  enrollment_id INT PRIMARY KEY,
  course_id INT NOT NULL,
  student_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  final_grade DECIMAL(5,2),
  CONSTRAINT fk_enroll_course FOREIGN KEY (course_id) REFERENCES COURSE(Course_ID),
  CONSTRAINT fk_enroll_student FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
  UNIQUE (course_id, student_id)
);


-- fetch
SELECT * FROM ENROLLMENT;