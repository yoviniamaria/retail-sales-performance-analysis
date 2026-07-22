CREATE VIEW vw_sales_summary AS

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