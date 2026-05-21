WITH contract_churn AS (
    SELECT
        Contract,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
    FROM telco_customers
    GROUP BY Contract
)

SELECT
    Contract,
    total_customers,
    churned_customers,
    ROUND(churned_customers * 100.0 / total_customers, 2) AS churn_rate,
    RANK() OVER (
        ORDER BY
            ROUND(churned_customers * 100.0 / total_customers, 2) DESC
    ) AS churn_rank
FROM contract_churn;