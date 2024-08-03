/*The dataset from the result set of the below query includes the following columns:

- `student_id`: Unique identification of a student
- `date_registered`: Date of registration on the platform
- `first_date_watched`: Date of first engagement
- `first_date_purchased`: Date of first-time purchase (NULL if no purchases)
- `date_diff_reg_watch`: Difference in days between registration and first-time engagement
- `date_diff_watch_purch`: Difference in days between first-time engagement and first-time purchase (NULL if no purchases)*/
SELECT 
    i.student_id,
    i.date_registered,
    MIN(e.date_watched) AS first_date_watched,
    MIN(p.date_purchased) AS first_date_purchased,
    DATEDIFF(MIN(e.date_watched),i.date_registered ) AS days_diff_reg_watch,
    DATEDIFF(MIN(p.date_purchased),MIN(e.date_watched)) AS days_diff_watch_purch
FROM 
    student_info i
LEFT JOIN 
    student_engagement e ON i.student_id = e.student_id
LEFT JOIN 
    student_purchases p ON i.student_id = p.student_id
GROUP BY i.student_id, 
    i.date_registered
HAVING 
    first_date_watched IS NOT NULL
    AND (first_date_purchased IS NULL OR first_date_watched <= first_date_purchased);
-- Subquery to get the required dataset

/*
Metrics to Calculate:
Free-to-Paid Conversion Rate
Average Duration Between Registration and First-Time Engagement
Average Duration Between First-Time Engagement and First-Time Purchase*/
WITH engagement_data AS (
    SELECT 
        i.student_id,
        i.date_registered,
        MIN(e.date_watched) AS first_date_watched,
        MIN(p.date_purchased) AS first_date_purchased,
        DATEDIFF(MIN(e.date_watched), i.date_registered) AS date_diff_reg_watch,
        DATEDIFF(MIN(p.date_purchased), MIN(e.date_watched)) AS date_diff_watch_purch
    FROM 
        student_info i
    LEFT JOIN 
        student_engagement e ON i.student_id = e.student_id
    LEFT JOIN 
        student_purchases p ON i.student_id = p.student_id
    GROUP BY 
        i.student_id, 
        i.date_registered
    HAVING 
        first_date_watched IS NOT NULL
        AND (first_date_purchased IS NULL OR first_date_watched <= first_date_purchased)
)

-- Final query to calculate the metrics
SELECT 
    ROUND(
        100.0 * COUNT(CASE WHEN first_date_purchased IS NOT NULL THEN 1 END) 
        / COUNT(student_id), 
        2
    ) AS conversion_rate,
    
    ROUND(
        AVG(date_diff_reg_watch), 
        2
    ) AS av_reg_watch,

    ROUND(
        AVG(CASE WHEN date_diff_watch_purch IS NOT NULL THEN date_diff_watch_purch END), 
        2
    ) AS av_watch_purch

FROM engagement_data;