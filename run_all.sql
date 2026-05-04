-- ============================================================
--  RUN ALL — Master execution file
--  Run this file to set up and populate the entire database.
--
--  Order matters:
--    1. Table must be created before inserts
--    2. Parent tables must exist before child tables (FK order)
--    3. Queries and views/triggers run last
-- ============================================================

-- ── Step 1: Create Tables ────────────────────────────────────
@Tables/01_Professor.sql
@Tables/02_Course.sql
@Tables/03_Student.sql
@Tables/04_Enrollment.sql
@Tables/05_GradeCategory.sql
@Tables/06_Assignment.sql
@Tables/07_Submission.sql

-- ── Step 2: Insert Data ──────────────────────────────────────    
@Data/insert_professor.sql
@Data/insert_courses.sql
@Data/insert_students.sql
@Data/insert_enrollment.sql
@Data/insert_gradecategory.sql
@Data/insert_assignments.sql
@Data/insert_submissions.sql

-- ── Step 4: Run Queries ──────────────────────────────────────
@queries/read_queries.sql
@queries/update_queries.sql
@queries/final_grade_calc.sql