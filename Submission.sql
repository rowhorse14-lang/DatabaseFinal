CREATE TABLE Submission (
    submission_id INT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    assignment_id INT NOT NULL,
    points_earned DECIMAL(6,2)
        CHECK (points_earned >= 0),

    submitted_at TIMESTAMP,

    FOREIGN KEY (enrollment_id)
        REFERENCES Enrollment(enrollment_id),

    FOREIGN KEY (assignment_id)
        REFERENCES Assignment(assignment_id),

    UNIQUE (enrollment_id, assignment_id)
);

-- insert
INSERT INTO Submission VALUES (1, 1, 1, 95.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (2, 2, 1, 88.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (3, 3, 1, 92.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (4, 4, 1, 85.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (5, 5, 1, NULL, NULL);
INSERT INTO Submission VALUES(20, 20, 20, 24.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (21, 20, 21, 22.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (22, 20, 22, 96.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (23, 21, 20, 18.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (24, 21, 21, 20.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (25, 21, 22, NULL, NULL);
INSERT INTO Submission VALUES (26, 22, 20, 25.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (27, 22, 21, 24.00, CURRENT_TIMESTAMP);
INSERT INTO Submission VALUES (28, 22, 22, 91.00, CURRENT_TIMESTAMP);
-- fetch
SELECT * FROM Submission;