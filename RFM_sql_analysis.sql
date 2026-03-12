--RFM Analysis
WITH rfm_base AS (
    SELECT
        customer_id,
        MAX(purchase_date::date) AS last_purchase_date,
        COUNT(*) AS frequency,
        SUM(purchase_amount) AS monetary
    FROM customer_behavior.customer
    GROUP BY customer_id
),

rfm_scores AS (
    SELECT *,
        NTILE(4) OVER (ORDER BY last_purchase_date DESC) AS recency_score,
        NTILE(4) OVER (ORDER BY frequency DESC) AS frequency_score,
        NTILE(4) OVER (ORDER BY monetary DESC) AS monetary_score
    FROM rfm_base
),

rfm_final AS (
    SELECT *,
           (recency_score + frequency_score + monetary_score) AS rfm_total_score
    FROM rfm_scores
)

SELECT
    CASE
        WHEN rfm_total_score >= 10 THEN 'Champions'
        WHEN rfm_total_score BETWEEN 7 AND 9 THEN 'Loyal Customers'
        WHEN rfm_total_score BETWEEN 4 AND 6 THEN 'Potential'
        ELSE 'At Risk'
    END AS segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(monetary)::numeric, 2) AS avg_revenue
FROM rfm_final
GROUP BY segment
ORDER BY avg_revenue DESC;


--Cohort Retention Analysis
WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(DATE_TRUNC('month', purchase_date::timestamp)) AS cohort_month
    FROM customer_behavior.customer
    GROUP BY customer_id
),

monthly_activity AS (
    SELECT
        c.customer_id,
        DATE_TRUNC('month', c.purchase_date::timestamp) AS activity_month,
        f.cohort_month
    FROM customer_behavior.customer c
    JOIN first_purchase f
        ON c.customer_id = f.customer_id
)

SELECT 
    cohort_month,
    activity_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM monthly_activity
GROUP BY cohort_month, activity_month
ORDER BY cohort_month, activity_month;


--Customer Lifetime Value
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS lifetime_value,
    ROUND(AVG(purchase_amount),2) AS avg_order_value
FROM customer_behavior.customer
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 20;


