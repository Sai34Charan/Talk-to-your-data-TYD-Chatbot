DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    joining_date DATE,
    designation VARCHAR(50),
    location VARCHAR(50),
    experience FLOAT
);

INSERT INTO employees (id, name, department, salary, joining_date, designation, location, experience) VALUES
(1, 'Alice', 'HR', 50000, '2019-03-15', 'HR Manager', 'Mumbai', 5.0),
(2, 'Bob', 'Engineering', 75000, '2020-06-01', 'Software Engineer', 'Bangalore', 4.2),
(3, 'Charlie', 'Sales', 60000, '2021-01-20', 'Sales Executive', 'Delhi', 3.5),
(4, 'David', 'Engineering', 85000, '2018-10-05', 'Senior Engineer', 'Hyderabad', 6.1),
(5, 'Eva', 'HR', 52000, '2022-02-12', 'HR Executive', 'Pune', 2.0),
(6, 'Fiona', 'Marketing', 62000, '2020-11-01', 'Marketing Manager', 'Mumbai', 4.8),
(7, 'George', 'Engineering', 85000, '2017-04-10', 'Tech Lead', 'Bangalore', 7.2),
(8, 'Hina', 'Sales', 59000, '2021-08-25', 'Sales Associate', 'Delhi', 3.0),
(9, 'Ishaan', 'Marketing', 70000, '2019-12-15', 'Content Strategist', 'Chennai', 5.6),
(10, 'Jaya', 'HR', 54000, '2023-01-03', 'Recruiter', 'Pune', 1.1),
(11, 'Kevin', 'Sales', 85000, '2016-09-12', 'Sales Manager', 'Delhi', 8.0),
(12, 'Leela', 'Finance', 61000, '2020-03-09', 'Accountant', 'Mumbai', 3.9),
(13, 'Manav', 'Finance', 64000, '2019-07-27', 'Financial Analyst', 'Ahmedabad', 5.2),
(14, 'Nina', 'Engineering', 88000, '2015-05-18', 'Engineering Manager', 'Bangalore', 9.5),
(15, 'Om', 'Engineering', 88000, '2016-02-29', 'Engineering Manager', 'Bangalore', 9.0);

CREATE TABLE employee_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    emergency_contact VARCHAR(100),
    blood_group VARCHAR(5),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employee_details (employee_id, phone_number, email, emergency_contact, blood_group) VALUES
(1, '9876543210', 'alice.hr@company.com', 'John Doe - 9123456789', 'O+'),
(2, '9123456780', 'bob.eng@company.com', 'Sarah Bob - 9876543211', 'A+'),
(3, '9345678901', 'charlie.sales@company.com', 'Mike Charlie - 9234567890', 'B+'),
(4, '9456789012', 'david.eng@company.com', 'Laura David - 9345678901', 'O-'),
(5, '9567890123', 'eva.hr@company.com', 'Peter Eva - 9456789012', 'AB+'),
(6, '9678901234', 'fiona.marketing@company.com', 'Rachel Fiona - 9567890123', 'B-'),
(7, '9789012345', 'george.tech@company.com', 'Nancy George - 9678901234', 'A-'),
(8, '9890123456', 'hina.sales@company.com', 'James Hina - 9789012345', 'O+'),
(9, '9901234567', 'ishaan.marketing@company.com', 'Priya Ishaan - 9890123456', 'B+'),
(10, '9012345678', 'jaya.hr@company.com', 'Anil Jaya - 9901234567', 'O+'),
(11, '9123456789', 'kevin.sales@company.com', 'Rita Kevin - 9012345678', 'AB-'),
(12, '9234567890', 'leela.finance@company.com', 'Sanjay Leela - 9123456789', 'A+'),
(13, '9345678901', 'manav.finance@company.com', 'Deepa Manav - 9234567890', 'O-'),
(14, '9456789012', 'nina.eng@company.com', 'Vikram Nina - 9345678901', 'B+'),
(15, '9567890123', 'om.eng@company.com', 'Kiran Om - 9456789012', 'AB+');

CREATE TABLE employee_projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    project_name VARCHAR(100),
    project_role VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employee_projects (employee_id, project_name, project_role, start_date, end_date) VALUES
(1, 'HR Management System', 'Project Lead', '2022-01-01', '2022-12-31'),
(2, 'E-commerce Platform', 'Backend Developer', '2023-02-01', NULL),
(3, 'CRM Implementation', 'Sales Rep', '2023-03-15', NULL),
(4, 'Cloud Migration', 'Tech Lead', '2022-05-01', '2023-04-30'),
(5, 'Recruitment Portal', 'HR Coordinator', '2023-06-01', NULL),
(6, 'Brand Campaign', 'Campaign Manager', '2022-11-01', '2023-10-31'),
(7, 'AI Initiative', 'Architect', '2021-07-01', '2022-06-30'),
(8, 'Lead Generation', 'Sales Associate', '2023-01-10', NULL),
(9, 'Content Revamp', 'Content Lead', '2022-08-01', '2023-07-31'),
(10, 'Campus Hiring Drive', 'Recruiter', '2023-04-01', NULL),
(11, 'Regional Expansion', 'Sales Manager', '2021-05-01', '2022-12-31'),
(12, 'ERP Upgrade', 'Accountant', '2023-02-01', NULL),
(13, 'Financial Modelling', 'Analyst', '2022-03-01', '2023-02-28'),
(14, 'DevOps Pipeline', 'Engineering Manager', '2021-09-01', '2022-12-31'),
(15, 'System Architecture', 'Engineering Manager', '2022-01-01', NULL);

DROP TABLE IF EXISTS employee_performance;
CREATE TABLE employee_performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    review_date DATE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employee_performance (employee_id, review_date, rating, comments) VALUES
(1, '2022-12-31', 4, 'Exceeds expectations in HR management.'),
(2, '2023-06-30', 3, 'Meets expectations but needs to improve on deadlines.'),
(3, '2023-03-15', 4, 'Strong performance in sales with good client feedback.'),
(4, '2023-04-30', 5, 'Outstanding leadership in cloud migration project.'),
(5, '2023-08-01', 3, 'Satisfactory performance with room for improvement.'),
(6, '2023-10-31', 4, 'Excellent campaign management skills.'),
(7, '2022-06-30', 5, 'Exceptional work in AI initiative.'),
(8, '2023-02-15', 3, 'Good performance but needs to increase lead conversion rate.'),
(9, '2023-07-31', 4, 'Strong content strategy and execution.'),
(10, '2023-05-01', 4, 'Effective recruitment strategies implemented.'),
(11, '2022-12-31', 5, 'Outstanding sales performance in regional expansion.'),
(12, '2023-03-01', 4, 'Good financial reporting and analysis skills.'),
(13, '2023-02-28', 4, 'Strong analytical skills demonstrated in financial modelling.'),
(14, '2022-12-31', 5, 'Exceptional engineering management skills.'),
(15, '2023-01-01', 5, 'Outstanding system architecture design.');



