SELECT
    PaperlessBilling,
    Churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY PaperlessBilling
        ),
        2
    ) AS percentage
FROM telco_customers
GROUP BY PaperlessBilling, Churn
ORDER BY PaperlessBilling, Churn;