# Project Report: Course Engagement Analysis
## Introduction
### Objective:
The objective of this project is to analyze student engagement data from the 365 platform to understand free-to-paid conversion rates and the durations between key engagement milestones. This analysis provides insights into user interaction and conversion patterns on the platform.

### Dataset:
The dataset includes:

* **student_info**: Information about students, including their registration dates.
* **student_engagement**: Dates on which students watched lectures.
* **student_purchases**: Dates on which students made purchases.
## Methodology:
Data Extraction and Transformation

Using SQL, we extracted and transformed the data to create a comprehensive dataset that includes:

* **student_id**: Unique identification of a student.
* **date_registered**: Date of registration on the platform.
* **first_date_watched**: Date of first engagement.
* **first_date_purchased**: Date of first-time purchase (NULL if no purchases).
* **date_diff_reg_watch**: Difference in days between registration and first-time engagement.
* **date_diff_watch_purch**: Difference in days between first-time engagement and first-time purchase (NULL if no purchases).

## Metric Calculations
We then calculated the following metrics:

* **Free-to-Paid Conversion Rate**:
The percentage of students who watched a lecture and later purchased a subscription.
* **Average Duration Between Registration and First-Time Engagement**:
The average number of days between student registration and their first lecture.
* **Average Duration Between First-Time Engagement and First-Time Purchase**:
The average number of days between the first lecture and the first subscription purchase.

## Results
### Calculated Metrics
* Free-to-Paid Conversion Rate: 11.29%
* Average Duration Between Registration and First-Time Engagement: 3.42 days
* Average Duration Between First-Time Engagement and First-Time Purchase: 26.25 days
### Mean, Median, and Mode Analysis
Using Python, we calculated the mean, median, and mode for the date differences:

**Days Diff Reg-Watch**:
* Mean: 3.42
* Median: 0.0
* Mode: 0

**Interpretation**:

Mean (3.42 days): On average, students take about 3.42 days to watch their first lecture after registering. This indicates a general trend of students engaging within a few days of registration.

Median (0.0 days): The median value of 0 days suggests that the typical student either watches the lecture on the same day they register or very soon after. Since the median is lower than the mean, it implies that a significant portion of students engage almost immediately after registration.

Mode (0 days): The mode of 0 days confirms that the most common behavior among students is to watch the lecture on the same day they register. This reinforces the idea that immediate engagement is a frequent occurrence.

**Days Diff Watch-Purch**:
* Mean: 26.25
* Median: 1.0
* Mode: 0.0

**Interpretation**:

Mean (26.25 days): On average, it takes students about 26.25 days to purchase a subscription after watching their first lecture. This suggests that, on average, there is a considerable delay between initial engagement and purchasing a subscription.

Median (1.0 day): The median of 1 day indicates that the typical student who makes a purchase does so within a day after watching their first lecture. This shows that many students convert to paying customers shortly after their first engagement.

Mode (0.0 days): The mode of 0 days suggests that a notable number of students make a purchase on the same day they watch their first lecture. This can indicate that some users are quick to convert if they find the content appealing.

**Outliers**:
The higher mean compared to the median in both metrics indicates the presence of outliers. Some students take much longer to engage or purchase, affecting the average.

**Common Patterns**:
A mode of 0 in both metrics shows that the most common behavior is immediate engagement and purchase, suggesting the platform is effective in capturing interest quickly.

## Conclusion:
* **Conversion Rate**: At 11.29%, the conversion rate can be compared to industry benchmarks to gauge effectiveness.
* **Engagement Duration**: A short average duration (3.42 days) between registration and first engagement suggests a user-friendly registration process.
* **Purchase Duration**: The average duration (26.25 days) to purchase indicates the need for potentially stronger up-sell strategies.

