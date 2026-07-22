/*
Project  : Retail Sales Performance Analysis
Author   : Iping
Analysis : Analisis perubahan KPI Customer Analysis terhadap Revenue

Business Question :
Menganalisis hubungan antara perubahan KPI Customer (New Customer, Active Customer, Repeat Purchase Rate, 
dan Retention Rate) dengan perubahan Gross Revenue setiap bulan untuk mengidentifikasi 
faktor customer yang paling memengaruhi pertumbuhan maupun penurunan revenue perusahaan.  

KPI :
- Gross Revenue 
- Revenue Growth
- New Customer
- Active Customer
- Repeat Purchase Rate
- Retention Rate

Business Rule :
1. Gross Revenue dihitung dari seluruh transaksi penjualan yang valid, dengan mengecualikan:
-	Invoice pembatalan (InvoiceNo NOT LIKE ‘C%’)
-	Transaksi Adjust bad debt (InvoiceNo NOT LIKE ‘A%’

2. KPI Customer hanya dihitung dari transaksi penjualan yang valid.
*/

CREATE VIEW vw_customer_summary AS 

WITH clean_data AS (
		SELECT
			DATE(
				STR_TO_DATE(InvoiceDate, '%m/%d/%y %H:%i')
			) AS order_date,
            
			InvoiceNo,
			UnitPrice,
			Quantity,
			CustomerID
		FROM online_retail_v2
		WHERE InvoiceNo NOT LIKE 'A%' AND InvoiceNo NOT LIKE 'C%'
	),
    
    monthly_gross_revenue AS (
		SELECT
			STR_TO_DATE(
					DATE_FORMAT(order_date, '%Y-%m-01'),
					'%Y-%m-%d'
			) AS Month,
			SUM(Quantity * UnitPrice) AS gross_revenue
        FROM clean_data
        GROUP BY Month 
    ),
    
    monthly_revenue_lag AS (
		SELECT
			Month,
            gross_revenue,
            LAG(gross_revenue) OVER(
				ORDER BY Month) AS previous_revenue
        FROM monthly_gross_revenue
    ),
    
    gross_revenue_growth AS (
		SELECT
			Month,
            COALESCE(
				ROUND( ((gross_revenue - previous_revenue) / previous_revenue) * 100, 2), 
			0 ) AS revenue_growth
        FROM monthly_revenue_lag
    ),
    
    customer_first_purchase AS (
		SELECT
			CustomerID,
            MIN(order_date) AS first_purchase
        FROM clean_data
        GROUP BY CustomerID
    ),
    
    monthly_new_customer AS (
		SELECT
			DATE_FORMAT(first_purchase, '%Y-%m-01') AS Month,
            COUNT(*) AS total_new_customer
        FROM customer_first_purchase
        WHERE first_purchase BETWEEN '2011-01-01' AND '2011-12-09'
        GROUP BY Month 
    ),
    
    new_customer_lag AS (
		SELECT
			Month,
            total_new_customer,
			LAG(total_new_customer) OVER(ORDER BY Month) AS previous_new_customer
		FROM monthly_new_customer
    ),
    
    new_customer_growth AS (
		SELECT
			Month,
            ROUND(
				((total_new_customer - previous_new_customer) / previous_new_customer) * 100, 2 ) AS new_customer
        FROM new_customer_lag
    ),
    
    monthly_active_customer AS (
		SELECT
			STR_TO_DATE(
					DATE_FORMAT(order_date, '%Y-%m-01'),
					'%Y-%m-%d'
			) AS Month,
            COUNT(DISTINCT CustomerID) AS total_active_customer
        FROM clean_data
        GROUP BY Month 
    ),
    
    active_customer_lag AS (
		SELECT
			Month,
            total_active_customer,
            LAG(total_active_customer) OVER(ORDER BY Month) AS previous_active
        FROM monthly_active_customer
    ),
    
    active_customer_growth AS (
		SELECT
			Month,
            COALESCE (
				ROUND( ((total_active_customer - previous_active) / previous_active) * 100, 2), 
            0 ) AS active_customer
        FROM active_customer_lag
    ),
    
    customer_monthly_transaction AS (
		SELECT
			DATE_FORMAT(order_date, '%Y-%m-01') AS Month,
            CustomerID,
            COUNT(DISTINCT InvoiceNo) AS total_transaction
        FROM clean_data
        GROUP BY Month, CustomerID
    ),
    
    monthly_repeat_customer AS (
		SELECT 
			Month,
            COUNT(DISTINCT CustomerID) AS repeat_customer
        FROM customer_monthly_transaction
        WHERE total_transaction > 1
        GROUP BY Month
    ),
    
    repeat_purchase_rate AS (
		SELECT
			x.Month,
            x.repeat_customer,
            y.total_active_customer,
            ROUND(
					(x.repeat_customer / y.total_active_customer) * 100, 2
				) AS repeat_purchase
		FROM monthly_repeat_customer x
        JOIN monthly_active_customer y ON x.Month = y.Month
    ),
    
    customer_monthly AS (
		SELECT DISTINCT 
			DATE_FORMAT(order_date, '%Y-%m-01') AS Month,
            CustomerID
        FROM clean_data
    ),
    
    retained_customer AS (
		SELECT
			x.Month,
            COUNT(DISTINCT y.CustomerID) AS total_retained
        FROM customer_monthly x
        LEFT JOIN customer_monthly y ON x.CustomerID = y.CustomerID 
			AND y.Month = DATE_SUB(x.Month, INTERVAL 1 MONTH)
		GROUP BY Month
    ),
    
    retention_customer_rate AS (
		SELECT
			x.Month,
            y.total_active_customer,
            x.total_retained,
            COALESCE (
				ROUND((x.total_retained / y.previous_active) * 100, 2),
                0) AS retention_rate
        FROM retained_customer x
        LEFT JOIN active_customer_lag y ON x.Month = y.Month
    )

SELECT 
	a.Month,
	a.revenue_growth AS `Growth Revenue`,
    b.new_customer AS `New Customer`,
    c.active_customer AS `Active Customer`,
    d.repeat_purchase AS `Repeat Purchase Rate`,
    e.retention_rate AS `Retention Rate`
    
FROM gross_revenue_growth a 
LEFT JOIN new_customer_growth b ON a.Month = b.Month
LEFT JOIN active_customer_growth c ON b.Month = c.Month
LEFT JOIN repeat_purchase_rate d ON c.Month = d.Month
LEFT JOIN retention_customer_rate e ON d.Month = e.Month;
