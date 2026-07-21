# retail-sales-performance-analysis
Sales, Product, and Customer Analytics using SQL and Power BI <br>

Proyek ini bertujuan menganalisis performa penjualan ritel menggunakan **Online Retail Dataset** dari **UCI Machine Learning Repository**. Analisis dilakukan untuk mengidentifikasi faktor-faktor utama yang memengaruhi **Gross Revenue** berdasarkan tiga perspektif analisis, yaitu **Sales Analytics, Product Analytics**, dan **Customer Analytics**.


## Project Overview 
Proyek ini bertujuan untuk menganalisis performa penjualan ritel menggunakan **Online Retail Dataset** dari **UCI Machine Learning Repository**.<br>
Analisis dilakukan dari tiga perspektif bisnis utama:
-	**Sales Analytics**
-	**Product Analytics**
-	**Customer Analytics**

Tujuan utama proyek ini adalah mengidentifikasi faktor-faktor yang memengaruhi perubahan **Gross Revenue** bulanan serta memberikan rekomendasi bisnis yang dapat mendukung pengambilan keputusan berbasis data.

## Business Problem 
Perusahaan perlu memahami faktor-faktor yang memengaruhi perubahan performa penjualan agar dapat mengambil keputusan bisnis yang lebih efektif. <br> 
Fluktuasi Gross Revenue setiap bulan dapat dipengaruhi oleh berbagai aspek, seperti: 
- jumlah transaksi
- performa produk
- maupun perilaku customer

Proyek ini bertujuan mengidentifikasi faktor-faktor utama yang memengaruhi peningkatan dan penurunan Revenue melalui analisis data menggunakan SQL serta penyajian insight dalam dashboard interaktif Power BI.<br>
Hasil analisis diharapkan dapat memberikan insight yang bermanfaat serta rekomendasi berbasis data untuk mendukung strategi bisnis perusahaan.

## Dataset 
**Source:** <br>
Online Retail Dataset (UCI Machine Learning Repository) <br>
**Period:** <br>
December 2010 – December 2011 <br>
**Records:** <br>
541,909 transactions <br>
**Columns Used:** <br>
Eight key columns containing
-	InvoiceNo
-	StockCode
-	Description
-	Quantity
-	InvoiceDate 
-	UnitPrice 
-	CustomerID
-	Country

## Tools 
-	SQL (MySQL)
-	Power BI
-	GitHub
  
## SQL Skills Demonstrated
-	Data Cleaning
-	Data Validation
-	Common Table Expressions (CTE)
-	Window Functions (LAG)
-	Aggregate Functions
-	CASE WHEN
-	GROUP BY
-	JOIN
-	Date Functions
-	Views 
-	Ranking Funcions
-	Business KPI Calculation

## Business Skills Demonstrated
-	Sales Analytics
-	Product Analytics
-	Customer Analytics
-	Revenue Analysis
-	KPI Development
-	Business Insight Generation
-	Data Storytelling
-	Dashboard Design
-	Business Recommendation

## Dashboard Preview 
### Sales Analytics Dashboard
### Product Analytics Dashboard
### Customer Analytics Dashboard

## Key Findings
- Perubahan Revenue terutama dipengaruhi oleh jumlah transaksi (transaction volume) dibandingkan dengan perubahan Average Order Value (AOV).
- Pertumbuhan Revenue didorong oleh beberapa produk dengan performa penjualan yang konsisten, bukan bergantung pada satu produk tertentu.
- Akuisisi pelanggan dan jumlah pelanggan aktif memberikan pengaruh yang lebih besar terhadap perubahan Revenue dibanding retensi pelanggan.
- Repeat Purchase Rate dan Retention Rate relatif stabil pada sebagian besar periode analisis.
  
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
