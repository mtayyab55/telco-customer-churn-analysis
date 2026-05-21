SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Not Senior Citizen'
    END AS senior_status,
    Churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY SeniorCitizen
        ),
        2
    ) AS percentage
FROM telco_customers
GROUP BY SeniorCitizen, Churn
ORDER BY SeniorCitizen, Churn;