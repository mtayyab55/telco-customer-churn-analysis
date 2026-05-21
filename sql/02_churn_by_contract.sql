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