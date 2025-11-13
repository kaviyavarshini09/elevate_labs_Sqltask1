CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- 1️⃣ Customer Table
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) UNIQUE,
  Phone VARCHAR(20),
  Address VARCHAR(255)
);

-- 2️⃣ Product Table
CREATE TABLE Product (
  ProductID INT PRIMARY KEY AUTO_INCREMENT,
  ProductName VARCHAR(100) NOT NULL,
  Category VARCHAR(50),
  Price DECIMAL(10,2),
  Stock INT
);

-- 3️⃣ Orders Table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT,
  OrderDate DATE,
  Status VARCHAR(30),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- 4️⃣ OrderItems Table (connects Orders & Products)
CREATE TABLE OrderItems (
  OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  TotalPrice DECIMAL(10,2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- 5️⃣ Payment Table
CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY AUTO_INCREMENT,
  OrderID INT,
  PaymentDate DATE,
  PaymentMethod VARCHAR(50),
  Amount DECIMAL(10,2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customer (CustomerName, Email, Phone, Address)
VALUES
('Aarav Sharma', 'aarav.sharma@gmail.com', '9876543210', 'Delhi, India'),
('Priya Patel', 'priya.patel@yahoo.com', '9123456780', 'Ahmedabad, India'),
('Rahul Verma', 'rahul.verma@gmail.com', '9898989898', 'Bangalore, India'),
('Sneha Iyer', 'sneha.iyer@hotmail.com', '9001122334', 'Chennai, India'),
('Vikram Singh', 'vikram.singh@gmail.com', '9822001122', 'Mumbai, India');

INSERT INTO Product (ProductName, Category, Price, Stock)
VALUES
('Wireless Mouse', 'Electronics', 799.00, 50),
('Bluetooth Headphones', 'Electronics', 1499.00, 30),
('Cotton T-Shirt', 'Fashion', 499.00, 100),
('Sports Shoes', 'Footwear', 2499.00, 25),
('Ceramic Coffee Mug', 'Home & Kitchen', 299.00, 80),
('Smartwatch', 'Electronics', 3999.00, 40),
('Backpack', 'Accessories', 999.00, 60),
('Notebook', 'Stationery', 99.00, 200);

INSERT INTO Orders (CustomerID, OrderDate, Status)
VALUES
(1, '2025-11-10', 'Delivered'),
(2, '2025-11-11', 'Pending'),
(3, '2025-11-11', 'Shipped'),
(4, '2025-11-12', 'Delivered'),
(5, '2025-11-13', 'Processing');

INSERT INTO OrderItems (OrderID, ProductID, Quantity, TotalPrice)
VALUES
(1, 1, 2, 1598.00),   -- 2 Wireless Mouse
(1, 5, 1, 299.00),    -- 1 Coffee Mug
(2, 3, 3, 1497.00),   -- 3 T-Shirts
(3, 2, 1, 1499.00),   -- 1 Bluetooth Headphone
(3, 6, 1, 3999.00),   -- 1 Smartwatch
(4, 4, 1, 2499.00),   -- 1 Sports Shoes
(5, 7, 1, 999.00),    -- 1 Backpack
(5, 8, 5, 495.00);    -- 5 Notebooks

INSERT INTO Payment (OrderID, PaymentDate, PaymentMethod, Amount)
VALUES
(1, '2025-11-10', 'Credit Card', 1897.00),
(2, '2025-11-11', 'UPI', 1497.00),
(3, '2025-11-11', 'Debit Card', 5498.00),
(4, '2025-11-12', 'Net Banking', 2499.00),
(5, '2025-11-13', 'Cash on Delivery', 1494.00);

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Payment;

