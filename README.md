# Student Gradebook - CSC 44800 Final Project
This repo has the DB final with the authors Riquel Owusu, Nasir Prum and Ezon Bailey

## Team Members 
- Nasir Prum
- Riquel Owusu
- Adanya Bailey

## Project Overview 
Professor David Jones teaches 3 Psychology courses: Introduction to Psychology, Psychology of Language, and Animal Psychology. Eacn course has up to 5 enrolled students and is graded across weighted categories (Homework, Quizzes, Projects, Midterm, and Final). Category weight differs for each course but all add up to 100%. Assignments per category can change. Final grades are computed via weighted category averages.

## Warning 
Might have issues; we had to open it on Oracle to work properly. 

## Folder Structure. 
''''
DataBaseFinal/
├── README.md
│
├── Table/                     ← Table definitions (CREATE)
│   ├── Assignment.sql
│   ├── Courses.sql
│   ├── Enrollment.sql
│   ├── GradeCategory.sql
│   ├── Professor.sql
│   ├── Student.sql
│   └── Submission.sql
|
├── Data/                     ← Sample data (INSERT)
│   ├── insert_professor.sql
│   ├── insert_courses.sql
│   ├── insert_students.sql
│   ├── insert_enrollment.sql
│   ├── insert_gradecategory.sql
│   ├── insert_assignments.sql
│   └── insert_submissions.sql
|
└── Queries/                  ← CRU operations & reports
    ├── read_queries.sql
    ├── update_queries.sql
    └── final_grade_calc.sql

# How to Run
## ORDER MATTERS

## CREATE Tables in this Exact Order
- Professor 
- Courses
- Student
- Enrollment 
- Grade Category 
- Assignment 
- Submission 

## INSERT Data into Tables
- Professor
- Student
- Courses
- Enrollment
- Grade Category 
- Assignment 
- Submissions

## Run these QUeries 
- read_queries
- update_queries
- final_grade_calc

## Master Run 
The file run_all.sql should allow you to run the entire project in the highlighted above instead of going through each file to run the entire project. 

### Requirements
- Oracle SQL (Oracle Live SQL at [livesql.oracle.com](https://livesql.oracle.com) works fine)

### Option A — Run everything at once (SQL*Plus)
```bash
@run_all.sql
```

### Option B — Run manually in Oracle Live SQL
Paste and run files **in this order**:
1. All files in `Queries/` (01 through 07)
2. All files in `data/` (professor → courses → students → enrollment → gradecategory → assignments → submissions)
3. Files in `queries/`

---

## CRU Operations

| Operation | File |
| **Create** | All files in `data/` |
| **Read** | `queries/read_queries.sql` |
| **Update** | `queries/update_queries.sql` |

## DB Concepts Demonstrated

| Concept | Where |
|---|---|
| Primary & Foreign Keys | All schema files |
| CHECK constraints | Enrollment, GradeCategory, Assignment, Submission |
| UNIQUE constraints | Course, Enrollment, Submission |
| Multi-table JOINs (up to 5) | read_queries.sql |
| Aggregate functions (AVG, SUM, ROUND) | read_queries.sql, final_grade_calc.sql |
| Window functions (SUM OVER PARTITION BY) | read_queries.sql Query 4 |
| Subqueries / derived tables | final_grade_calc.sql |
| NULL handling | insert_submissions.sql, read_queries.sql Query 7 |