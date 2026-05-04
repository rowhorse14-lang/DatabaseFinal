-- ============================================================
--  FINAL GRADE CALCULATION
--  Computes each student's weighted grade per course.
--
--  Formula:
--    For each category:
--      category_score = SUM(points_earned) / SUM(max_points)
--      weighted_score = category_score * weight_pct
--      final_grade = SUM(weighted_score across all categories)
-- ============================================================

SELECT
    s.first_name || ' ' || s.last_name  AS student_name,
    c.Course_name,
    gc.category_name,
    gc.weight_pct,
    ROUND(cat_scores.earned, 2) AS points_earned,
    ROUND(cat_scores.max_pts, 2) AS points_possible,
    ROUND((cat_scores.earned / cat_scores.max_pts) * 100, 2) AS category_pct,
    ROUND((cat_scores.earned / cat_scores.max_pts) * gc.weight_pct, 2) AS weighted_contribution
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
ORDER BY c.Course_name, s.last_name, gc.category_name;


-- ── SUMMARY: Final grade rolled up per student ───────────────
SELECT
    s.first_name || ' ' || s.last_name  AS student_name,
    c.Course_name,
    ROUND(SUM(
        (cat_scores.earned / cat_scores.max_pts) * gc.weight_pct
    ), 2) AS final_grade
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
ORDER BY c.Course_name, final_grade DESC;
