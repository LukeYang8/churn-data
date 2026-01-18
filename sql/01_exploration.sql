-- Check total number of rows aligns with csv file
SELECT COUNT(*) from telco_raw;

-- Check uniqueness of customer IDs
SELECT COUNT(DISTINCT customerid) FROM telco_raw;

-- Check churn data and distribution
SELECT churn, COUNT(*)
from telco_raw
group by churn;

-- Check values for uncertain columns	
SELECT gender, COUNT(*) from telco_raw group by gender;
SELECT partner, COUNT(*) from telco_raw group by partner;
SELECT dependents, COUNT(*) from telco_raw group by dependents;
SELECT paymentmethod, COUNT(*) from telco_raw group by paymentmethod;

-- Check numeric columns
SELECT MIN(tenure), MAX(tenure), MIN(monthlycharges), MAX(monthlycharges)
FROM telco_raw;

-- Check for nulls in totalcharges column (11 found)
SELECT COUNT(*) FROM telco_raw WHERE totalcharges = ' ';

-- Check other columns (no empty fields)
SELECT
    COUNT(*) as total_rows,
    SUM(CASE WHEN gender IS NULL or gender = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN seniorcitizen IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN partner IS NULL or partner = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN dependents IS NULL or dependents = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN phoneservice IS NULL or phoneservice = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN multiplelines IS NULL or multiplelines = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN internetservice IS NULL or internetservice = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN onlinesecurity IS NULL or onlinesecurity = '' THEN 1 ELSE 0 END),
    SUM(CASE WHEN onlinebackup IS NULL or onlinebackup = '' THEN 1 ELSE 0 END)
FROM telco_raw;