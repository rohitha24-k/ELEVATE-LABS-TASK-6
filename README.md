# Subqueries and Nested Queries in SQL

## Objective

This project focuses on mastering **subqueries** and **nested SQL queries** to perform complex data analysis using relational databases. The goal is to understand how subqueries can be embedded in `SELECT`, `WHERE`, and `FROM` clauses to make queries more powerful and dynamic.

##  Tools Used

- MySQL Workbench / DB Browser for SQLite
- Sample schema with `Customers` and `Orders` tables
- SQL for writing subqueries and logical filters

##  Tables Used

- **Customer**: Contains customer information such as ID, name, and city.
- **Orderss**: Contains order details including customer ID, product, and amount spent.

These tables are linked via a foreign key relationship (`CustomerID`) forming a one-to-many relationship (one customer → many orders).

##  Key Concepts Practiced

###  Scalar Subqueries
- Return a single value (like a number or string) used in the outer query.
- Commonly used in `SELECT` or `WHERE` clauses for comparisons and calculations (e.g., total amount spent by a customer).

### Subqueries with `IN`
- Check if a value exists in a set of results returned by the subquery.
- Useful for filtering rows based on a list of IDs or values.

###  Subqueries with `EXISTS`
- Check whether at least one row matches the subquery condition.
- Efficient for large datasets when only the existence of a match is important.

###  Correlated Subqueries
- Subqueries that reference a column from the outer query.
- Executed once for each row of the outer query.
- Often used to compare each row with group-specific aggregates (e.g., orders greater than a customer’s average).

###  Subqueries in `FROM`
- Used to create a temporary table (derived table) for the outer query.
- Ideal for pre-computing grouped or aggregated data before applying filters or joins.

###  Subqueries with `=`, `MAX`, `MIN`, `LIMIT`
- Find specific rows based on aggregate values like the highest or lowest spenders.
- Often used for ranking or top-N results.

##  Skills Gained

- Understanding how subqueries provide intermediate results.
- Mastery of complex filtering logic using nested conditions.
- Ability to compare grouped data using correlated subqueries.
- Ability to embed logic inside a single query without creating multiple steps or views.

##  Deliverables

- SQL queries demonstrating scalar, correlated, and nested subqueries.
- Screenshots showing query execution and output.
- Clean, commented SQL scripts showcasing logic clarity.
