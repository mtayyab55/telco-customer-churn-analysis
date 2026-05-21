SELECT
    Churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(tenure), 2) AS avg_tenure_months,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    ROUND(AVG(TotalCharges), 2) AS avg_lifetime_value,
    ROUND(SUM(TotalCharges), 2) AS total_lifetime_value
FROM telco_customers
GROUP BY Churn
ORDER BY Churn;