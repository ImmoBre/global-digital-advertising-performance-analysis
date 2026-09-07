/*
===========================================
Global Digital Advertising Performance Analysis

SQL Business Analysis

Author: Saad Maher

Objective:
Answer key business questions using SQL
to support marketing decision-making.
===========================================
*/

CREATE DATABASE marketing_campaign;

USE marketing_campaign;

-- Business Question 1 
-- Which platform generated the highest total revenue?

SELECT
    platform,
    SUM(revenue) AS total_revenue
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY total_revenue DESC;

-- Business Question 2 
-- Which platform generated the highest total profit?

SELECT
    platform,
    SUM(revenue - ad_spend) AS total_profit
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY total_profit DESC;

-- Business Question 3 
-- Which campaign type generated the highest revenue?

SELECT
    campaign_type,
    SUM(revenue) AS total_revenue
FROM global_ads_performance_dataset
GROUP BY campaign_type
ORDER BY total_revenue DESC;

-- Business Question 4 
-- Which industry generated the highest revenue?

SELECT
    industry,
    SUM(revenue) AS total_revenue
FROM global_ads_performance_dataset
GROUP BY industry
ORDER BY total_revenue DESC;

-- Business Question 5 
-- Which country generated the highest revenue?

SELECT
    country,
    SUM(revenue) AS total_revenue
FROM global_ads_performance_dataset
GROUP BY country
ORDER BY total_revenue DESC;

-- Business Question 6 
-- What is the average ROAS by platform?

SELECT
    platform,
    ROUND(AVG(ROAS),2) AS average_roas
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY average_roas DESC;

-- Business Question 7 
-- What is the average CPC by platform?

SELECT
    platform,
    ROUND(AVG(CPC),2) AS average_cpc
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY average_cpc;

-- Business Question 8 
-- What is the average CTR by platform?

SELECT
    platform,
    ROUND(AVG(CTR),4) AS average_ctr
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY average_ctr DESC;

-- Business Question 9 
-- Top 10 highest revenue campaigns

SELECT
    date,
    platform,
    campaign_type,
    country,
    revenue
FROM global_ads_performance_dataset
ORDER BY revenue DESC
LIMIT 10;

-- Business Question 10 
-- Monthly revenue

SELECT
    DATE_FORMAT(date,'%Y-%m') AS month,
    SUM(revenue) AS total_revenue
FROM global_ads_performance_dataset
GROUP BY month
ORDER BY month;

-- Business Question 11 
-- Monthly advertising spend

SELECT
    DATE_FORMAT(date,'%Y-%m') AS month,
    SUM(ad_spend) AS total_spend
FROM global_ads_performance_dataset
GROUP BY month
ORDER BY month;

-- Business Question 12 
-- Average ROAS by industry

SELECT
    industry,
    ROUND(AVG(ROAS),2) AS average_roas
FROM global_ads_performance_dataset
GROUP BY industry
ORDER BY average_roas DESC;

-- Business Question 13 
-- Average CPA by platform

SELECT
    platform,
    ROUND(AVG(CPA),2) AS average_cpa
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY average_cpa;

-- Business Question 14 
-- Total clicks by platform

SELECT
    platform,
    SUM(clicks) AS total_clicks
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY total_clicks DESC;

-- Business Question 15 
-- Total conversions by platform

SELECT
    platform,
    SUM(conversions) AS total_conversions
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY total_conversions DESC;

-- Business Question 16 
-- Top 5 countries by average ROAS

SELECT
    country,
    ROUND(AVG(ROAS),2) AS average_roas
FROM global_ads_performance_dataset
GROUP BY country
ORDER BY average_roas DESC
LIMIT 5;

-- Business Question 17
-- Top 5 industries by profit
SELECT
    industry,
    SUM(revenue - ad_spend) AS total_profit
FROM global_ads_performance_dataset
GROUP BY industry
ORDER BY total_profit DESC
LIMIT 5;

-- Business Question 18
-- Average revenue by campaign type

SELECT
    campaign_type,
    ROUND(AVG(revenue),2) AS average_revenue
FROM global_ads_performance_dataset
GROUP BY campaign_type
ORDER BY average_revenue DESC;

-- Business Question 19 
-- Top 10 campaigns by ROAS

SELECT
    date,
    platform,
    campaign_type,
    country,
    ROAS
FROM global_ads_performance_dataset
ORDER BY ROAS DESC
LIMIT 10;

-- Business Question 20
-- Overall business KPIs

SELECT
    SUM(revenue) AS total_revenue,
    SUM(ad_spend) AS total_ad_spend,
    SUM(revenue - ad_spend) AS total_profit,
    ROUND(AVG(ROAS),2) AS average_roas,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions
FROM global_ads_performance_dataset;
