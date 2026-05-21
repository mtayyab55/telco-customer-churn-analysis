SELECT
    Churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charge,
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue
FROM telco_customers
GROUP BY Churn;