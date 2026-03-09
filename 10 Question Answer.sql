-- Soal No 1
SELECT 
	SD.SalesID, 
	C.CustomerName, 
	COUNT(SD.PetID) AS [PetBought]
FROM SalesDetails SD
JOIN
	Sales S ON SD.SalesID = S.SalesID
JOIN
	Customer C ON S.CustomerID = C.CustomerID
WHERE YEAR(C.CustomerDOB) = 2000
GROUP BY SD.SalesID, C.CustomerName
HAVING COUNT(SD.PetID) > 1;

-- Soal No 2
SELECT 
	LEFT(CustomerName, CHARINDEX(' ', CustomerName)) AS [Buyer's Name],
	SUM(P.PetPrice) AS [MoneySpent]
FROM Customer C
JOIN
	Sales S ON C.CustomerID = S.CustomerID
JOIN
	SalesDetails SD ON S.SalesID = SD.SalesID
JOIN 
	Pet P ON SD.PetID = P.PetID
WHERE CustomerName LIKE 'A%'
GROUP BY CustomerName
HAVING SUM(P.PetPrice) > 7000;

-- Soal no 3
SELECT 
	LOWER(CustomerName) AS [Customer Name],
	SUM(P.PetPrice) AS [TotalSales],
	MIN(S.SalesDate) AS [EarliestPurchaseDate]
FROM Customer C
JOIN
	Sales S ON C.CustomerID = S.CustomerID
JOIN
	SalesDetails SD ON S.SalesID = SD.SalesID
JOIN 
	Pet P ON SD.PetID = P.PetID
WHERE LEN(CustomerName) < 12
GROUP BY CustomerName
HAVING SUM(P.PetPrice) < 15000
ORDER BY SUM(P.PetPrice) DESC;

-- Soal no 4
SELECT 
	UPPER(SupplierName) AS [SupplierName],
	SupplierEmail,
	COUNT(PD.PetID) AS [TotalPetsSupplied],
	AVG(P.PetAge) AS [AveragePetAge]
FROM Supplier SP
JOIN
	Purchase PH ON SP.SupplierID = PH.SupplierID
JOIN
	PurchaseDetails PD ON PH.PurchaseID = PD.PurchaseID
JOIN
	Pet P ON PD.PetID = P.PetID
WHERE LEN(SupplierName) > 12
GROUP BY SupplierName, SupplierEmail, PetName
HAVING ROUND(AVG(P.PetAge), 1) > 0;

-- Soal no 5
SELECT 
	PC.PurchaseID,
	LOWER(PT.PetName) AS [Pet Name],
	PT.PetAge,
	DATEADD(MONTH, 1, PC.PurchaseDate) AS [Vaccination Deadline]
FROM Pet PT
JOIN 
	PurchaseDetails PD ON PT.PetID = PD.PetID
JOIN 
	Purchase PC ON PD.PurchaseID = PC.PurchaseID
WHERE DATENAME(QUARTER, PC.PurchaseDate) = '1'
AND PT.PetAge < (SELECT AVG(p.PetAge) FROM (
	SELECT PetAge FROM Pet
)p);

-- Soal no 6
SELECT 
	REPLACE(SalesID, 'SA', 'Sale-') AS [Sale Number],
	P.PetName,
	UPPER(PT.PetTypeName) AS [Pet Type],
	CAST(PetAge AS VARCHAR ) + '  year(s) old' AS [Pet Age]
FROM
	SalesDetails SD
JOIN 
	Pet P ON SD.PetID = P.PetID
JOIN 
	PetType PT ON P.PetTypeID = PT.PetTypeID
WHERE P.PetAge > (SELECT MAX(p.PetAge) FROM (
	SELECT * FROM Pet)p 
WHERE P.PetGender LIKE 'M');

-- Soal no 7
SELECT
	REPLACE(PetID, 'PE', 'PET') AS [Pet Code],
	PetName,
	PT.PetTypeName,
	'$' + CAST(PetPrice AS varchar) AS [Price]
FROM Pet P 
JOIN
	PetType PT ON P.PetTypeID = PT.PetTypeID
WHERE
	(P.PetPrice = (SELECT MAX(p.PetPrice) FROM (
		SELECT * FROM Pet)p
	) 
     OR P.PetPrice = (SELECT MIN(p.PetPrice) FROM (
		SELECT * FROM Pet)p
	))
    AND LEN(P.PetName) < 15;

-- Soal no 8
SELECT 
	REPLACE(P.PetTypeID, 'PT', '') AS [Type Number],
	UPPER(PT.PetTypeName) AS [Pet Type Name],
	CAST(SUM(PetPrice) AS varchar) + ' Dollar' AS [Above Average Pet Sum]
FROM Pet P 
JOIN
	PetType PT ON P.PetTypeID = PT.PetTypeID
WHERE LEFT(PetName, 1) IN('b', 't', 'c')
GROUP BY P.PetTypeID, PT.PetTypeName
HAVING SUM(P.PetPrice) > (SELECT AVG(p.PetPrice) FROM (
	SELECT * FROM Pet)p
	);

-- Soal no 9
CREATE VIEW Total_Purchase_and_oldest_pet_view AS
SELECT 
	REPLACE(P.PurchaseID, 'PU', 'Purchase-') AS [Purchase Number],
	COUNT(PT.PetID) AS [Total Pets],
	CAST(MAX(PT.PetAge) AS varchar) + ' years old' AS [Oldest Pet Age]
FROM Purchase P
JOIN
	PurchaseDetails PD ON P.PurchaseID = PD.PurchaseID
JOIN
	Pet PT ON PD.PetID = PT.PetID
GROUP BY 
    P.PurchaseID
HAVING 
    COUNT(PT.PetID) > 1
    AND MAX(PT.PetAge) > 2;

DROP VIEW Total_Purchase_and_oldest_pet_view;

SELECT * FROM Total_Purchase_and_oldest_pet_view;

-- Soal no 10
CREATE VIEW loyal_customer_view AS 
SELECT 
	CustomerName,
	CAST(COUNT(SD.PetID) AS VARCHAR) + ' pet(s)' AS [Pet Bought],
	MIN(S.SalesDate) AS [First Transaction]
FROM Customer C
JOIN
	Sales S ON C.CustomerID = S.CustomerID
JOIN
	SalesDetails SD ON S.SalesID = SD.SalesID
GROUP BY CustomerName
HAVING YEAR(MIN(S.SalesDate)) > 2023
AND COUNT(SD.PetID) > 1;

DROP VIEW loyal_customer_view;

SELECT * FROM loyal_customer_view;