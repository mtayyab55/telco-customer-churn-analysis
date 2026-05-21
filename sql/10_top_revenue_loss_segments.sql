WITH revenue_loss AS (
    SELECT
        Contract,
        PaymentMethod,
        InternetService,
        COUNT(*) AS churned_customers,
        ROUND(SUM(MonthlyCharges), 2) AS estimated_monthly_revenue_loss,
        ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
    FROM telco_customers
    WHERE Churn = 'Yes'
    GROUP BY Contract, PaymentMethod, InternetService
)

SELECT
    Contract,
    PaymentMethod,
    InternetService,
    churned_customers,
    estimated_monthly_revenue_loss,
    avg_monthly_charge
FROM revenue_loss
WHERE churned_customers >= 30
ORDER BY estimated_monthly_revenue_loss DESC;