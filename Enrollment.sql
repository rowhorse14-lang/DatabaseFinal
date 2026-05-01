CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    student_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    final_grade DECIMAL(5,2),

    FOREIGN KEY (course_id) REFERENCES COURSE(Course_ID),

    FOREIGN KEY (student_id) REFERENCES Student(student_id),

    UNIQUE (course_id, student_id)
);

-- insert
INSERT INTO Enrollment VALUES (1, 101, 8, DATE '2026-01-15', NULL);
INSERT INTO Enrollment VALUES (2, 101, 6, DATE '2026-01-15', NULL);
INSERT INTO Enrollment VALUES (3, 101, 13, DATE '2026-01-15', NULL);
INSERT INTO Enrollment VALUES (4, 101, 19, DATE '2026-01-15', NULL);
INSERT INTO Enrollment VALUES (5, 101, 1, DATE '2026-01-15', NULL);

-- fetch
SELECT * FROM Enrollment;