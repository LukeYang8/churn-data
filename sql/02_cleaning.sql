--
DROP TABLE IF EXISTS cleaned_telco_customer;

CREATE TABLE cleaned_telco_customer AS
SELECT
    customerid,
    gender,
    seniorcitizen,
    partner,
    dependents, 
    tenure::INT as tenure,
    multiplelines,
    internetservice, 
    onlinesecurity,
    onlinebackup,
    deviceprotection,
    techsupport,
    streamingtv,
    streamingmovies,
    contract,   
    paperlessbilling,
    paymentmethod,
    monthlycharges,
    totalcharges,
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 0
		ELSE NULL
    END as churn
FROM telco_raw;


-- verify same size
SELECT 
	(SELECT COUNT(*) FROM telco_raw) as raw,
	(SELECT COUNT(*) FROM cleaned_telco_customer) as clean;
	
-- check churn data stable
SELECT churn, COUNT(*) FROM telco_raw GROUP BY churn;
SELECT churn, COUNT(*) FROM cleaned_telco_customer GROUP BY churn;




