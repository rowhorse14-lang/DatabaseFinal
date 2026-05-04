-- ===============================================================
-- UPDATE QUERIES 
-- Run Select before and after each UPDATE to verify changes
-- ===============================================================

-- ── UPDATE 1: Correct a student's assignment score ───────────

SELECT 'Update 1' from Dual;
-- Before
SELECT * FROM Submission WHERE enrollment_id = 1 AND assignment_id = 1;

UPDATE Submission
SET points_earned = 97.00,
    submitted_at  = CURRENT_TIMESTAMP
WHERE enrollment_id = 1 AND assignment_id = 1;

-- After
SELECT * FROM Submission WHERE enrollment_id = 1 AND assignment_id = 1;

-- ── UPDATE 2: Set a student's final grade ────────────────────

SELECT 'Update 2' from Dual;
-- Before
SELECT * FROM Enrollment WHERE enrollment_id = 1;

UPDATE Enrollment
SET final_grade = 91.50
WHERE enrollment_id = 1;

-- After
SELECT * FROM Enrollment WHERE enrollment_id = 1;

-- ── UPDATE 3: Update a student's email ──────────────────────

SELECT 'Update 3' from Dual;
-- Before
SELECT * FROM Student WHERE student_id = 8;

UPDATE Student
SET email = 'fwbrown@villanova.edu'
WHERE student_id = 8;

-- After
SELECT * FROM Student WHERE student_id = 8;


-- ── UPDATE 4: Professor adjusts a category weight ────────────

SELECT 'Update 4' from Dual;
-- Before
SELECT * FROM GRADECATEGORY WHERE course_id = 101;

UPDATE GRADECATEGORY
SET weight_pct = 25.00
WHERE category_id = 5;   -- Final Exam: 30 → 25

UPDATE GRADECATEGORY
SET weight_pct = 25.00
WHERE category_id = 1;   -- Homework: 20 → 25
                          -- Total still = 100%
-- After
SELECT * FROM GRADECATEGORY WHERE course_id = 101;

