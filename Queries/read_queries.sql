-- ============================
-- READ QUERIES
-- Demostrates:
--     - Multi-table Joins
--     - Aggregation
--     - GROUP BY and HAVING
--     - Nested subqueries
--     - Null Filtering
-- ============================

-- ── QUERY 1: All professors and their courses ────────────────
-- Concepts: Inner JOIN 

SELECT 'Query 1' From Dual;
SELECT
    p.First_Name || ' ' || p.Last_Name  AS professor_name,
    p.dept,
    c.Course_name,
    c.Course_number,
    c.Semester,
    c.Year
FROM PROFESSOR p
JOIN COURSE c ON p.Professor_ID = c.Professor_ID
ORDER BY c.course_id;


-- ── QUERY 2: All students enrolled in a specific course ──────
-- Concepts: Multi-table JOIN, WHERE filter 

SELECT 'Query 2' from Dual;
SELECT
    s.first_name || ' ' || s.last_name  AS student_name,
    s.major,
    e.enrollment_date,
    e.final_grade
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN COURSE c  ON e.course_id  = c.course_id
WHERE c.course_name = 'Introduction to Psychology'
ORDER BY s.last_name;


-- ── QUERY 3: All scores for a specific student ───────────────
-- Concepts: 5-table JOIN 

SELECT 'Query 3' from Dual;
SELECT
    c.Course_name,
    gc.category_name,
    a.assignment_name,
    a.max_points,
    sub.points_earned,
    sub.submitted_at
FROM Submission sub
JOIN Enrollment e     ON sub.enrollment_id = e.enrollment_id
JOIN Student s        ON e.student_id      = s.student_id
JOIN COURSE c         ON e.course_id       = c.course_id
JOIN Assignment a     ON sub.assignment_id = a.assignment_id
JOIN GRADECATEGORY gc ON a.category_id     = gc.category_id
WHERE s.student_id = 8
ORDER BY c.course_id, gc.category_name, a.due_date;

-- ── QUERY 4: Verify category weights sum to 100% per course ──
-- Concepts: SUM aggregate, GROUP BY, HAVING 

SELECT 'Query 4' from Dual;
SELECT
    c.Course_name,
    SUM(gc.weight_pct) AS total_weight
FROM GRADECATEGORY gc
JOIN COURSE c ON gc.course_id = c.course_id
GROUP BY c.Course_name
HAVING SUM(gc.weight_pct) = 100;


-- ── QUERY 5: Class average score per assignment ──────────────
-- Concepts: AVG, ROUND, GROUP BY 

SELECT 'Query 5' from Dual;
SELECT
    c.Course_name,
    gc.category_name,
    a.assignment_name,
    a.max_points,
    ROUND(AVG(sub.points_earned), 2)                        AS avg_score,
    ROUND(AVG(sub.points_earned / a.max_points) * 100, 2)  AS avg_pct
FROM Submission sub
JOIN Assignment a      ON sub.assignment_id = a.assignment_id
JOIN GRADECATEGORY gc  ON a.category_id     = gc.category_id
JOIN COURSE c          ON gc.course_id      = c.course_id
WHERE sub.points_earned IS NOT NULL
GROUP BY c.Course_name, gc.category_name, a.assignment_name, a.max_points
ORDER BY c.Course_name, gc.category_name;


-- ── QUERY 6: Weighted final grade per student ────────────────
-- Concepts: Nested subquery, weighted SUM, GROUP BY 

SELECT 'Query 6' from Dual;
SELECT
    s.first_name || ' ' || s.last_name  AS student_name,
    c.Course_name,
    ROUND(SUM(
        (cat_scores.earned / cat_scores.max_pts) * gc.weight_pct
    ), 2) AS computed_final_grade
FROM Enrollment e
JOIN Student s         ON e.student_id   = s.student_id
JOIN COURSE c          ON e.course_id    = c.course_id
JOIN GRADECATEGORY gc  ON gc.course_id   = c.course_id
JOIN (
    SELECT
        sub.enrollment_id,
        a.category_id,
        SUM(sub.points_earned)  AS earned,
        SUM(a.max_points)       AS max_pts
    FROM Submission sub
    JOIN Assignment a ON sub.assignment_id = a.assignment_id
    WHERE sub.points_earned IS NOT NULL
    GROUP BY sub.enrollment_id, a.category_id
) cat_scores ON cat_scores.enrollment_id = e.enrollment_id
            AND cat_scores.category_id   = gc.category_id
GROUP BY s.first_name, s.last_name, c.Course_name
ORDER BY c.Course_name, computed_final_grade DESC;


-- ── QUERY 7: Students with missing (ungraded) submissions ────
-- Concepts: NULL filtering, multi-table JOIN 

SELECT 'Query 7' from Dual;
SELECT
    s.first_name || ' ' || s.last_name  AS student_name,
    c.Course_name,
    a.assignment_name,
    a.due_date
FROM Submission sub
JOIN Enrollment e  ON sub.enrollment_id = e.enrollment_id
JOIN Student s     ON e.student_id      = s.student_id
JOIN COURSE c      ON e.course_id       = c.course_id
JOIN Assignment a  ON sub.assignment_id = a.assignment_id
WHERE sub.points_earned IS NULL
ORDER BY c.course_id, a.due_date;


-- ── QUERY 8: Count of enrolled students per course ───────────
-- Concepts: COUNT aggregate, GROUP BY 

SELECT 'Query 8' from Dual;
SELECT
    c.Course_name,
    c.Course_number,
    COUNT(e.student_id) AS total_enrolled
FROM COURSE c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.Course_name, c.Course_number
ORDER BY total_enrolled DESC;
