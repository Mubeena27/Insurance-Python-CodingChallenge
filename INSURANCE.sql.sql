
create database InsuranceManagement

use InsuranceManagement

CREATE DATABASE InsuranceManagementDB;
USE InsuranceManagementDB;

-- Create Users table
CREATE TABLE Users (
    userId INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    role NVARCHAR(50) NOT NULL
);

-- Create Clients table
CREATE TABLE Clients (
    clientId INT PRIMARY KEY IDENTITY(1,1),
    clientName NVARCHAR(100) NOT NULL,
    contactInfo NVARCHAR(100) NOT NULL,
    policy NVARCHAR(100) NOT NULL
);

-- Create Policies table
CREATE TABLE Policies (
    policyId INT PRIMARY KEY IDENTITY(1,1),
    policyName NVARCHAR(100) NOT NULL,
    policyDescription NVARCHAR(255) NOT NULL
);

-- Create Claims table
CREATE TABLE Claims (
    claimId INT PRIMARY KEY IDENTITY(1,1),
    claimNumber NVARCHAR(100) NOT NULL,
    dateFiled DATE NOT NULL,
    claimAmount DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50) NOT NULL,
    clientId INT,
    policy NVARCHAR(100),
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);

-- Create Payments table
CREATE TABLE Payments (
    paymentId INT PRIMARY KEY IDENTITY(1,1),
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(10, 2) NOT NULL,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);



-- Inserting data into Users table
INSERT INTO Users (username, password, role) VALUES
('mubeena', 'password1', 'user'),
('divya', 'password2', 'user'),
('renee', 'password3', 'admin');

-- Inserting data into Clients table
INSERT INTO Clients (clientName, contactInfo, policy) VALUES
('Mubeena Client', 'mubeena@example.com', 'Policy A'),
('Divya Client', 'divya@example.com', 'Policy B'),
('Renee Client', 'renee@example.com', 'Policy C');

-- Inserting data into Policies table
INSERT INTO Policies (policyName, policyDescription) VALUES
('Policy A', 'Description for Policy A'),
('Policy B', 'Description for Policy B'),
('Policy C', 'Description for Policy C');

-- Inserting data into Claims table
INSERT INTO Claims (claimNumber, dateFiled, claimAmount, status, clientId, policy) VALUES
('C123', '2024-01-01', 1500.00, 'Pending', 1, 'Policy A'),
('C124', '2024-01-02', 2000.00, 'Approved', 2, 'Policy B'),
('C125', '2024-01-03', 2500.00, 'Rejected', 3, 'Policy C');

-- Inserting data into Payments table
INSERT INTO Payments (paymentDate, paymentAmount, clientId) VALUES
('2024-01-10', 1500.00, 1),
('2024-01-15', 2000.00, 2),
('2024-01-20', 2500.00, 3);


SELECT * FROM Clients;
SELECT * FROM Users;
SELECT * FROM Claims;
SELECT * FROM Payments;
SELECT * FROM Policies;