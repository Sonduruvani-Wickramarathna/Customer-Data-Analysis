📊 Customer Analytics & Subscription Insights
📌 Overview

This project demonstrates an end-to-end data analytics workflow using Python, SQL, and Power BI.
The goal of the project is to analyze customer data to uncover insights related to customer distribution, subscription behavior, communication details, and data quality, and to present those insights through an interactive dashboard and professional presentation.

The project covers:

Data exploration and cleaning using Python

Structured data analysis using SQL

Interactive visualization using Power BI

Business-focused insights and recommendations

📁 Dataset

File Name: customers-100.csv

Description: Customer-level dataset containing personal, geographic, and subscription information

Size: ~100 records

Key Columns

customer_id

first_name, last_name

company

city, country

phone_1, phone_2

email

subscription_date

website

🛠 Tools & Technologies

Python (Pandas) – Data loading, cleaning, and exploratory data analysis

Jupyter Notebook – EDA and preprocessing

PostgreSQL / MySQL / SQL Server – Data storage and SQL analysis

Power BI – Interactive dashboard and visual analytics

Gamma / PowerPoint – Presentation and storytelling

GitHub – Version control and project sharing

🔍 Project Workflow
1️⃣ Exploratory Data Analysis (Python)

Performed EDA in Jupyter Notebook to understand data structure and quality:

Loaded CSV file using Pandas

Reviewed data types and schema

Generated descriptive statistics

Identified missing values

Standardized column names

Validated phone number consistency

Prepared data for database loading

2️⃣ Data Cleaning & Database Loading

Cleaned and standardized column names

Connected Python to SQL database using SQLAlchemy

Loaded cleaned data into a relational database table

3️⃣ Data Analysis Using SQL

SQL queries were written to answer business questions such as:

Customers by country and city

Subscription trends by year and month

Subscribed vs non-subscribed customers

Phone number completeness

Company vs individual customers

Top email domains

Duplicate records detection

Missing value analysis

All queries are included in the project’s SQL file.

💡 Business Recommendations

Enforce mandatory email and phone fields during customer onboarding

Target marketing campaigns in high-customer-density regions

Focus subscription promotions during low-activity months

Improve engagement strategies for non-subscribed users

Regularly monitor data quality to reduce missing and duplicate records

▶️ How to Run This Project
1. Clone the Repository
git clone https://github.com/your-username/customer-analytics-project.git

2. Run Python Analysis

Open the Jupyter Notebook

Ensure required libraries are installed:

pip install pandas sqlalchemy psycopg2-binary


Run all cells to perform EDA and load data into the database

3. Execute SQL Queries

Open the SQL file in your database client (PostgreSQL / MySQL / SQL Server)

Run queries to generate analytical results

4. Open Power BI Dashboard

Open the .pbix file in Power BI Desktop

Refresh data connection if required

5. View Presentation

Open the PowerPoint / Gamma presentation for summarized insights and storytelling

📌 Project Structure
Customer-Analytics-Project/
│
├── data/
│   └── customers-100.csv
├── notebooks/
│   └── customer_analysis.ipynb
├── sql/
│   └── customer_analysis.sql
├── powerbi/
│   └── customer_dashboard.pbix
├── presentation/
│   └── Customer_Analytics_Presentation.pptx
└── README.md

👤 Author

T.A.S.Wickramarathna
Data Analytics Enthusiast | SQL | Python | Power BI
