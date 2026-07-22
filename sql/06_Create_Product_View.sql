CREATE VIEW vw_product_summary AS 

WITH clean_data AS (
	SELECT
		DATE(
			STR_TO_DATE(InvoiceDate, '%m/%d/%y %H:%i')
            ) AS order_date,
            
            InvoiceNo,
            StockCode,
            Description,
            Quantity,
            UnitPrice
    FROM online_retail_v2
    WHERE InvoiceNo NOT LIKE 'A%' AND InvoiceNo NOT LIKE 'C%'
	),
    
    product_monthly_sales AS (
		SELECT
			STR_TO_DATE(
					DATE_FORMAT(order_date, '%Y-%m-01'),
					'%Y-%m-%d'
			) AS Month,
            
            StockCode,
			Description,
            SUM(Quantity) AS qty_sold,
            ROUND(SUM(Quantity * UnitPrice), 2) AS product_gross_revenue
        FROM clean_data
        GROUP BY StockCode, Description, Month
    ),

	product_revenue_growth AS (
		SELECT
			Month,
            Description,
            StockCode,
            product_gross_revenue,
            qty_sold,
		
            LAG(product_gross_revenue) OVER (PARTITION BY StockCode ORDER BY Month) AS previous_revenue_product
			
        FROM product_monthly_sales
    ),
    
    product_monthly_contribution AS (
		SELECT
			Month,
			Description,
            qty_sold,
            product_gross_revenue,
            previous_revenue_product,
            ROUND(product_gross_revenue / (SUM(product_gross_revenue) OVER (PARTITION BY Month)) * 100, 2) AS contribution_pct
		FROM product_revenue_growth
    )
    
SELECT 
	Month, 
    Description AS `Product`, 
    product_gross_revenue AS `Product Revenue`, 
    ROUND(((product_gross_revenue - previous_revenue_product) / previous_revenue_product) * 100, 2) 
			AS `Product Revenue Growth`, 
            
	qty_sold AS `Qty Sold`,
    contribution_pct AS `Contribution %`, 
    
    DENSE_RANK() OVER(
		PARTITION BY Month
		ORDER BY contribution_pct DESC
    ) AS Ranking
    
FROM product_monthly_contribution;