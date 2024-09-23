CREATE DATABASE CourierManagement;
USE CourierManagement;
-- task 1
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20),
    Address TEXT
);
CREATE TABLE Couriers (
    CourierID INT PRIMARY KEY AUTO_INCREMENT,
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    Weight DECIMAL(5, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    DeliveryDate DATE
);
CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100) NOT NULL,
    Cost DECIMAL(8, 2) NOT NULL
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100),
    Address TEXT
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);
INSERT INTO Users (Name, Email, Password, ContactNumber, Address)
VALUES 
('Rahul Kumar', 'rahul@example.com', 'password123', '9876543210', 'Bhopal, India'),
('Sita Patel', 'sita@example.com', 'password456', '9123456780', 'Mumbai, India');

INSERT INTO Couriers (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) 
VALUES 
('Rahul Kumar', 'Bhopal, India', 'Sita Patel', 'Mumbai, India', 5.50, 'In Transit', 'TN12345', '2024-09-19'),
('Amit Verma', 'Delhi, India', 'Rahul Kumar', 'Bhopal, India', 10.00, 'Delivered', 'TN67890', '2024-09-18');
 
INSERT INTO Employees (Name, Email, ContactNumber, Role, Salary)
VALUES 
('Vikram Rao', 'vikram@courier.com', '9876541230', 'Courier Manager', 50000.00),
('Meera Sharma', 'meera@courier.com', '9123456781', 'Delivery Person', 25000.00);
INSERT INTO CourierServices (ServiceName, Cost) 
VALUES 
('Standard Delivery', 100.00),
('Express Delivery', 250.00),
('Same-Day Delivery', 500.00);

INSERT INTO Locations (LocationName, Address) 
VALUES 
('Bhopal Office', 'Bhopal, MP, India'),
('Mumbai Office', 'Mumbai, MH, India'),
('Delhi Office', 'Delhi, DL, India');

INSERT INTO Payments (CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 150.00, '2024-09-19'),  
(2, 2, 200.00, '2024-09-18'), 
(1, 3, 300.00, '2024-09-20');  

-- task 2
SELECT * FROM Users;
SELECT * FROM Couriers WHERE SenderName = 'Rahul Kumar'; 
SELECT * FROM Couriers;
SELECT * FROM Couriers WHERE TrackingNumber = 'TN12345';
SELECT * FROM Couriers WHERE Status = 'Delivered' AND Weight=  10.00; 
SELECT * FROM Couriers WHERE Status != 'Delivered';
SELECT * FROM Couriers WHERE DeliveryDate = CURDATE();
SELECT * FROM Couriers WHERE Status = 'In Transit';
SELECT CourierID, COUNT(*) AS TotalPackages FROM Couriers GROUP BY CourierID;
SELECT CourierID, AVG(DATEDIFF(DeliveryDate, '2024-09-01')) AS AverageDeliveryTime 
FROM Couriers 
WHERE DeliveryDate IS NOT NULL
GROUP BY CourierID;

SELECT * FROM Couriers WHERE Weight BETWEEN 2.00 AND 10.00;
SELECT * FROM Employees WHERE Name LIKE '%ra%';
SELECT C.* 
FROM Couriers C
JOIN Payments P ON C.CourierID = P.CourierID
WHERE P.Amount > 50;





