/*1. Create a database called NarnesAndBobleBooks with one data file and one transaction log file. 
a. Call the data file NandB_data.mdf. 
b. Call the transaction log file NandB_log.ldf. 
c. Store the files on the C drive in the default location. 
d. Both files should have a starting file size of 10 MB; allow for growth to 25MB and to grow 
by 20% when necessary. */

USE MASTER
GO

CREATE DATABASE  NarnesAndBobleBooks
ON
	(NAME = NandB_data, 
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NandB_data.mdf',
		SIZE = 10MB, 
		MAXSIZE = 25MB, 
		FILEGROWTH = 20% 
		)
LOG ON 
     ( NAME = NandB_log,
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NandB_log.ldf',
		SIZE = 10MB,
		MAXSIZE = 25MB,
		FILEGROWTH = 20%
		)
GO
/*2. Create the following user-defined data types: 
a. ProvinceState that is a fixed-length text string that holds 2 characters. 
b. Country that is a fixed-length text string that holdsS 3 characters.  */
USE NarnesAndBobleBooks
GO

CREATE TYPE ProvinceState FROM CHAR(2) NOT NULL
CREATE TYPE Country FROM CHAR(3)
GO

/*3. Create the following tables in the new database:*/
USE NarnesAndBobleBooks
GO

CREATE TABLE Books (
BookID INT IDENTITY(100,1) NOT NULL, 
BookTitle VARCHAR(75) NOT NULL,
PublisherID INT NOT NULL,
ISBN CHAR(13) NOT NULL, 
AuthorID INT NOT NULL, 
BookPrice MONEY NULL, 
QuantityInStock SMALLINT NOT NULL,
ReleaseDate DATE NULL
)
GO

CREATE TABLE Publishers (
PublisherID INT IDENTITY(300,2) NOT NULL, 
PublisherName VARCHAR(75) NOT NULL,
PublisherCity VARCHAR(30) NOT NULL,
PublisherProvState ProvinceState NULL, 
PublisherCountry Country NOT NULL
)
GO

CREATE TABLE Authors (
AuthorID  INT IDENTITY(500,1) NOT NULL, 
AuthorFirstName VARCHAR(30) NOT NULL, 
AuthorLastName VARCHAR(40) NOT NULL,
AuthorPicture VARBINARY(MAX) NULL
)
GO

CREATE TABLE Customers  (
CustomerID INT IDENTITY(1000, 1) NOT NULL, 
CustomerFirstName VARCHAR(30) NOT NULL, 
CustomerLastName VARCHAR(40) NOT NULL, 
[Customer Address] VARCHAR(80) NULL, 
CustomerPhoneNumber CHAR(14) NULL,
CustomerCity VARCHAR(25) NULL, 
CustomerProvState ProvinceState NOT NULL, 
CustomerCountry Country NOT NULL
) 
GO

CREATE TABLE BookOrders (
OrderID INT IDENTITY(10000,1) NOT NULL, 
CustomerID  INT NOT NULL,
DateOfOrder DATETIME2 NOT NULL, 
DateOfDelivery  DATETIME2 NULL, 
WantsFastShipping BIT NOT NULL
)
GO

CREATE TABLE BookOrderDetails (
OrderDetailsID INT IDENTITY(1,1) NOT NULL,
OrderID  INT NOT NULL, 
BookID INT NOT NULL, 
QuantityOrdered SMALLINT NOT NULL
)
GO
/* 4. Alter the BookTitle field in the Books table to hold 100 characters instead of 75.*/
ALTER TABLE Books
 ALTER COLUMN BookTitle VARCHAR(100) NOT NULL









