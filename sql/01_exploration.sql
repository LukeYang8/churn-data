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
