# 💼 Employee Salary Comparison - PostgreSQL Project

## 📋 Problem Statement

Analyze employee-manager relationships using the `employees` table. Find all employees who earn a higher salary than their respective managers.

**Output Requirements:**
- Employee ID
- Employee Name
- Manager Name
- Employee Salary
- Manager Salary
- Include only employees earning more than their managers

---

## 🗃️ Database Setup

### Table Schema
```sql
CREATE TABLE hundred_days_of_sql.employees (
    employee_id INT,
    employee_name VARCHAR(10),
    salary INT,
    manager_id INT
);
```

### Sample Data
```sql
INSERT INTO hundred_days_of_sql.employees (employee_id, employee_name, salary, manager_id) VALUES
(1, 'Ankit', 10000, 4),
(2, 'Mohit', 15000, 5),
(3, 'Vikas', 10000, 4),
(4, 'Rohit', 5000, 2),
(5, 'Mudit', 12000, 6),
(6, 'Agam', 12000, 2),
(7, 'Sanjay', 9000, 2),
(8, 'Ashish', 5000, 2);
```

---

## 📊 Expected Output Format

| Employee_ID | Employee_Name | Manager_Name | Employee_Salary | Manager_Salary |
|-------------|---------------|--------------|-----------------|----------------|
| 1           | Ankit         | Rohit        | 10000           | 5000           |
| 2           | Mohit         | Mudit        | 15000           | 12000          |
| 3           | Vikas         | Rohit        | 10000           | 5000           |

---

## 💡 Solution Approach

1. **Self-join** the employees table to link employees with their managers
2. **Match** employee's `manager_id` with manager's `employee_id`
3. **Filter** records where employee salary > manager salary
4. **Select** required columns from both employee and manager records

---

## 🎯 Key Considerations

- Use `SELF JOIN` to connect employees with their managers
- Handle the `manager_id` reference to `employee_id`
- Ensure proper column aliasing to distinguish employee vs manager data
- Consider employees without managers (NULL manager_id)

---

