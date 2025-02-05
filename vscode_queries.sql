-- Retrieve the first 10 transactions recorded
SELECT * FROM pmo 
ORDER BY
    transaction_date ASC
LIMIT 10;

-- Identify the total spend per region
SELECT
    region_name,
    SUM(amount_usd) AS total_spend
FROM
    pmo 
GROUP BY
    region_name
ORDER BY
    total_spend DESC;

-- Summarize the total spend per cost center
SELECT
    cost_center,
    budget_account,
    SUM (amount_usd) AS total_spend
FROM
    pmo 
GROUP BY
    cost_center, budget_account
ORDER BY
    total_spend DESC;

-- Identify all transactions above the average transaction spend
SELECT
    project_no,
    transaction_date,
    company_name,
    amount_usd,
    avg_transaction_spend
FROM
    pmo,
    (SELECT ROUND(AVG(amount_usd),2) AS avg_transaction_spend FROM pmo) AS subquery --Derived table
WHERE
    amount_usd > subquery.avg_transaction_spend
ORDER BY
    amount_usd ASC;

-- Find the top 5 vendors by highest total spend
SELECT
    company_name,
    SUM(amount_usd) AS total_amount_received
FROM
    pmo 
GROUP BY
    company_name
ORDER BY
    total_amount_received DESC
LIMIT
    5;