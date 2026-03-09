INSERT INTO Customer (CustomerID, CustomerName, CustomerEmail, CustomerDOB, CustomerPhone) 
VALUES 
('CU001', 'John Doe', 'john.doe@gmail.com', '2000-01-01', '08123456'),
('CU002', 'Jane Smith', 'jane.smith@gmail.com', '1999-05-05', '08134567'),
('CU003', 'Alice Johnson', 'alice.johnson@gmail.com', '2000-08-08', '08245678'),
('CU004', 'Bob Brown', 'bob.brown@gmail.com', '2005-02-02', '08556789'),
('CU005', 'Charlie Davis', 'charlie.davis@gmail.com', '1989-03-03', '08198567'),
('CU006', 'Diana Evans', 'diana.evans@gmail.com', '2002-04-04', '08567094'),
('CU007', 'Aether Foster', 'aether.foster@gmail.com', '1988-07-07', '08219854'),
('CU008', 'Fiona Green', 'fiona.green@gmail.com', '2000-09-09', '08212387'),
('CU009', 'Ashiapman Harris', 'ashiapman.harris@mail.com', '2006-10-10', '08531312'),
('CU010', 'Hannah Ingram', 'hannah.ingram@gmail.com', '2000-11-11', '08128936')

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierDOB, SupplierPhone) 
VALUES
('SU001', 'Andi Setiawan', 'andi.setiawan@gmail.com', '1990-03-15', '08123489'),
('SU002', 'Budi Santoso', 'budi.santoso@gmail.com', '1995-07-20', '08237890'),
('SU003', 'Citra Dewi', 'citra.dewi@gmail.com', '1992-01-25', '08545901'),
('SU004', 'Dewi Lestari', 'dewi.lestari@gmail.com', '1993-06-30', '08189012'),
('SU005', 'Eko Prabowo', 'eko.prabowo@gmail.com', '1989-02-14', '08267123'),
('SU006', 'Fahmi Rizki', 'fahmi.rizki@gmail.com', '2000-09-10', '08578234'),
('SU007', 'Gita Sari', 'gita.sari@gmail.com', '2000-11-22', '08182345'),
('SU008', 'Hendra Gunawan', 'hendra.gunawan@gmail.com', '2001-04-05', '08293452'),
('SU009', 'Indah Permata', 'indah.permata@gmail.com', '2003-12-30', '08501567'),
('SU010', 'Joko Widodo', 'joko.widodo@gmail.com', '2005-03-18', '08112378')

INSERT INTO PetType (PetTypeID, PetTypeName)
VALUES
('PT001', 'Anjing'),
('PT002', 'Kucing'),
('PT003', 'Burung'),
('PT004', 'Ikan'),
('PT005', 'Kelinci'),
('PT006', 'Hamster'),
('PT007', 'Kadal'),
('PT008', 'Kura-kura'),
('PT009', 'Tikus'),
('PT010', 'Babi')

INSERT INTO Pet (PetID, PetName, PetTypeID, PetPrice, PetAge, PetGender) 
VALUES
('PE001', 'Shiro', 'PT001', 6000, 2, 'M'),
('PE002', 'Navy', 'PT002', 7200, 3, 'F'),
('PE003', 'Brenda', 'PT003', 5000, 1, 'M'),
('PE004', 'Lili', 'PT004', 3700, 1, 'F'),
('PE005', 'Robby', 'PT005', 1000, 2, 'M'),
('PE006', 'Pookie', 'PT006', 2500, 1, 'F'),
('PE007', 'Eky', 'PT007', 2300, 7, 'F'),
('PE008', 'Dorly', 'PT008', 1250, 5, 'M'),
('PE009', 'Blacky', 'PT009', 5650, 1, 'M'),
('PE010', 'Ling', 'PT010', 4000, 3, 'M')

INSERT INTO Sales (SalesID, CustomerID, SalesDate)
VALUES
('SA001', 'CU001', '2019-02-15'),
('SA002', 'CU002', '2019-03-10'),
('SA003', 'CU003', '2019-04-25'),
('SA004', 'CU004', '2020-05-30'),
('SA005', 'CU005', '2020-06-14'),
('SA006', 'CU006', '2021-07-19'),
('SA007', 'CU007', '2021-08-22'),
('SA008', 'CU008', '2022-09-05'),
('SA009', 'CU009', '2022-10-11'),
('SA010', 'CU010', '2024-11-16'),
('SA011', 'CU002', '2024-05-20'),
('SA012', 'CU010', '2024-07-04'),
('SA013', 'CU006', '2024-07-16'),
('SA014', 'CU008', '2024-08-10'),
('SA015', 'CU010', '2024-11-26')

INSERT INTO Purchase (PurchaseID, SupplierID, PurchaseDate) 
VALUES
('PU001', 'SU001', '2024-01-10'),
('PU002', 'SU002', '2024-02-20'),
('PU003', 'SU003', '2024-03-15'),
('PU004', 'SU004', '2023-04-25'),
('PU005', 'SU005', '2021-05-30'),
('PU006', 'SU006', '2021-06-18'),
('PU007', 'SU007', '2022-07-22'),
('PU008', 'SU008', '2022-08-17'),
('PU009', 'SU009', '2024-09-12'),
('PU010', 'SU010', '2024-10-14'),
('PU011', 'SU008', '2024-01-10'),
('PU012', 'SU005', '2024-01-23'),
('PU013', 'SU009', '2024-02-03'),
('PU014', 'SU007', '2024-02-14'),
('PU015', 'SU002', '2024-03-07')


INSERT INTO SalesDetails (SalesID, PetID) 
VALUES
('SA001', 'PE002'),
('SA002', 'PE010'),
('SA002', 'PE003'),
('SA003', 'PE004'),
('SA003', 'PE006'),
('SA004', 'PE005'),
('SA004', 'PE008'),
('SA005', 'PE007'), 
('SA005', 'PE009'),
('SA005', 'PE008'),
('SA005', 'PE010'),
('SA006', 'PE003'),
('SA006', 'PE010'),
('SA006', 'PE001'),
('SA006', 'PE004'),
('SA006', 'PE009'),
('SA007', 'PE010'),
('SA007', 'PE002'),
('SA008', 'PE001'),
('SA008', 'PE003'),
('SA009', 'PE001'),
('SA009', 'PE008'),
('SA010', 'PE007'),
('SA010', 'PE009'),
('SA010', 'PE002'),
('SA010', 'PE003'),
('SA011', 'PE007'),
('SA011', 'PE009'),
('SA012', 'PE002'),
('SA013', 'PE009'),
('SA014', 'PE009'),
('SA015', 'PE009')


INSERT INTO PurchaseDetails (PurchaseID, PetID) 
VALUES
('PU001', 'PE001'),
('PU001', 'PE002'),
('PU002', 'PE001'),
('PU002', 'PE002'),
('PU002', 'PE003'),
('PU003', 'PE007'),
('PU003', 'PE008'),
('PU004', 'PE009'),
('PU004', 'PE010'),
('PU004', 'PE002'),
('PU005', 'PE001'),
('PU005', 'PE003'),
('PU006', 'PE008'),
('PU006', 'PE002'),
('PU006', 'PE009'),
('PU007', 'PE001'),
('PU007', 'PE007'),
('PU008', 'PE001'),
('PU008', 'PE006'),
('PU009', 'PE001'),
('PU009', 'PE005'),
('PU009', 'PE003'),
('PU010', 'PE010'),
('PU010', 'PE006'),
('PU010', 'PE009')


