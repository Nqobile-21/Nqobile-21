/*------------------------------------------------------------------------------------------------
filename = Creating Database
programmer = Nqobile Rose Mahlangu
description = file will create a Database and Tables with neccessary constraits
---------------------------------------------------------------------------------------------------*/

USE master
GO
IF EXISTS (SELECT name FROM master.dbo.sysdatabases
WHERE name = 'BillionBANK')

BEGIN
    DROP DATABASE BillionBANK
	PRINT 'Database has been deleted'
END
GO
CREATE DATABASE BillionBANK
ON PRIMARY
(
  NAME = BillionBANK_data,
  FILENAME = 'C:\BillionBANK\BillionBANK_data.mdf',
  SIZE = 5MB,
  FILEGROWTH = 10%
 )
 LOG ON 
 (
   NAME = BillionBANK,
   FILENAME = 'C:\BillionBANK\BillionBANK_log.ldf',
   SIZE = 5MB,
   FILEGROWTH = 10%
)
GO

USE BillionBANK
GO

CREATE TABLE Customers
(
CustomersName Varchar(20) NOT NULL,
CustomersSurname Varchar(20) NOT NULL,
CustomersID Varchar(13) NOT NULL,
CustomersAddress VARCHAR(25) NOT NULL,
CustomersEmail VARCHAR(20) NOT NULL,
CustomersPassword Varchar(20) not null,
CustomersPhone BIGINT NOT NULL,
Question VARCHAR(20) NOT NULL,
PRIMARY KEY (CustomersID)
)
CREATE TABLE AccountINFO
(
AccName VARCHAR(15) NOT NULL,
AccDate DATETIME NOT NULL,
AccNum BIGINT IDENTITY (18843567,1) NOT NULL,
AccBalance INT  NOT NULL,
CustomersID BIGINT NOT NULL,
PRIMARY KEY (AccNum),
constraint CustomersID_FK FOREIGN KEY (CustomersID) REFERENCES Customers(CustomersID)
)
CREATE TABLE Transactions
(
TransName VARCHAR(20) NOT NULL,
TransAmount INT NOT NULL,
TransID INT IDENTITY(1,1) NOT NULL,
Reference VARCHAR(20) NOT NULL,
TransDate DATETIME NOT NULL,
AccNum BIGINT NOT NULL,
AccNumFrom BIGINT NOT NULL,
AccNumTo BIGINT NOT NULL,
PRIMARY KEY (TransID),
constraint AccNum_FK FOREIGN KEY (AccNum) REFERENCES AccountINFO(AccNum)
)
GO
