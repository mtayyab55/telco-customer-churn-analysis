SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY PaymentMethod
        ),
        2
    ) AS percentage
FROM telco_customers
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod, Churn;