use company_db;
select * from employees;
DESC employees;
DROP TABLE employees;
DROP TABLE employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
SELECT AVG(employees_salary) FROM employees;
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
SELECT e.emp_name, e.salary
FROM employees e
JOIN (SELECT AVG(salary) AS avg_sal FROM employees) a
ON e.salary > a.avg_sal;
SELECT 
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg;
SELECT emp_name, department, salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
SELECT emp_name
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);




