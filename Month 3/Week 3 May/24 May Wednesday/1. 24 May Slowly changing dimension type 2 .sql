
/* STEP 1 database table -- target table */

CREATE TABLE Customer (
  CustomerID INT NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(100),
  StartDate DATE,
  EndDate DATE,
  IsActive BIT
);


INSERT INTO Customer (CustomerID, Name, Email, StartDate, EndDate, IsActive)
VALUES 
  (1, 'John', 'john@email.com', GETDATE(), '9999-12-31', 1),
  (2, 'Alice', 'alice@email.com', GETDATE(), '9999-12-31', 1);

select * from customer;


/////////////////////////////////////////////////////////////////////

/*STEP 2 staging table -- source table */

CREATE TABLE StagingTable (
  CustomerID INT,
  Name VARCHAR(50),
  Email VARCHAR(100),
  StartDate DATE,
  EndDate DATE,
  IsActive BIT
);

INSERT INTO StagingTable (CustomerID, Name, Email, StartDate, EndDate, IsActive)
VALUES
  (1, 'John', 'john@example.com', GETDATE(), '9999-12-31', 1);

  select * from StagingTable;

/////////////////////////////////////////////////////////////////////

/*STEP 3 merge query*/
/*when customer id is matched so active status is 0 */

 MERGE INTO Customer AS target
USING StagingTable AS source
ON target.CustomerID = source.CustomerID
WHEN MATCHED AND (target.Name <> source.Name OR target.Email <> source.Email) THEN
  UPDATE
    SET target.EndDate = GETDATE(),
        target.IsActive = 0
WHEN NOT MATCHED BY TARGET THEN
INSERT (CustomerID, Name, Email, StartDate, EndDate, IsActive)
VALUES (Source.CustomerID, Source.Name, Source.Email, Source.StartDate, '9999-12-31', 1);


////////////////////////////////////////////////////////////
/*STEP 4 insert from staging table to customer table*/

  INSERT INTO Customer (CustomerID, Name, Email, StartDate, EndDate, IsActive)
SELECT
  CustomerID,
  Name,
  Email,
  GETDATE(),
  EndDate,
  IsActive
FROM StagingTable;



////////////////////////////////////////////////////////////

/*STEP 3 another way of doing merge query*/

 MERGE INTO Customer AS target
USING StagingTable AS source
ON target.CustomerID = source.CustomerID
when matched and source.IsActive=1
		then update
		set  target.IsActive = 0;


////////////////////////////////////////////////////////////

/*STEP 4 insert from staging table to customer table*/

INSERT INTO Customer (CustomerID, Name, Email, StartDate, EndDate, IsActive)
SELECT
  CustomerID,
  Name,
  Email,
  GETDATE(),
  EndDate,
  IsActive
FROM StagingTable;

////////////////////////////////////////////////////////////

/*STEP 5 final result*/

  select * from Customer;
  select * from StagingTable;

  