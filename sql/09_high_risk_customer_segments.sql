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