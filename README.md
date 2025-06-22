```markdown
# 📘 Checkpoint_SQL

A collection of T-SQL scripts and diagrams that model a simple company database—tracking departments, employees, projects, and who works on what.

> **Note:** The `SQL_DQL.sql` script is still in progress and not covered here.

---

## 📁 Repository Structure

```text
.
├── .gitattributes
├── .gitignore
├── SQL_DDL.sql            ← CREATE TABLE scripts (DDL)
├── SQL_DML.sql            ← INSERT sample data (DML)
├── SQL_Online_Shop.sql    ← Alternate “online shop” schema
└── images/
    └── online_shop_schema.png  ← ER diagram for the shop schema
```

---

## 🔍 Schema Overview

### Department  
- **Num_S** (PK): Department ID  
- **Label**: Department name  
- **Manager_Name**: Name of the department manager  

### Employee  
- **Num_E** (PK): Employee ID  
- **Name**: Full name  
- **Position**: Job title  
- **Salary**: Monthly salary  
- **Department_Num_S** (FK → Department.Num_S)  

### Project  
- **Num_P** (PK): Project ID  
- **Title**: Project name  
- **Start_Date, End_Date**: Timeline  
- **Department_Num_S** (FK → Department.Num_S)  

### Employee_Project (junction)  
- **Employee_Num_E** (FK → Employee.Num_E)  
- **Project_Num_P** (FK → Project.Num_P)  
- **Role**: What each employee does on the project  

---

## 🖼️ Entity-Relationship Diagram

![Online Shop Schema](images/online_shop_schema.png)

*This is the ER diagram for the alternate “Online Shop” schema (see `SQL_Online_Shop.sql`).*

---

## 🚀 Getting Started

1. **Create a new database**  
   ```sql
   CREATE DATABASE Checkpoint_SQL;
   GO
   ```

2. **Run the DDL script**  
   ```sql
   :r SQL_DDL.sql
   ```
   - Defines tables and foreign-key relationships.

3. **Load sample data**  
   ```sql
   :r SQL_DML.sql
   ```
   - Populates `Department`, `Employee`, `Project`, and `Employee_Project`.

4. **Explore & experiment**  
   - Write `SELECT`, `JOIN`, `GROUP BY`, `HAVING` queries against the tables.  
   - Practice `INSERT`, `UPDATE`, and `DELETE` operations in your sandbox.

---

## 💡 Next Steps

- Add **CHECK** constraints and indexes for data integrity and performance.  
- Create **views** or **stored procedures** for common reports.  
- Flesh out the **SQL_DQL.sql** with query-based exercises (coming soon!).  
- Integrate a CI/CD pipeline or schema validation tests.

---

## 🤝 Contributing

Feel free to open an issue or submit a pull request when you:

- Finish or refine the `SQL_DQL.sql` exercises  
- Spot typos or suggest richer sample data  
- Propose advanced queries, constraints, or optimization tips  

---

*Happy coding & querying!*  
```