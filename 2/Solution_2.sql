-- Solution Query: Select employees who earn more than their managers

SELECT
    e.employee_id    AS Employee_ID,
    e.employee_name  AS Employee_Name,
    m.employee_name  AS Manager_Name,
    e.salary         AS Employee_Salary,
    m.salary         AS Manager_Salary
FROM employees AS e
JOIN employees AS m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary
ORDER BY e.employee_id;