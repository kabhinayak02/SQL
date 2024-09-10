### 1. **What is the order of execution in SQL?**
   **Answer:**
   The correct order of execution in an SQL query is:
   - `FROM`
   - `WHERE`
   - `GROUP BY`
   - `HAVING`
   - `SELECT`
   - `ORDER BY`
   - `LIMIT`
   
   This order ensures that filtering and grouping are applied before selecting columns and sorting the result.

### 2. **What is the difference between DBMS and RDBMS?**
   **Answer:**
   - **DBMS (Database Management System):** It is a software system that manages and organizes data. Examples: File systems, NoSQL databases.
   - **RDBMS (Relational Database Management System):** It is a type of DBMS that organizes data into tables with rows and columns, and these tables are related to each other through keys. RDBMS enforces rules such as data integrity, relationships, and normalization. Examples: MySQL, PostgreSQL, Oracle.

### 3. **What is a Primary Key?**
   **Answer:**
   A primary key is a unique identifier for a record in a table. It ensures that no duplicate values exist and that the value is not `NULL`.

### 4. **What is a Candidate Key?**
   **Answer:**
   A candidate key is a column or a combination of columns in a table that can uniquely identify any record without any redundancy. The primary key is chosen from the set of candidate keys.

### 5. **What is a Foreign Key?**
   **Answer:**
   A foreign key is a column or a set of columns in one table that refers to the primary key in another table, thereby establishing a relationship between the two tables.

### 6. **What are Constraints and their types?**
   **Answer:**
   Constraints are rules enforced on data columns to ensure the integrity and reliability of the data. Types include:
   - **NOT NULL**
   - **UNIQUE**
   - **PRIMARY KEY**
   - **FOREIGN KEY**
   - **CHECK**
   - **DEFAULT**

### 7. **Explain different types of SQL commands?**
   **Answer:**
   - **DDL (Data Definition Language):** Defines or modifies database structures. (`CREATE`, `ALTER`, `DROP`)
   - **DML (Data Manipulation Language):** Deals with data manipulation. (`SELECT`, `INSERT`, `UPDATE`, `DELETE`)
   - **DCL (Data Control Language):** Controls access to data. (`GRANT`, `REVOKE`)
   - **TCL (Transaction Control Language):** Manages transactions. (`COMMIT`, `ROLLBACK`)
   - **DQL (Data Query Language):** Used to query data. (`SELECT`)

### 8. **Differentiate DELETE, DROP, and TRUNCATE?**
   **Answer:**
   - **DELETE:** Removes specific rows based on a condition. Can be rolled back. Retains table structure.
   - **DROP:** Deletes the entire table including its structure. Cannot be rolled back.
   - **TRUNCATE:** Removes all rows from a table but retains the structure. Cannot be rolled back.

### 9. **Differentiate GROUP BY and ORDER BY?**
   **Answer:**
   - **GROUP BY:** Groups rows that have the same values into summary rows, like aggregating data.
   - **ORDER BY:** Sorts the result set based on one or more columns, either in ascending (`ASC`) or descending (`DESC`) order.

### 10. **Types of Joins and Define them:**
   **Answer:**
   - **INNER JOIN:** Returns records that have matching values in both tables.
   - **LEFT JOIN (or LEFT OUTER JOIN):** Returns all records from the left table and the matched records from the right table.
   - **RIGHT JOIN (or RIGHT OUTER JOIN):** Returns all records from the right table and the matched records from the left table.
   - **FULL JOIN (or FULL OUTER JOIN):** Returns records when there is a match in either table.

### 11. **Nested Queries and Correlated Subqueries:**
   **Answer:**
   - **Nested Query (Subquery):** A query inside another query. It is executed once before the outer query.
   - **Correlated Subquery:** A subquery that depends on the outer query for its values and is evaluated once for each row processed by the outer query.

### 12. **Pattern Matching using LIKE:**
   **Answer:**
   `LIKE` is used for pattern matching in SQL. Wildcards used with `LIKE` are:
   - `%` : Represents zero or more characters.
   - `_` : Represents a single character.
   
   Example:
   ```sql
   SELECT * FROM Employee WHERE name LIKE 'J%';
   ```

### 13. **Select 2nd Highest and N'th Highest Element from Table:**
   - **2nd Highest:**
   ```sql
   SELECT MAX(salary) AS SecondHighestSalary
   FROM Employee
   WHERE salary < (SELECT MAX(salary) FROM Employee);
   ```
   - **N'th Highest:**
   ```sql
   SELECT salary
   FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank FROM Employee) AS ranked
   WHERE rank = N;
   ```

### 14. **What is SQL vs NoSQL?**
   **Answer:**
   - **SQL (Structured Query Language):** Relational database management systems that use structured tables and rows. Follows ACID properties.
   - **NoSQL (Not Only SQL):** Non-relational databases that store data in various formats like key-value pairs, documents, or graphs. Typically used for unstructured or semi-structured data. Examples: MongoDB, Cassandra.

### 15. **Varchar vs Varchar2:**
   **Answer:**
   - **Varchar:** Stores variable-length strings but can behave differently depending on the system.
   - **Varchar2:** Specific to Oracle, used to store variable-length strings with more consistent behavior.

### 16. **Triggers:**
   **Answer:**
   Triggers are special types of stored procedures that automatically execute or "trigger" in response to certain events on a table or view such as `INSERT`, `UPDATE`, or `DELETE`.

   Example:
   ```sql
   CREATE TRIGGER update_salary BEFORE UPDATE ON Employee
   FOR EACH ROW
   BEGIN
     -- Your logic here
   END;
   ```

### 17. **ACID Properties:**
   **Answer:**
   - **Atomicity:** Ensures transactions are all-or-nothing.
   - **Consistency:** Ensures data remains consistent after a transaction.
   - **Isolation:** Ensures transactions do not affect each other.
   - **Durability:** Ensures that once a transaction is committed, it is permanently recorded.

These questions and answers should help you cover essential topics during your interview preparation!