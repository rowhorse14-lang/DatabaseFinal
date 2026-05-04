CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY,
    category_id INT NOT NULL,
    assignment_name VARCHAR2(50) NOT NULL,
    max_points DECIMAL(6,2) CHECK (max_points > 0),
    due_date DATE,
    description VARCHAR2(50),

    FOREIGN KEY (category_id) REFERENCES GRADECATEGORY(category_id)
);

