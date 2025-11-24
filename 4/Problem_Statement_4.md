# 🏢 Building Entry Analysis - PostgreSQL Project

## 📋 Problem Statement

Analyze building entry records using the `entries` table to determine visitor patterns and resource usage. For each person, calculate:

| Metric | Description |
|--------|-------------|
| **Most Visited Floor** | The floor number visited most frequently by the person |
| **Total Visits** | Total number of entries made by the person |
| **Resources Used** | Comma-separated list of distinct resources accessed |

**Output Requirements:**
- Person's name
- Most visited floor number
- Total visit count
- List of distinct resources used
- Results showing one row per person

---

## 🗃️ Database Setup

### Table Schema
```sql
CREATE TABLE hundred_days_of_sql.entries (
    name VARCHAR(20),
    address VARCHAR(20),
    email VARCHAR(20),
    floor INT,
    resources VARCHAR(10)
);
```

### Sample Data
```sql
INSERT INTO hundred_days_of_sql.entries (name, address, email, floor, resources) VALUES
('A', 'Bangalore', 'A@gmail.com', 1, 'CPU'),
('A', 'Bangalore', 'A1@gmail.com', 1, 'CPU'),
('A', 'Bangalore', 'A2@gmail.com', 2, 'DESKTOP'),
('B', 'Bangalore', 'B@gmail.com', 2, 'DESKTOP'),
('B', 'Bangalore', 'B1@gmail.com', 2, 'DESKTOP'),
('B', 'Bangalore', 'B2@gmail.com', 1, 'MONITOR');
```
---

## 📊 Expected Output Format

| Name | Most_Visited_Floor | Total_Visits | Resources_Used |
|------|------------------- |--------------|----------------|
| A    | 1                  | 3            | CPU,DESKTOP    |
| B    | 2                  | 3            | DESKTOP,MONITOR|

---

## 💡 Solution Approach

1. **Identify distinct resources** used by each person to avoid duplicates
2. **Aggregate resources** using `STRING_AGG()` to create comma-separated list
3. **Count total visits** for each person across all entries
4. **Determine most visited floor** using `RANK()` window function
5. **Join all metrics** to produce final output with one row per person

---

## 🎯 Key Considerations

- Use `STRING_AGG()` to concatenate resource names into a single string
- Apply `RANK()` or `ROW_NUMBER()` to identify the most frequently visited floor
- Handle ties when multiple floors have the same visit count
- Remove duplicate resources before aggregation
- Use CTEs (Common Table Expressions) for better query organization
- Join multiple aggregated results to combine metrics

---
