-- Database Creation
create database if not exists onlinedelivery;
use onlinedelivery;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    CuisineType VARCHAR(50),
    Address VARCHAR(255),
    Rating DECIMAL(3, 2)
);

CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantID INT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    RestaurantID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    MenuItemID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);




-- Sample Customers
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address) VALUES
('John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St'),
('Jane', 'Smith', 'jane.smith@email.com', '098-765-4321', '456 Oak Ave');

-- Sample Restaurants
INSERT INTO Restaurants (Name, CuisineType, Address, Rating) VALUES
('Pizza Palace', 'Italian', '789 Pine St', 4.5),
('Curry House', 'Indian', '321 Maple Dr', 4.8);

-- Sample Menu Items
INSERT INTO MenuItems (RestaurantID, Name, Description, Price) VALUES
(1, 'Margherita Pizza', 'Classic cheese and tomato pizza', 12.99),
(1, 'Pepperoni Pizza', 'Pizza with pepperoni topping', 14.99),
(2, 'Chicken Tikka Masala', 'Creamy tomato curry with chicken', 15.50);

-- Sample Orders and OrderItems (must be inserted after customers/restaurants)
INSERT INTO Orders (CustomerID, RestaurantID, TotalAmount, Status) VALUES
(1, 1, 27.98, 'Delivered'),
(2, 2, 15.50, 'Pending');

INSERT INTO OrderItems (OrderID, MenuItemID, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1);


-- Query 1: Show a list of all registered customers.
-- This is a basic check to see all the users in the system.
SELECT
    FirstName,
    LastName,
    Email
FROM
    Customers;

-- Query 2: Show all the different types of cuisine available.
-- This helps users see the variety of food options without duplicates.
SELECT DISTINCT
    CuisineType
FROM
    Restaurants;

-- Query 3: Find the price of a 'Pepperoni Pizza'.
-- A simple lookup to find information about a single menu item.
SELECT
    Name,
    Price
FROM
    MenuItems
WHERE
    Name = 'Pepperoni Pizza';

-- Query 4: List all orders that were delivered successfully.
-- This is useful for viewing the history of completed transactions.
SELECT
    OrderID,
    OrderDate,
    TotalAmount
FROM
    Orders
WHERE
    Status = 'Delivered';

-- Query 5: Find a restaurant by its name.
-- A simple search to get the details of a single restaurant.
SELECT
    *
FROM
    Restaurants
WHERE
    Name = 'Curry House';