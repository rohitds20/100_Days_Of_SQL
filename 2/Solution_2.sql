-- Solution Query: Select employees who earn more than their managers

SELECT
    e.employee_id,
    e.employee_name,
    m.employee_name AS manager_name,
    e.salary,
    m.salary AS manager_salary
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary
ORDER BY e.employee_id;