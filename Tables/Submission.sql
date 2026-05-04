CREATE TABLE SUBMISSION (
  submission_id INT PRIMARY KEY,
  enrollment_id INT NOT NULL,
  assignment_id INT NOT NULL,
  points_earned DECIMAL(6,2) CHECK (points_earned >= 0),
  submitted_at TIMESTAMP,
  CONSTRAINT fk_submission_enroll FOREIGN KEY (enrollment_id) REFERENCES ENROLLMENT(enrollment_id),
  CONSTRAINT fk_submission_assignment FOREIGN KEY (assignment_id) REFERENCES ASSIGNMENT(assignment_id),
  UNIQUE (enrollment_id, assignment_id)
);

-- fetch
SELECT * FROM SUBMISSION;