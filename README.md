# retail-sales-performance-analysis
Sales, Product, and Customer Analytics using SQL and Power BI

# Retail Sales Performance Analysis
## Project Overview 
Proyek ini bertujuan untuk menganalisis performa penjualan ritel menggunakan Online Retail Dataset dari UCI Machine Learning Repository.
Analisis dilakukan dari tiga perspektif bisnis utama:
-	Sales Analytics
-	Product Analytics
-	Customer Analytics
Tujuan utama proyek ini adalah mengidentifikasi faktor-faktor yang memengaruhi perubahan Gross Revenue bulanan serta memberikan rekomendasi bisnis yang dapat mendukung pengambilan keputusan berbasis data.

## Business Problem 
Perusahaan perlu memahami faktor-faktor yang memengaruhi perubahan performa penjualan agar dapat mengambil keputusan bisnis yang lebih efektif. 
Fluktuasi Gross Revenue setiap bulan dapat dipengaruhi oleh berbagai aspek, seperti jumlah transaksi, performa produk, maupun perilaku customer. 
Proyek ini menggunakan SQL untuk menganalisis tiga aspek utama, yaitu Sales Analytics, Product Analytics, dan Customer Analytics untuk mengidentifikasi faktor utama yang mendorong pertumbuhan maupun penurunan revenue.
Hasil analisis diharapkan dapat memberikan insight yang bermanfaat serta rekomendasi berbasis data untuk mendukung strategi bisnis perusahaan.

## Dataset 
Source: Online Retail Dataset (UCI Machine Learning Repository)
Period: December 2010 – December 2011
Records: 541,909 transactions
Columns Used: Eight key columns containing 
-	Invoice information
-	Product information 
-	Quantity 
-	Price 
-	CustomerID
-	Transaction date
-	Country

## Tools 
-	SQL (MySQL)
-	Power BI
-	GitHub
  
## SQL Skills Demonstrated
-	Data Cleaning
-	Data Validation
-	Common Table Expressions (CTE)
-	Window Function (LAG)
-	Aggregate Function
-	CASE WHEN
-	GROUP BY
-	JOIN
-	Views 
-	Ranking Funcions

## Business Skills Demonstrated
-	Sales Analytics
-	Product Analytics
-	Customer Analytics
-	KPI Analytics
-	Business Insight
-	Data Storytelling
-	Dashboard Design
-	Business Recommendation

## Dashboard Preview 
(belum)

## Key Findings
**Sales Analytics** <br>
Perubahan Revenue terutama dipengaruhi oleh jumlah transaksi (transaction volume) dibandingkan dengan perubahan Average Order Value (AOV). 
Hal ini menunjukkan bahwa perumbuhan atau penurunan pendapatan lebih banyak didorong oleh perubahan aktivitas pembelian pelanggan.

**Product Analytics** <br>
Pertumbuhan Revenue tidak bergantung pada satu produk tertentu, melainkan didukung oleh beberapa produk dengan performa penjualan yang konsisten. 
Hal ini menunjukkan adanya kontribusi dari berbagai produk unggulan dalam menghasilkan pendapatan.

**Customer Analytics** <br>
Perubahan Revenue memiliki hubungan yang kuat dengan fluktuasi jumlah New Customers dan Active Customers. <br>
Repeat Purchase Rate dan Retention Rate relatif stabil selama periode analisis. <br>
Menunjukkan bahwa perubahan pendapatan lebih dipengaruhi oleh perubahan jumlah pelanggan aktif dibandingkan perubahan loyalitas pelanggan.

## Business Recommendation
-	Meningkatkan strategi akuisisi pelanggan dengan mengevaluasi marketing dan channel akuisisi customer.
-	Meningkatkan aktivitas pelanggan melalui kampanye promosi, voucher, dan email marketing.
-	Mempromosikan produk dengan kontribusi pendapatan yang masih rendah namun memiliki potensi penjualan yang kuat.
-	Meningkatkan pembelian ulang pelanggan melalui program loyalitas, bundling produk, cross-selling, membership, dan program penghargaan.

## Repository Structure
```text
retail-sales-performance-analysis/
│
├── SQL/
│   ├── 01_data_cleaning.sql
│   ├── 02_sales_analytics.sql
│   ├── 03_product_analytics.sql
│   ├── 04_customer_analytics.sql
│   └── 05_views.sql
│
├── PowerBI/
│   ├── Retail Sales Dashboard.pbix
│   └── dashboard.png
│
├── Images/
│   ├── sales_dashboard.png
│   ├── product_dashboard.png
│   └── customer_dashboard.png
│
├── README.md
└── LICENSE
```
## Author
**Maria Yovinia** <br>
Information Systems Graduate <br>
Google Data Analytics Professional Certificate	
