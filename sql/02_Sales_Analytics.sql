/*
Project  : Retail Sales Performance Analysis
Author   : Maria Yovinia
Analysis : Monthly Gross Revenue Growth, Monthly Order, and Monthly AOV

Business Question :
Evaluasi performa penjualan bulanan perusahaan melalui Gross Revenue, Total Order, dan Average Order Value (AOV) 
selama periode 2010-2011

KPI :
- Revenue
- Order
- Average Order Value (AOV)

Business Rule:
Gross Revenue dihitung dari seluruh transaksi penjualan yang valid dengan mengecualikan:
	- Invoice pembatalan (InvoiceNo LIKE 'C%')
	- Transaksi Adjust bad debt (InvoiceNo LIKE 'A%')
Berdasarkan hasil data quality check, 
seluruh invoice yang diawali huruf A pada dataset merupakan transaksi Adjust bad debt, 
sehingga tidak merepresentasikan transaksi penjualan dan dikeluarkan dari perhitungan KPI.

Catatan:
Satu invoice dapat terdiri dari beberapa produk, sehingga jumlah order dihitung menggunakan COUNT(DISTINCT InvoiceNo), 
bukan COUNT(InvoiceNo).
*/


WITH clean_data AS (
	SELECT
			DATE(
				STR_TO_DATE(InvoiceDate,'%m/%d/%y %H:%i')
			) AS order_date,

			InvoiceNo,
			Quantity,
			UnitPrice
	FROM online_retail_v2
    WHERE InvoiceNo NOT LIKE 'A%' AND InvoiceNo NOT LIKE 'C%'
	),
  
  monthly_sales AS (
	SELECT
		STR_TO_DATE(
				DATE_FORMAT(order_date,'%Y-%m-01'),
				'%Y-%m-%d'
		) AS Month,
        
        COUNT(DISTINCT InvoiceNo) AS total_order,
        
        ROUND(SUM(Quantity * UnitPrice), 2) AS gross_revenue,
        
        ROUND(
			SUM(Quantity*UnitPrice) / COUNT(DISTINCT InvoiceNo), 2 ) AS AOV
            
	FROM clean_data
    GROUP BY Month
    ),

growth_monthly_sales AS (
	SELECT
		Month, total_order, gross_revenue, AOV,
        LAG(gross_revenue) OVER (ORDER BY Month) AS revenue_bulan_sebelumnya,
        LAG(total_order) OVER (ORDER BY Month) AS order_bulan_sebelumnya,
        LAG(AOV) OVER (ORDER BY Month) AS AOV_bulan_sebelumnya
    FROM monthly_sales
)
    
SELECT
	Month,
    gross_revenue AS `Gross Revenue`,
    ROUND( ((gross_revenue - revenue_bulan_sebelumnya) / revenue_bulan_sebelumnya) * 100, 2) AS `Revenue Growth`,
    
    total_order AS `Total Order`,
    ROUND( ((total_order - order_bulan_sebelumnya) / order_bulan_sebelumnya) * 100, 2) AS `Order Growth`,
    
    AOV,
    ROUND( ((AOV - AOV_bulan_sebelumnya) / AOV_bulan_sebelumnya) * 100, 2) AS `AOV Growth`
    
FROM growth_monthly_sales
ORDER BY Month;