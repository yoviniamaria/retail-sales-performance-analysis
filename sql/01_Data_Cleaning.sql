/*
Project : Retail Sales Performance Analysis
Author : Maria Yovinia
Description : Data Quality and Data Cleaning
*/

-- Import database menggunakan load data local infile 
LOAD DATA LOCAL INFILE 'D:/Desktop/New folder (2)/Online_Retail.csv'
INTO TABLE online_retail_v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'local_infile';

-- Total Rows
SELECT COUNT(*)
FROM online_retail_v2;

-- Column Structure dan Data Types
DESCRIBE online_retail_v2;
    
-- InvoiceNo = 0
SELECT*
FROM online_retail_v2
WHERE InvoiceNo = 0;

-- Periksa jumlah invoice 0 dengan qty negatif dan qty positif 
SELECT
COUNT(*) AS qty_invoice_nol,
SUM(CASE WHEN Quantity < 0 THEN 1 ELSE 0 END) AS qty_negatif,
SUM(CASE WHEN Quantity > 0 THEN 1 ELSE 0 END) AS qty_positif
FROM online_retail_v2
WHERE InvoiceNo = 0;

-- Memeriksa InvoiceNo = 0 dengan Qty bernilai positif
SELECT *
FROM online_retail_v2 
WHERE InvoiceNo = 0
AND Quantity > 0;

-- Konversi tipe data InvoiceNo menjadi VARCHAR lalu Re-upload
ALTER TABLE online_retail_v2 
	MODIFY COLUMN InvoiceNo VARCHAR(10);
    
-- Cek Invoice C
SELECT *
FROM online_retail_v2
WHERE InvoiceNo LIKE 'C%'
LIMIT 10;

-- Cek Description = 'Adjust bad debt' (ditemukan saat memeriksa InvoiceNo = 0 dengan Qty bernilai positif)
SELECT *
FROM online_retail_v2
WHERE Description = 'Adjust bad debt';

-- Cek Invoice A 
SELECT *
FROM online_retail_v2 
WHERE InvoiceNo LIKE 'A%';

-- Missing Customer ID
SELECT *
FROM online_retail_v2
WHERE CustomerID = 0;

-- MIN dan MAX tanggal
SELECT
	MIN(
		STR_TO_DATE(InvoiceDate,'%m/%d/%y %H:%i')
	) as min,
	MAX(
		STR_TO_DATE(InvoiceDate,'%m/%d/%y %H:%i')
	) as max
FROM online_retail_v2;

-- Date Range
SELECT InvoiceDate, LENGTH(InvoiceDate) 
FROM online_retail_v2 
LIMIT 10;
