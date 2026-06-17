CREATE DATABASE bank_analysis;
USE bank_analysis;

select * from bank_analysis.bank_churn;

# Overall Churn Rate
SELECT
    ROUND(
        SUM(
            CASE
                WHEN attrition_flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM bank_churn;


# Revenue at Risk
SELECT
SUM(total_trans_amt)
AS revenue_at_risk
FROM bank_churn
WHERE attrition_flag =
'Attrited Customer';

# Churn by Gender
SELECT
gender,
COUNT(*) churned_customers
FROM bank_churn
WHERE attrition_flag =
'Attrited Customer'
GROUP BY gender;

# Churn by Income
SELECT
income_category,
COUNT(*)
FROM bank_churn
WHERE attrition_flag =
'Attrited Customer'
GROUP BY income_category;

# Top Revenue Customers
SELECT
clientnum,
total_trans_amt
FROM bank_churn
ORDER BY total_trans_amt DESC
LIMIT 10;

# High Utilization Customers
SELECT
clientnum,
avg_utilization_ratio
FROM bank_churn
ORDER BY avg_utilization_ratio DESC;

# Card Category Performance
SELECT
card_category,
AVG(total_trans_amt)
AS avg_spend
FROM bank_churn
GROUP BY card_category;