# Telco Customer Churn Analysis

## Project Overview

This project analyzes customer churn behavior for a telecommunications company using Excel, PostgreSQL, and Power BI.

The objective of the project was to identify key factors contributing to customer churn and build an interactive dashboard for customer retention and business insights.

---

## Tools Used

- Excel
- PostgreSQL
- SQL
- Power BI
- DAX

---

## Dataset

- Telco Customer Churn Dataset
- 7,043 customer records
- Customer demographics, contract information, billing details, internet services, and churn status

---

## Project Workflow

### 1. Excel Analysis
- Exploratory Data Analysis (EDA)
- Pivot Tables
- Churn segmentation analysis
- Contract type analysis
- Payment method analysis
- Internet service analysis
- 

### 2. PostgreSQL Analysis
- Data cleaning and validation
- KPI calculations
- Customer segmentation queries
- Revenue analysis
- CASE statements
- CTEs
- Window functions

### 3. Power BI Dashboard
- KPI cards
- Churn analysis dashboard
- Customer segmentation visuals
- Revenue and retention insights

---

## Key Business Insights

- Customers on month-to-month contracts showed significantly higher churn rates compared to one-year and two-year contract customers.

- Customers using electronic check payment methods demonstrated higher churn behavior than customers using automatic payment methods.

- Fiber optic internet customers exhibited elevated churn rates despite premium service offerings.

- Customers within their first 12 months had the highest churn rates, indicating increased early-lifecycle customer risk.

- Long-term retained customers generated substantially higher customer lifetime value compared to churned customers.

---

## SQL Query Highlights

### Overall Churn Rate

```sql
SELECT
    Churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM telco_customers
GROUP BY Churn;
```

### Churn by Contract Type

```sql
SELECT
    Contract,
    Churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY Contract
        ),
        2
    ) AS percentage
FROM telco_customers
GROUP BY Contract, Churn
ORDER BY Contract, Churn;
```

### High-Risk Customer Segments

```sql
WITH segment_churn AS (
    SELECT
        Contract,
        PaymentMethod,
        InternetService,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
    FROM telco_customers
    GROUP BY Contract, PaymentMethod, InternetService
)

SELECT
    Contract,
    PaymentMethod,
    InternetService,
    total_customers,
    churned_customers,
    ROUND(churned_customers * 100.0 / total_customers, 2) AS churn_rate
FROM segment_churn
WHERE total_customers >= 30
ORDER BY churn_rate DESC;
```

---

## Dashboard Preview

(Add Power BI dashboard screenshot here)

---

## Repository Structure

```text
telco-customer-churn-analysis/
│
├── data/
├── excel/
├── sql/
├── powerbi/
├── screenshots/
└── README.md
```