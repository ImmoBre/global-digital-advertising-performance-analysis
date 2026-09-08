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
    ROUND(
        SUM(revenue) / NULLIF(SUM(ad_spend), 0),
        2
    ) AS roas
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY roas DESC;

-- Business Question 7 
-- What is the average CPC by platform?

SELECT
    platform,
    ROUND(
        SUM(ad_spend) / NULLIF(SUM(clicks), 0),
        2
    ) AS cpc
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY cpc;

-- Business Question 8 
-- What is the average CTR by platform?

SELECT
    platform,
    ROUND(
        SUM(clicks) / NULLIF(SUM(impressions), 0),
        4
    ) AS ctr
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY ctr DESC;

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
    ROUND(
        SUM(revenue) / NULLIF(SUM(ad_spend), 0),
        2
    ) AS roas
FROM global_ads_performance_dataset
GROUP BY industry
ORDER BY roas DESC;

-- Business Question 13 
-- Average CPA by platform

SELECT
    platform,
    ROUND(
        SUM(ad_spend) / NULLIF(SUM(conversions), 0),
        2
    ) AS cpa
FROM global_ads_performance_dataset
GROUP BY platform
ORDER BY cpa;

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
    ROUND(
        SUM(revenue) / NULLIF(SUM(ad_spend), 0),
        2
    ) AS roas
FROM global_ads_performance_dataset
GROUP BY country
ORDER BY roas DESC
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
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(ad_spend), 2) AS total_ad_spend,
    ROUND(SUM(revenue) - SUM(ad_spend), 2) AS total_profit,

    ROUND(
        SUM(revenue) / NULLIF(SUM(ad_spend), 0),
        2
    ) AS roas,

    ROUND(
        SUM(clicks) / NULLIF(SUM(impressions), 0),
        4
    ) AS ctr,

    ROUND(
        SUM(ad_spend) / NULLIF(SUM(clicks), 0),
        2
    ) AS cpc,

    ROUND(
        SUM(ad_spend) / NULLIF(SUM(conversions), 0),
        2
    ) AS cpa,

    ROUND(
        SUM(conversions) / NULLIF(SUM(clicks), 0),
        4
    ) AS conversion_rate,

    ROUND(
        (
            SUM(ad_spend) /
            NULLIF(SUM(impressions), 0)
        ) * 1000,
        2
    ) AS cpm,

    ROUND(
        (
            SUM(revenue) - SUM(ad_spend)
        ) / NULLIF(SUM(revenue), 0),
        4
    ) AS profit_margin,

    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions
FROM global_ads_performance_dataset;
