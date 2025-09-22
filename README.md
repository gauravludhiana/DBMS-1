# Mini Database System for an Online Food Delivery App

## 1. Project Overview

This project is a small-scale relational database system designed to model the core operations of an online food delivery application. [cite_start]The objective is to demonstrate practical SQL skills by designing a schema, implementing the database, and running meaningful queries against it[cite: 3, 4]. This system manages data for customers, restaurants, menus, and orders.

## 2. Database Schema (ER Diagram)

The database is designed around five core entities that represent the main components of a food delivery service. The relationships (One-to-Many and Many-to-Many) are established using primary and foreign keys.

* **Entities**:
    * `Customers`: Stores user information.
    * `Restaurants`: Stores information about partner restaurants.
    * `MenuItems`: Contains details of all food items offered by restaurants.
    * `Orders`: Records all transactions placed by customers.
    * `OrderItems`: A junction table linking `Orders` and `MenuItems` to handle many-to-many relationships.

## 3. SQL Scripts

The project includes the following SQL files:

* **`database_schema.sql`**: Contains all the `CREATE TABLE` statements with primary and foreign key constraints to build the database structure.
* [cite_start]**`database_data.sql`**: Contains `INSERT` statements to populate the tables with at least 20 rows of sample data[cite: 20].
* [cite_start]**`queries.sql`**: Contains 5 meaningful queries designed to retrieve useful business information from the database[cite: 21].

### Example Queries

Here are the five queries included in the `queries.sql` file:

1.  **Show a list of all registered customers.**
    ```sql
    SELECT FirstName, LastName, Email FROM Customers;
    ```
2.  **Show all the different types of cuisine available.**
    ```sql
    SELECT DISTINCT CuisineType FROM Restaurants;
    ```
3.  **Find the price of a 'Pepperoni Pizza'.**
    ```sql
    SELECT Name, Price FROM MenuItems WHERE Name = 'Pepperoni Pizza';
    ```
4.  **List all orders that were successfully delivered.**
    ```sql
    SELECT OrderID, OrderDate, TotalAmount FROM Orders WHERE Status = 'Delivered';
    ```
5.  **Find a restaurant by its name.**
    ```sql
    SELECT * FROM Restaurants WHERE Name = 'Curry House';
    ```

## 4. How to Set Up and Run

1.  **Prerequisites**: Make sure you have a running SQL database server (like MySQL, PostgreSQL, or SQLite).
2.  **Clone the Repository**:
    ```sh
    git clone https://github.com/gauravludhiana/DBMS-1/
    ```
3.  **Build the Database**: Connect to your database server using a tool like MySQL Workbench, DBeaver, or the command line. Execute the `database_schema.sql` script to create the tables.
4.  **Populate the Database**: Run the `database_data.sql` script to insert the sample data into the tables.
5.  **Run Queries**: Execute the `queries.sql` script to see the results of the sample business queries.


Video: https://drive.google.com/file/d/1OkRJ_z27bE11mnBSJfeA0p1B1cUdxoyX/view?usp=sharing
