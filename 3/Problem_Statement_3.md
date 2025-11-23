# 🛒 Customer Visit Analysis - PostgreSQL Project

## 📋 Problem Statement

Analyze customer visits using the `customer_orders` table to determine customer behavior patterns. For each order date, calculate:

| Metric | Description |
|--------|-------------|
| **First Visit** | Count of customers visiting for the first time on that date |
| **Repeat Visit** | Count of customers who are repeat visitors on that date |

**Output Requirements:**
- Order date
- Count of first-time visitors
- Count of repeat visitors
- Results ordered by order date

---

## 🗃️ Database Setup

### Table Schema
```sql
CREATE TABLE hundred_days_of_sql.customer_orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE,
    order_amount INTEGER
);
```

### Sample Data
```sql
INSERT INTO hundred_days_of_sql.customer_orders VALUES
(1, 100, CAST('2022-01-01' AS DATE), 2000),
(2, 200, CAST('2022-01-01' AS DATE), 2500),
(3, 300, CAST('2022-01-01' AS DATE), 2100),
(4, 100, CAST('2022-01-02' AS DATE), 2000),
(5, 400, CAST('2022-01-02' AS DATE), 2200),
(6, 500, CAST('2022-01-02' AS DATE), 2700),
(7, 100, CAST('2022-01-03' AS DATE), 3000),
(8, 400, CAST('2022-01-03' AS DATE), 1000),
(9, 600, CAST('2022-01-03' AS DATE), 3000);
```

---

## 📊 Expected Output Format

| Order_Date | First_Visit | Repeat_Visit |
|------------|-------------|--------------|
| 2022-01-01 | 3           | 0            |
| 2022-01-02 | 2           | 1            |
| 2022-01-03 | 1           | 2            |

---

## 💡 Solution Approach

1. **Identify first visit date** for each customer using `MIN(order_date)` grouped by customer
2. **Join with original table** to compare each order date with customer's first visit
3. **Categorize visits** as first or repeat based on comparison
4. **Count visitors** for each category per order date
5. **Group results** by order date and order chronologically

---

## 🎯 Key Considerations

- Use window functions or subquery to find each customer's first order date
- Compare each order's date with the customer's minimum order date
- Use `CASE` statements to categorize visits as first or repeat
- Handle customers with multiple orders on the same date
- Ensure accurate counting without duplicates per date

---
