# retail-sales-performance-analysis
Sales, Product, and Customer Analytics using SQL and Power BI <br>

Proyek ini menganalisis performa penjualan ritel menggunakan **Online Retail Dataset** dari **UCI Machine Learning Repository**. Analisis dilakukan untuk mengidentifikasi faktor-faktor utama yang memengaruhi **Gross Revenue** berdasarkan tiga perspektif analisis: **Sales Analytics, Product Analytics**, dan **Customer Analytics**.

## Project Overview 
Proyek ini bertujuan untuk menganalisis performa penjualan ritel menggunakan **Online Retail Dataset** dari **UCI Machine Learning Repository**.<br>
Analisis dilakukan dari tiga perspektif bisnis utama:
-	**Sales Analytics**
-	**Product Analytics**
-	**Customer Analytics**

Proyek ini menggunakan SQL untuk proses data cleaning dan analisis data, serta Power BI untuk membangun dashboard interaktif. Analisis dilakukan untuk mengidentifikasi faktor-faktor utama yang memengaruhi perubahan Gross Revenue dan menghasilkan rekomendasi bisnis berbasis data.

## Business Problem 
Perusahaan ritel perlu memahami faktor-faktor yang memengaruhi perubahan performa penjualan agar dapat mengambil keputusan bisnis yang lebih efektif.

Fluktuasi Gross Revenue setiap bulan dapat dipengaruhi oleh berbagai aspek, seperti jumlah transaksi, performa produk, dan perilaku customer

Proyek ini bertujuan mengidentifikasi faktor-faktor utama yang mendorong peningkatan maupun penurunan Gross Revenue melalui analisis performa penjualan, produk, dan customer.

Hasil analisis diharapkan dapat memberikan insight yang bermanfaat serta rekomendasi berbasis data untuk mendukung strategi bisnis perusahaan.

## Dataset 
**Source:** <br>
Online Retail Dataset (UCI Machine Learning Repository)

**Period:** <br>
December 2010 – December 2011

**Records:** <br>
541,909 rows

**Columns Used:** <br>
Dataset ini memiliki delapan kolom utama, yaitu:
-	InvoiceNo
-	StockCode
-	Description
-	Quantity
-	InvoiceDate 
-	UnitPrice 
-	CustomerID
-	Country

## Data Cleaning
Sebelum proses analisis, validasi dan pembersihan data dilakukan untuk memastikan kualitas dan akurasi data.

Beberapa permasalahan kualitas data yang diidentifikasi beserta tindakan yang dilakukan adalah sebagai berikut:
| Permasalahan | Tindakan |
|--------------|----------|
| InvoiceDate bertipe TEXT | Diubah menjadi tipe data **Date** |
| InvoiceNo bertipe INTEGER | Diubah menjadi tipe data **VARCHAR** |
| Invoice Adjustment (Invoice A) | Dikecualikan dari analisis penjualan |
| Invoice Cancellation (Invoice C) | Dikecualikan dari analisis Revenue |
| InvoiceNo = 0 | Diselesaikan melalui perubahan tipe data dan *Re-imported* dataset |
| Quantity Negatif | Diinvestigasi dan dipertahankan apabila merupakan transaksi yang valid |
| CustomerID NULL | Tetap digunakan pada Sales Analytics, tetapi dikecualikan pada Customer Analytics |

Setelah proses *data cleaning* selesai, dataset dinyatakan siap digunakan untuk menganalisis Sales Analytics, Product Analytics, dan Customer Analytics.

## Tools 
-	SQL (MySQL)
-	Power BI
-	GitHub
  
## SQL Skills Demonstrated
-	Data Cleaning
-	Data Validation
-	Common Table Expressions (CTE)
-	Window Functions (LAG, ROW_NUMBER)
-	Aggregate Functions
-	CASE WHEN
-	GROUP BY
-	ORDER BY
-	JOIN
-	Date Functions
-	View Creation
-	Ranking Functions
-	Business KPI Calculation

## Business Skills Demonstrated
-	Sales Performance Analysis
-	Product Performance Analysis
-	Customer Analytics
-	KPI Development
-	Revenue Growth Analysis
-	Customer Retention Analysis
-	Business Insight Generation
-	Data Storytelling
-	Dashboard Design
-	Business Recommendation

## Dashboard Preview 
### Sales Analytics Dashboard
![Sales Dashboard](Images/Sales_Dashboard.png)
### Product Analytics Dashboard
![Product Dashboard](Images/Product_Dashboard.png)
### Customer Analytics Dashboard
![Customer Dashboard](Images/Customer_Dashboard.png)

## Key Findings
- Perubahan Gross Revenue terutama dipengaruhi oleh jumlah transaksi (transaction volume) dibandingkan dengan perubahan Average Order Value (AOV).
- Pertumbuhan Revenue didorong oleh beberapa produk dengan performa penjualan yang konsisten, bukan bergantung pada satu produk tertentu.
- Peningkatan jumlah New Customer dan Active Customer memiliki hubungan yang lebih kuat terrhadap perubahan Revenue dibanding retensi pelanggan.
- Repeat Purchase Rate dan Retention Rate relatif stabil pada sebagian besar periode analisis.
  
## Business Recommendation
-	Meningkatkan strategi akuisisi pelanggan dengan mengevaluasi strategi pemasaran dan channel akuisisi customer.
-	Meningkatkan aktivitas pelanggan melalui kampanye promosi, voucher, dan email marketing.
-	Mempromosikan produk dengan kontribusi pendapatan yang masih rendah namun memiliki potensi penjualan yang kuat.
-	Meningkatkan pembelian ulang pelanggan melalui program loyalitas, bundling produk, cross-selling, membership, dan program penghargaan.

## Repository Structure
```text
retail-sales-performance-analysis
│
├── dataset
│
├── sql
│   ├── 01_Data_Cleaning.sql
│   ├── 02_Sales_Analytics.sql
│   ├── 03_Product_Analytics.sql
│   ├── 04_Customer_Analytics.sql
│   ├── 05_Create_Sales_View.sql
│   ├── 06_Create_Product_View.sql
│   └── 07_Create_Customer_View.sql
│
├── power-bi
│   └── Retail Sales Dashboard.pbix
│
├── images
│   ├── Sales_Dashboard.png
│   ├── Product_Dashboard.png
│   └── Customer_Dashboard.png
│
└── README.md
```
## Author

**Maria Yovinia** 

Information Systems Graduate 

Google Data Analytics Professional Certificate 

LinkedIn: [Maria Yovinia](www.linkedin.com/in/mariayovinia)

GitHub: [yoviniamaria](https://github.com/yoviniamaria)
