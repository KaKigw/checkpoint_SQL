## 🛠️ Checkpoint\_SQL

**A collection of T‑SQL scripts and ER diagrams modeling foundational relational database concepts — from basic CRUD structures to an alternate online shop schema.**

---

### 📁 Repository Structure

```
.
├── README.md                   ← This documentation
├── SQL_DDL.sql               ← CREATE TABLE scripts (DDL)
├── SQL_DML.sql               ← INSERT sample data (DML)
├── SQL_DQL.sql               ← Ongoing: SELECT/JOIN/HAVING exercises
├── SQL_Online_Shop.sql       ← Alternative schema for an online shop
└── images/
    └── online_shop_schema.png ← ER diagram for shop schema
```

([github.com][1])

---

### 🧩 Schema Overview

#### Department

* **Num\_S** *(PK)*: Department ID
* **Label**: Department name
* **Manager\_Name**: Name of department manager

#### Employee

* **Num\_E** *(PK)*: Employee ID
* **Name**, **Position**, **Salary**
* **Department\_Num\_S** *(FK → Department.Num\_S)*

#### Project

* **Num\_P** *(PK)*: Project ID
* **Title**, **Start\_Date**, **End\_Date**
* **Department\_Num\_S** *(FK → Department.Num\_S)*

#### Employee\_Project — Junction Table

* **Employee\_Num\_E** *(FK → Employee.Num\_E)*
* **Project\_Num\_P** *(FK → Project.Num\_P)*
* **Role**: Employee’s role in the project
  ([github.com][1], [github.com][2])

---

### 🛠️ Getting Started

1. **Create a new database** in your SQL Client:

   ```sql
   CREATE DATABASE Checkpoint_SQL;
   GO
   ```
2. **Run the DDL script**:

   ```sql
   :r SQL_DDL.sql
   ```

   * Defines tables and FK relationships.
3. **Load sample data**:

   ```sql
   :r SQL_DML.sql
   ```

   * Fills the `Department`, `Employee`, `Project`, `Employee_Project` tables.
4. **Explore & experiment**:

   * Develop `SELECT`, `JOIN`, `GROUP BY`, `HAVING` queries.
   * Try `INSERT`, `UPDATE`, `DELETE` operations safely in a sandbox.

---

### 🔜 Next Steps

* **✅ SQL\_DQL.sql**: Complete query-based exercises.
* **🔧 Constraints & Indexes**: Add `CHECK`, performance indexes.
* **📄 Views & Procedures**: Build reusable reports and stored procedures.
* **🧪 Testing & CI/CD**: Integrate schema validation and CI/CD workflows.
  ([github.com][1])

---

### 📚 Alternate Schema: Online Shop

The `SQL_Online_Shop.sql` file demonstrates an e-commerce database design — checkout the ER diagram in `images/online_shop_schema.png` to explore tables, relationships, and structure for products, customers, orders, and more.
([github.com][1])

---

### 🤝 Contributing

Contributions are warmly welcomed! Consider opening an issue or PR if you would like to:

* Finish or improve the `SQL_DQL.sql` exercises
* Suggest constraints, indexes, or optimized queries
* Enhance sample data or correct issues
  ([github.com][1])

---

### 🚀 Why Use This?

* **For Learners**: A practical, hands-on way to understand relational database design using T‑SQL.
* **Educational Tool**: Great for students, workshops, or self-study to explore data modeling, relational integrity, and query writing.
* **Foundation for Growth**: Easily extendable to include performance improvements or real‑world complexity.

---

### ✅ Quick Start Summary

**Setup**
\:heavy\_check\_mark: `SQL_DDL.sql` → define schema
\:heavy\_check\_mark: `SQL_DML.sql` → insert sample data

**Practice**
\:book: Create & refine your own queries (especially in `SQL_DQL.sql`)
\:gear: Add views, stored procedures, constraints, or indexing

**Extend**
\:globe\_with\_meridians: Experiment with the `Online Shop` schema
\:construction: Integrate with CI/CD & testing

---

## 📣 License & Contact

No license file included—feel free to fork and adapt!
For questions or collaboration, open an [issue](https://github.com/KaKigw/checkpoint_SQL/issues) or connect via Pull Request.

---

Happy querying and empowered schema design! 🎉

[1]: https://github.com/KaKigw/checkpoint_SQL?utm_source=chatgpt.com "GitHub - KaKigw/checkpoint_SQL"
[2]: https://github.com/topics/sql-project?utm_source=chatgpt.com "sql-project · GitHub Topics · GitHub"
