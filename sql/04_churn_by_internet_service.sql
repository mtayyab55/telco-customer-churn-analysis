SELECT
    InternetService,
    Churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY InternetService
        ),
        2
    ) AS percentage
FROM telco_customers
GROUP BY InternetService, Churn
ORDER BY InternetService, Churn;