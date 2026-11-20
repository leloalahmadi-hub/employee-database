# Employee Database System

A MySQL project that builds a complete employee database for a company.

The project creates the `employee_db` database and an `employees` table, inserts 10 employee records (ID, name, department, job title, salary, hire date, city, email), then runs queries to:

- Retrieve data with `SELECT`
- Filter data with `WHERE`
- Handle missing values with `IS NULL` / `IS NOT NULL`
- Sort and limit results with `ORDER BY` and `LIMIT`
- Calculate columns: raise amount, salary after raise, annual salary
- Analyze data with aggregate functions: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- Update records safely with `UPDATE` (by `employee_id`)
- Delete a record safely with `DELETE` (with a `WHERE` condition)

Every operation is verified with a `SELECT` before and after.

## How to run

1. Open **MySQL Workbench** and connect to your local server.
2. Open `employee_db_project.sql` (File → Open SQL Script).
3. Run the whole script once (`Ctrl + Shift + Enter`), or statement by statement (`Ctrl + Enter`).

## Tools

- MySQL 8.0
- MySQL Workbench
