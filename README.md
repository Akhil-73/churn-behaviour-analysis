# Churn Behaviour Analysis using SQL and Python

## Project Overview

This project analyzes user churn behavior for a subscription-based educational platform using SQL and Python. The objective was to identify patterns related to user engagement, subscription plans, feature adoption, and customer retention.

The project combines SQL-based analysis with Python-driven exploratory data analysis (EDA) and visualization to uncover factors influencing user churn.

---

## Tech Stack

* SQL (MySQL)
* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook
* Git & GitHub

---

## Project Structure

```text
churn-behaviour-analysis/
│
├── data/
│   ├── users.csv
│   ├── subscriptions.csv
│   ├── sessions.csv
│   ├── feature_usage.csv
│   ├── features.csv
│   └── churn_status.csv
│
├── notebooks/
│   └── churn_analysis.ipynb
│
├── sql/
│   ├── schema.sql
│   ├── data_insertion.sql
│   └── analysis_queries.sql
│
├── visuals/
│   ├── user_overview.png
│   ├── revenue_by_plan.png
│   ├── session_duration_distribution.png
│   ├── feature_usage_analysis.png
│   ├── feature_diversity_distribution.png
│   ├── churn_distribution.png
│   ├── rating_vs_churn.png
│   ├── country_churn_rate.png
│   ├── subscription_type_churn_rate.png
│   ├── plan_churn_rate.png
│   ├── session_duration_vs_churn.png
│   ├── feature_churn_rate.png
│   └── feature_diversity_vs_churn_rate.png
│
├── README.md
└── requirements.txt
```

---

## Business Questions Addressed

* Which subscription plans experience the highest churn?
* How does user engagement influence retention?
* Does feature adoption impact churn behavior?
* Are user ratings associated with churn?
* Which platform features contribute to stronger retention?

---

## Key Insights

### 1. Subscription Plans and Churn

Weekly-plan subscribers exhibited substantially higher churn rates compared to Monthly and Annual subscribers. Annual subscribers demonstrated the strongest retention.

### 2. User Engagement and Retention

Active users recorded significantly longer session durations than churned users, indicating a strong relationship between engagement and retention.

### 3. Feature Adoption

Users engaging with multiple platform features exhibited no observed churn within the current dataset, suggesting broader feature adoption may contribute to retention.

### 4. Feature-Level Retention

Daily Streaks, AI Assistant, AI Test Paper Analyzer, and Create Notes achieved the highest retention rates among all analyzed features.

### 5. User Satisfaction

No users with ratings above 4.5 churned, while users with ratings below 3 demonstrated substantially higher churn levels.

### 6. Country-Level Analysis

Churn behavior varied across countries; however, the relatively small sample size limits strong conclusions regarding geographical effects.

---

## Visualizations

The project includes visual analysis covering:

* User demographics and subscription distribution
* Revenue by subscription plan
* Session duration distributions
* Feature usage patterns
* Churn distribution
* Country-wise churn rates
* Subscription plan churn rates
* Session duration vs churn
* Feature adoption vs churn
* Feature diversity vs churn

---

## Conclusion

The analysis suggests that user engagement, feature adoption, and customer satisfaction are strongly associated with retention. Users who actively engage with the platform, explore multiple features, and provide higher ratings demonstrate significantly lower churn levels.

While the dataset is intentionally small for educational purposes, the project demonstrates a complete analytics workflow involving SQL querying, data extraction, exploratory analysis, visualization, and business insight generation.
