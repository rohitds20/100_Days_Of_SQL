# 🏏 ICC World Cup Match Analysis - PostgreSQL Project

## 📋 Problem Statement

Analyze the performance of cricket teams using the `iccworldcup` table containing match records. For each team, calculate:

| Metric | Description |
|--------|-------------|
| **Total Matches Played** | Count of all matches where team appeared as team1 or team2 |
| **Total Matches Won** | Count of matches won by the team |
| **Total Matches Lost** | Count of matches lost by the team |

**Output Requirements:**
- Results ordered by matches won (descending)
- Include all teams that participated in matches

---

## 🗃️ Database Setup

### Table Schema
```sql
CREATE TABLE hundred_days_of_sql.iccworldcup (
    team1 VARCHAR(20),
    team2 VARCHAR(20),
    winner VARCHAR(20)
);
```

### Sample Data
```sql
INSERT INTO hundred_days_of_sql.iccworldcup (team1, team2, winner) VALUES
('India', 'SL', 'India'),
('SL', 'Aus', 'Aus'),
('SA', 'Eng', 'Eng'),
('Eng', 'NZ', 'NZ'),
('Aus', 'India', 'India');
```

---

## 📊 Expected Output Format

| Team_Name | Matches_Played | Matches_Won | Matches_Lost |
|-----------|----------------|-------------|--------------|
|    ...    |    ...         |    ...      |     ...      |

---

## 💡 Solution Approach

1. **Identify all unique teams** from both `team1` and `team2` columns
2. **Count total matches** for each team (appearances in either column)
3. **Count wins** where team name matches the `winner` column
4. **Calculate losses** as `Total Matches - Wins`
5. **Order results** by wins descending

---

## 🎯 Key Considerations

- Teams can appear in either `team1` or `team2` columns
- Use `UNION` or `CTE` to handle team appearances in both columns
- Ensure accurate counting without double-counting matches
- Handle cases where winner might be different from team1/team2 values

---

