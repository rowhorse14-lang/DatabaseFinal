CREATE TABLE GRADECATEGORY(
    category_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    category_name VARCHAR(20) NOT NULL,
    weight_pct DECIMAL(5,2) CHECK (weight_pct > 0),
    drop_lowest INT DEFAULT 0 CHECK (drop_lowest >= 0),
    description VARCHAR(50),

    FOREIGN KEY (course_id) REFERENCES COURSES(course_id)
);
