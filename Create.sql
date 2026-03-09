CREATE DATABASE [RYPaws Pet Shop]

CREATE TABLE Customer (
    CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
    CustomerName VARCHAR(100) UNIQUE NOT NULL,
    CustomerEmail VARCHAR(100) NOT NULL CHECK (CustomerEmail LIKE '%@%'),
	CustomerDOB DATE NOT NULL,
    CustomerPhone CHAR(8) UNIQUE NOT NULL CHECK (LEN(CustomerPhone) = 8)
)

CREATE TABLE Supplier (
    SupplierID CHAR(5) PRIMARY KEY CHECK(SupplierID LIKE 'SU[0-9][0-9][0-9]'),
    SupplierName VARCHAR(100) UNIQUE NOT NULL,
    SupplierEmail VARCHAR(100) NOT NULL CHECK (SupplierEmail LIKE '%@%'),
	SupplierDOB DATE NOT NULL,
    SupplierPhone CHAR(8) UNIQUE NOT NULL CHECK (LEN(SupplierPhone) = 8)
)

CREATE TABLE PetType (
    PetTypeID CHAR(5) PRIMARY KEY CHECK(PetTypeID LIKE 'PT[0-9][0-9][0-9]'),
    PetTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE Pet (
    PetID CHAR(5) PRIMARY KEY CHECK(PetID LIKE 'PE[0-9][0-9][0-9]'),
    PetName VARCHAR(100) NOT NULL,
    PetTypeID CHAR(5) FOREIGN KEY REFERENCES PetType(PetTypeID),
    PetPrice DECIMAL(10, 2) NOT NULL,
    PetAge INT NOT NULL,
    PetGender CHAR(1) CHECK (PetGender IN ('M', 'F'))
)

CREATE TABLE Sales (
    SalesID CHAR(5) PRIMARY KEY CHECK(SalesID LIKE 'SA[0-9][0-9][0-9]'),
    CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID),
    SalesDate DATE NOT NULL
)

CREATE TABLE SalesDetails (
    SalesID CHAR(5) FOREIGN KEY REFERENCES Sales(SalesID),
    PetID CHAR(5) FOREIGN KEY REFERENCES Pet(PetID),
    PRIMARY KEY (SalesID, PetID)
)

CREATE TABLE Purchase (
    PurchaseID CHAR(5) PRIMARY KEY CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
    SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID),
    PurchaseDate DATE NOT NULL
)

CREATE TABLE PurchaseDetails (
    PurchaseID CHAR(5) FOREIGN KEY REFERENCES Purchase(PurchaseID),
    PetID CHAR(5) FOREIGN KEY REFERENCES Pet(PetID),
    PRIMARY KEY (PurchaseID, PetID)
)