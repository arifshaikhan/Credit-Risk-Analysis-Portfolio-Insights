-- Step 1 : Create database
CREATE DATABASE credit_risk_db;
USE credit_risk_db;
-- Step 2 : Create table structure
CREATE TABLE loans (
  loan_id VARCHAR(50),
  customer_id VARCHAR(50),
  current_loan_amount DECIMAL(12,2),
  term INT,
  credit_score INT,
  annual_income DECIMAL(12,2),
  years_in_current_job VARCHAR(50),
  home_ownership VARCHAR(50),
  purpose VARCHAR(100),
  monthly_debt DECIMAL(12,2),
  years_of_credit_history DECIMAL(5,2),
  months_since_last_delinquent INT,
  number_of_open_accounts INT,
  number_of_credit_problems INT,
  current_credit_balance DECIMAL(12,2),
  maximum_open_credit DECIMAL(12,2),
  bankruptcies INT,
  tax_liens INT
);
-- Step 3 : Import CSV to SQL

SELECT COUNT(*) AS total_rows FROM loans;
SHOW WARNINGS;

CREATE DATABASE IF NOT EXISTS credit_risk_db;
USE credit_risk_db;
CREATE TABLE IF NOT EXISTS loans (
  loan_id VARCHAR(50),
  customer_id VARCHAR(50),
  current_loan_amount DECIMAL(12,2),
  term INT,
  credit_score INT,
  annual_income DECIMAL(12,2),
  years_in_current_job VARCHAR(50),
  home_ownership VARCHAR(50),
  purpose VARCHAR(100),
  monthly_debt DECIMAL(12,2),
  years_of_credit_history DECIMAL(5,2),
  months_since_last_delinquent INT,
  number_of_open_accounts INT,
  number_of_credit_problems INT,
  current_credit_balance DECIMAL(12,2),
  maximum_open_credit DECIMAL(12,2),
  bankruptcies INT,
  tax_liens INT
);
LOAD DATA INFILE 'C:/Users/user/Downloads/train.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM loans;
TRUNCATE TABLE loans;
LOAD DATA INFILE 'C:/Users/user/Downloads/train.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM loans;
TRUNCATE TABLE loans;

LOAD DATA INFILE 'C:/Users/user/Downloads/train.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  loan_id,
  customer_id,
  current_loan_amount,
  term,
  credit_score,
  annual_income,
  years_in_current_job,
  home_ownership,
  purpose,
  monthly_debt,
  years_of_credit_history,
  months_since_last_delinquent,
  number_of_open_accounts,
  number_of_credit_problems,
  current_credit_balance,
  maximum_open_credit,
  bankruptcies,
  tax_liens
);
SELECT COUNT(*) FROM loans;
USE credit_risk_db;
SELECT COUNT(*) FROM loans;
USE credit_risk_db;
SHOW TABLES;
SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'credit_risk_db';

DROP TABLE IF EXISTS loans;
SELECT COUNT(*) FROM loans;
DROP TABLE IF EXISTS loans;
CREATE TABLE loans (
  loan_id VARCHAR(50),
  customer_id VARCHAR(50),
  current_loan_amount FLOAT,
  term INT,
  credit_score INT,
  annual_income FLOAT,
  years_in_current_job VARCHAR(50),
  home_ownership VARCHAR(50),
  purpose VARCHAR(50),
  monthly_debt FLOAT,
  years_of_credit_history FLOAT,
  months_since_last_delinquent INT,
  number_of_open_accounts INT,
  number_of_credit_problems INT,
  current_credit_balance FLOAT,
  maximum_open_credit FLOAT,
  bankruptcies INT,
  tax_liens INT
);
LOAD DATA INFILE 'C:/Users/user/Downloads/train.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM loans;
SHOW WARNINGS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/train.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/Users/user/Downloads/train.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM loans;
USE credit_risk_db;
SELECT COUNT(*) AS rows_loaded FROM loans;
SHOW TABLES;
SELECT COUNT(*) FROM loans;
SELECT DATABASE();
USE credit_risk_db;
DROP TABLE loans;
SELECT COUNT(*) FROM loans;

-- Day 3: Data Cleaning & Preparation
-- Objective: Improve data quality and prepare analytic dataset
USE credit_risk_db;
SELECT COUNT(*) FROM loans;
USE credit_risk_db;
DROP TABLE IF EXISTS loans_clean;
CREATE TABLE loans_clean LIKE loans;
INSERT INTO loans_clean
SELECT
  `Loan ID` AS loan_id,
  `Customer ID` AS customer_id,
  CAST(`Current Loan Amount` AS DECIMAL(12,2)) AS current_loan_amount,
  CAST(`Term` AS SIGNED) AS term,
  CAST(`Credit Score` AS SIGNED) AS credit_score,
  CAST(`Annual Income` AS DECIMAL(12,2)) AS annual_income,

  CASE
    WHEN `Years in current job` IN ('< 1 year','1 year','2 years','3 years','4 years','5 years','6 years','7 years','8 years','9 years','10+ years')
      THEN `Years in current job`
    ELSE 'Unknown'
  END AS years_in_current_job,

  `Home Ownership` AS home_ownership,
  `Purpose` AS purpose,

  CAST(`Monthly Debt` AS DECIMAL(12,2)) AS monthly_debt,
  CAST(`Years of Credit History` AS DECIMAL(5,2)) AS years_of_credit_history,
  CAST(`Months since last delinquent` AS SIGNED) AS months_since_last_delinquent,
  CAST(`Number of Open Accounts` AS SIGNED) AS number_of_open_accounts,
  CAST(`Number of Credit Problems` AS SIGNED) AS number_of_credit_problems,
  CAST(`Current Credit Balance` AS DECIMAL(12,2)) AS current_credit_balance,
  CAST(`Maximum Open Credit` AS DECIMAL(12,2)) AS maximum_open_credit,
  CAST(`Bankruptcies` AS SIGNED) AS bankruptcies,
  CAST(`Tax Liens` AS SIGNED) AS tax_liens
FROM loans;
SHOW COLUMNS FROM loans;
ALTER TABLE loans
CHANGE COLUMN `ï»¿Loan ID` loan_id VARCHAR(50);
ALTER TABLE loans
CHANGE COLUMN `Customer ID` customer_id VARCHAR(50),
CHANGE COLUMN `Current Loan Amount` current_loan_amount INT,
CHANGE COLUMN `Term` term VARCHAR(50),
CHANGE COLUMN `Credit Score` credit_score INT,
CHANGE COLUMN `Annual Income` annual_income INT,
CHANGE COLUMN `Years in current job` years_in_current_job VARCHAR(50),
CHANGE COLUMN `Home Ownership` home_ownership VARCHAR(50),
CHANGE COLUMN `Purpose` purpose VARCHAR(100),
CHANGE COLUMN `Monthly Debt` monthly_debt DOUBLE,
CHANGE COLUMN `Years of Credit History` years_of_credit_history DOUBLE,
CHANGE COLUMN `Months since last delinquent` months_since_last_delinquent VARCHAR(50),
CHANGE COLUMN `Number of Open Accounts` number_of_open_accounts INT,
CHANGE COLUMN `Number of Credit Problems` number_of_credit_problems INT,
CHANGE COLUMN `Current Credit Balance` current_credit_balance INT,
CHANGE COLUMN `Maximum Open Credit` maximum_open_credit INT,
CHANGE COLUMN `Bankruptcies` bankruptcies INT,
CHANGE COLUMN `Tax Liens` tax_liens INT;
SHOW COLUMNS FROM loans;
DROP TABLE IF EXISTS loans_clean;
SHOW COLUMNS FROM loans;
SELECT COUNT(*) AS total_rows FROM loans;
SELECT
  SUM(CASE WHEN credit_score IS NULL THEN 1 ELSE 0 END) AS credit_score_nulls,
  SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS income_nulls,
  SUM(CASE WHEN months_since_last_delinquent IS NULL THEN 1 ELSE 0 END) AS delinquent_nulls
FROM loans;
SELECT
  SUM(CASE WHEN credit_score IS NULL THEN 1 ELSE 0 END) AS credit_score_nulls,
  SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS income_nulls,
  SUM(CASE WHEN months_since_last_delinquent IS NULL THEN 1 ELSE 0 END) AS delinquent_nulls,
  SUM(CASE WHEN years_in_current_job IS NULL THEN 1 ELSE 0 END) AS job_nulls
FROM loans_clean;
SELECT
  credit_score,
  annual_income,
  months_since_last_delinquent,
  years_in_current_job
FROM loans_clean
WHERE
  credit_score IS NULL
  OR annual_income IS NULL
  OR months_since_last_delinquent IS NULL
  OR years_in_current_job IS NULL
LIMIT 20;
SELECT
  SUM(CASE WHEN credit_score = '' THEN 1 ELSE 0 END) AS credit_score_empty,
  SUM(CASE WHEN annual_income = '' THEN 1 ELSE 0 END) AS income_empty,
  SUM(CASE WHEN months_since_last_delinquent = '' THEN 1 ELSE 0 END) AS delinquent_empty,
  SUM(CASE WHEN years_in_current_job = '' THEN 1 ELSE 0 END) AS job_empty
FROM loans_clean;
UPDATE loans_clean
SET
  credit_score = NULLIF(TRIM(credit_score), ''),
  annual_income = NULLIF(TRIM(annual_income), ''),
  months_since_last_delinquent = NULLIF(TRIM(months_since_last_delinquent), ''),
  years_in_current_job = NULLIF(TRIM(years_in_current_job), '');
  SELECT
  SUM(CASE WHEN credit_score IS NULL THEN 1 ELSE 0 END) AS credit_score_nulls,
  SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS income_nulls,
  SUM(CASE WHEN months_since_last_delinquent IS NULL THEN 1 ELSE 0 END) AS delinquent_nulls,
  SUM(CASE WHEN years_in_current_job IS NULL THEN 1 ELSE 0 END) AS job_nulls
FROM loans_clean;
SELECT DISTINCT credit_score
FROM loans_clean
WHERE credit_score NOT REGEXP '^[0-9]+$'
LIMIT 20;
SELECT DISTINCT annual_income
FROM loans_clean
WHERE annual_income NOT REGEXP '^[0-9]+$'
LIMIT 20;
SELECT DISTINCT months_since_last_delinquent
FROM loans_clean
WHERE months_since_last_delinquent NOT REGEXP '^[0-9]+$'
LIMIT 20;
SELECT DISTINCT years_in_current_job
FROM loans_clean
WHERE years_in_current_job NOT REGEXP '^[0-9]+$'
LIMIT 20;
SELECT DISTINCT term
FROM loans_clean
LIMIT 50;
SELECT DISTINCT years_in_current_job
FROM loans_clean
LIMIT 50;
SELECT DISTINCT months_since_last_delinquent
FROM loans_clean
LIMIT 50;

UPDATE loans_clean
SET
  credit_score = COALESCE(credit_score, 0),
  annual_income = COALESCE(annual_income, 0),
  months_since_last_delinquent = COALESCE(months_since_last_delinquent, '999'),
  years_in_current_job = COALESCE(years_in_current_job, 'Unknown');
  SELECT 
  COUNT(*) AS empty_count
FROM loans_clean
WHERE TRIM(months_since_last_delinquent) = '';
SELECT loan_id, months_since_last_delinquent
FROM loans_clean
LIMIT 20;
SELECT
  COUNT(*) AS total_rows,
  COUNT(months_since_last_delinquent) AS non_null_rows,
  SUM(CASE WHEN months_since_last_delinquent IS NULL THEN 1 ELSE 0 END) AS null_rows
FROM loans_clean;
SELECT
  COUNT(*) AS total_rows,
  COUNT(months_since_last_delinquent) AS non_null_rows,
  SUM(CASE WHEN months_since_last_delinquent IS NULL THEN 1 ELSE 0 END) AS null_rows
FROM loans;
SELECT loan_id, months_since_last_delinquent
FROM loans
LIMIT 20;
SELECT
  loan_id,
  months_since_last_delinquent,
  LENGTH(months_since_last_delinquent) AS len
FROM loans
LIMIT 20;
UPDATE loans
SET months_since_last_delinquent = NULL
WHERE months_since_last_delinquent = 'NA';
SELECT
  COUNT(*) AS total_rows,
  COUNT(months_since_last_delinquent) AS non_null_rows,
  SUM(CASE WHEN months_since_last_delinquent IS NULL THEN 1 ELSE 0 END) AS null_rows
FROM loans;
DROP TABLE IF EXISTS loans_clean;
CREATE TABLE loans_clean AS
SELECT
  loan_id,
  customer_id,
  current_loan_amount,
  term,
  credit_score,
  annual_income,
  years_in_current_job,
  home_ownership,
  purpose,
  monthly_debt,
  years_of_credit_history,
  NULLIF(TRIM(months_since_last_delinquent), '') AS months_since_last_delinquent,
  number_of_open_accounts,
  number_of_credit_problems,
  current_credit_balance,
  maximum_open_credit,
  bankruptcies,
  tax_liens
FROM loans;
ALTER TABLE loans_clean
ADD COLUMN months_since_last_delinquent_int INT;
UPDATE loans_clean
SET months_since_last_delinquent_int = CAST(months_since_last_delinquent AS SIGNED);
SELECT
  COUNT(*) AS total_rows,
  COUNT(months_since_last_delinquent_int) AS non_null_int_rows,
  SUM(CASE WHEN months_since_last_delinquent_int IS NULL THEN 1 ELSE 0 END) AS null_int_rows
FROM loans_clean;
ALTER TABLE loans_clean
ADD COLUMN is_default INT;
UPDATE loans_clean
SET is_default = CASE
  WHEN (months_since_last_delinquent_int IS NOT NULL AND months_since_last_delinquent_int <= 12)
       OR bankruptcies > 0
       OR tax_liens > 0
       OR credit_score < 600
  THEN 1
  ELSE 0
END;
SELECT
  is_default,
  COUNT(*) AS count
FROM loans_clean
GROUP BY is_default;

SELECT COUNT(*) FROM loans_clean;
SELECT
  is_default,
  COUNT(*) AS cnt
FROM loans_clean
GROUP BY is_default;
SELECT
  SUM(credit_score IS NULL) AS null_credit_score,
  SUM(annual_income IS NULL) AS null_income,
  SUM(monthly_debt IS NULL) AS null_monthly_debt,
  SUM(years_in_current_job IS NULL) AS null_job_years,
  SUM(home_ownership IS NULL) AS null_home_ownership
FROM loans_clean;
SELECT
  MIN(credit_score) AS min_cs,
  MAX(credit_score) AS max_cs,
  MIN(annual_income) AS min_income,
  MAX(annual_income) AS max_income
FROM loans_clean;
-- Replace unrealistic credit scores with NULL or filter them out
UPDATE loans_clean
SET credit_score = NULL
WHERE credit_score > 850;
-- Filtered/cleaned view for EDA
CREATE OR REPLACE VIEW loans_clean_eda AS
SELECT *
FROM loans_clean
WHERE credit_score BETWEEN 300 AND 850
  AND annual_income <= 500000;
SELECT COUNT(*) AS original_count FROM loans_clean;
SELECT COUNT(*) AS eda_count
FROM loans_clean
WHERE credit_score BETWEEN 300 AND 850
  AND annual_income <= 500000;
-- Step 1: Check current extremes
SELECT MIN(credit_score) AS min_cs, MAX(credit_score) AS max_cs
FROM loans_clean;
-- Step 2: Rescale if necessary (divide by 10 if max > 1000)
UPDATE loans_clean
SET credit_score = credit_score / 10
WHERE credit_score > 1000;
-- Step 3: Verify
SELECT MIN(credit_score) AS min_cs, MAX(credit_score) AS max_cs
FROM loans_clean;

-- Step 1: Inspect high incomes
SELECT *
FROM loans_clean
WHERE annual_income > 1000000
ORDER BY annual_income DESC;
-- Step 2: Rescale extreme high values (divide by 100)
UPDATE loans_clean
SET annual_income = annual_income / 100
WHERE annual_income > 1000000;
-- Step 3: Optional cap at 500,000 for EDA
CREATE OR REPLACE VIEW loans_clean_eda AS
SELECT *
FROM loans_clean
WHERE credit_score BETWEEN 300 AND 850
  AND annual_income <= 500000;
-- Step 4: Verify
SELECT MIN(annual_income) AS min_income, MAX(annual_income) AS max_income
FROM loans_clean_eda;
-- Step 5: Check how many rows remain
SELECT COUNT(*) AS eda_count FROM loans_clean_eda;

USE credit_risk_db;

-- =====================================
-- Day 4: Exploratory Data Analysis (EDA)
-- Dataset: loans_clean_eda (5,083 clean rows)
-- Purpose: Identify key drivers of loan default
-- =====================================

-- 1️ Default rate by Credit Score Band
SELECT
  CASE
    WHEN credit_score < 580 THEN 'Very Poor (<580)'
    WHEN credit_score BETWEEN 580 AND 669 THEN 'Fair (580–669)'
    WHEN credit_score BETWEEN 670 AND 739 THEN 'Good (670–739)'
    WHEN credit_score BETWEEN 740 AND 799 THEN 'Very Good (740–799)'
    ELSE 'Excellent (800+)'
  END AS credit_score_band,
  COUNT(*) AS total_loans,
  SUM(is_default) AS default_count,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS default_rate_pct
FROM loans_clean_eda
GROUP BY credit_score_band
ORDER BY default_rate_pct DESC;

-- 2️ Default rate by Income Band
SELECT
  CASE
    WHEN annual_income < 30000 THEN '<30k'
    WHEN annual_income BETWEEN 30000 AND 59999 THEN '30k–60k'
    WHEN annual_income BETWEEN 60000 AND 99999 THEN '60k–100k'
    ELSE '>100k'
  END AS income_band,
  COUNT(*) AS total_loans,
  SUM(is_default) AS default_count,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS default_rate_pct
FROM loans_clean_eda
GROUP BY income_band
ORDER BY default_rate_pct DESC;

-- 3️ Default rate by DTI Band
-- Calculate DTI first: Monthly Debt / (Annual Income / 12)
SELECT
  CASE
    WHEN monthly_debt/(annual_income/12) < 0.2 THEN 'DTI <20%'
    WHEN monthly_debt/(annual_income/12) BETWEEN 0.2 AND 0.35 THEN 'DTI 20-35%'
    ELSE 'DTI >35%'
  END AS dti_band,
  COUNT(*) AS total_loans,
  SUM(is_default) AS default_count,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS default_rate_pct
FROM loans_clean_eda
GROUP BY dti_band
ORDER BY default_rate_pct DESC;

-- 4️ Default rate by Home Ownership
SELECT
  home_ownership,
  COUNT(*) AS total_loans,
  SUM(is_default) AS default_count,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS default_rate_pct
FROM loans_clean_eda
GROUP BY home_ownership
ORDER BY default_rate_pct DESC;

-- 5️ Default rate by Years in Current Job
SELECT
  CASE
    WHEN years_in_current_job < 2 THEN '<2 yrs'
    WHEN years_in_current_job BETWEEN 2 AND 5 THEN '2-5 yrs'
    WHEN years_in_current_job BETWEEN 6 AND 10 THEN '6-10 yrs'
    ELSE '>10 yrs'
  END AS job_tenure_band,
  COUNT(*) AS total_loans,
  SUM(is_default) AS default_count,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS default_rate_pct
FROM loans_clean_eda
GROUP BY job_tenure_band
ORDER BY default_rate_pct DESC;

-- 6️ Overall Portfolio Default Rate
SELECT
  COUNT(*) AS total_loans,
  SUM(is_default) AS default_loans,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS portfolio_default_rate
FROM loans_clean_eda;

-- Duplicates check
SELECT loan_id, COUNT(*) AS cnt
FROM loans_clean_eda
GROUP BY loan_id
HAVING cnt > 1;
-- Missing IDs
SELECT COUNT(*) AS missing_ids
FROM loans_clean_eda
WHERE loan_id IS NULL OR customer_id IS NULL;
-- Credit Score & Income
SELECT 
    MIN(credit_score) AS min_cs,
    MAX(credit_score) AS max_cs,
    MIN(annual_income) AS min_income,
    MAX(annual_income) AS max_income
FROM loans_clean_eda;
-- DTI quick check (monthly_debt / (annual_income / 12))
SELECT 
    MIN(monthly_debt/(annual_income/12)) AS min_dti,
    MAX(monthly_debt/(annual_income/12)) AS max_dti,
    ROUND(AVG(monthly_debt/(annual_income/12)),2) AS avg_dti
FROM loans_clean_eda;
SELECT home_ownership, COUNT(*) AS cnt
FROM loans_clean_eda
GROUP BY home_ownership;
SELECT purpose, COUNT(*) AS cnt
FROM loans_clean_eda
GROUP BY purpose;
SELECT
    SUM(bankruptcies) AS total_bankruptcies,
    SUM(tax_liens) AS total_tax_liens,
    SUM(number_of_credit_problems) AS total_credit_problems
FROM loans_clean_eda;

USE credit_risk_db;
-- =====================================
-- Day 5: ABT Creation (Analytical Base Table)
-- Dataset: loans_clean_eda (5,083 rows)
-- Purpose: Combine raw + derived + risk features
-- Deliverables: credit_risk_abt view + summary stats
-- =====================================

-- 1️ Drop ABT if exists
DROP VIEW IF EXISTS credit_risk_abt;

-- 2️ Create ABT view with derived metrics and high-risk flag
CREATE VIEW credit_risk_abt AS
SELECT
    loan_id,
    customer_id,
    is_default,
    current_loan_amount,
    term,
    purpose,
    credit_score,
    annual_income,
    years_in_current_job,
    home_ownership,
    -- Derived fields
    ROUND(monthly_debt / (annual_income / 12), 2) AS dti,
    ROUND(current_credit_balance / NULLIF(maximum_open_credit,0), 2) AS credit_utilization,
    -- Risk flags
    bankruptcies,
    tax_liens,
    number_of_credit_problems,
    -- Optional: recent delinquency months
    months_since_last_delinquent,
    -- High-risk flag
    CASE
        WHEN (monthly_debt / (annual_income / 12)) > 0.35
             OR credit_score < 600
             OR bankruptcies > 0
             OR tax_liens > 0
             OR number_of_credit_problems > 2 THEN 1
        ELSE 0
    END AS high_risk_flag
FROM loans_clean_eda;

-- 3️ Quick sanity checks
-- a) Count rows
SELECT COUNT(*) AS abt_rows FROM credit_risk_abt;
-- b) Check for duplicates
SELECT loan_id, COUNT(*) AS cnt
FROM credit_risk_abt
GROUP BY loan_id
HAVING cnt > 1;
-- c) Check NULLs for identifiers
SELECT COUNT(*) AS null_ids
FROM credit_risk_abt
WHERE loan_id IS NULL OR customer_id IS NULL;

-- 4️ Summary statistics (Day 5 outcome)
SELECT
    COUNT(*) AS total_loans,
    SUM(is_default) AS total_defaults,
    ROUND(AVG(dti),2) AS avg_dti,
    ROUND(AVG(credit_utilization),2) AS avg_utilization,
    SUM(high_risk_flag) AS total_high_risk
FROM credit_risk_abt;

-- DAY 6 RISK METRICS AND SCORING 
-- STEP 1 Final ABT Check 
 SELECT
  COUNT(*) AS total_rows,
  SUM(is_default) AS total_defaults
FROM credit_risk_abt;
-- STEP 2 Create individual risk scores 
-- 2a Credit Score Risk 
SELECT
  loan_id,
  credit_score,
  CASE
    WHEN credit_score < 580 THEN 5
    WHEN credit_score < 620 THEN 4
    WHEN credit_score < 660 THEN 3
    WHEN credit_score < 700 THEN 2
    ELSE 1
  END AS credit_score_risk
FROM credit_risk_abt;
-- 2b DTI Risk
SELECT
  loan_id,
  dti,
  CASE
    WHEN dti > 0.40 THEN 5
    WHEN dti > 0.35 THEN 4
    WHEN dti > 0.25 THEN 3
    WHEN dti > 0.15 THEN 2
    ELSE 1
  END AS dti_risk
FROM credit_risk_abt;
-- 2c Credit Utilisation Risk
SELECT
  loan_id,
  credit_utilization,
  CASE
    WHEN credit_utilization > 0.90 THEN 5
    WHEN credit_utilization > 0.75 THEN 4
    WHEN credit_utilization > 0.50 THEN 3
    WHEN credit_utilization > 0.30 THEN 2
    ELSE 1
  END AS utilization_risk
FROM credit_risk_abt;
-- STEP 3 Final Risk Score
DROP VIEW IF EXISTS credit_risk_scoring;
CREATE VIEW credit_risk_scoring AS
SELECT
  loan_id,
  customer_id,
  is_default,
  credit_score,
  dti,
  credit_utilization,
  -- individual scores
  CASE
    WHEN credit_score < 580 THEN 5
    WHEN credit_score < 620 THEN 4
    WHEN credit_score < 660 THEN 3
    WHEN credit_score < 700 THEN 2
    ELSE 1
  END AS credit_score_risk,
  CASE
    WHEN dti > 0.40 THEN 5
    WHEN dti > 0.35 THEN 4
    WHEN dti > 0.25 THEN 3
    WHEN dti > 0.15 THEN 2
    ELSE 1
  END AS dti_risk,
  CASE
    WHEN credit_utilization > 0.90 THEN 5
    WHEN credit_utilization > 0.75 THEN 4
    WHEN credit_utilization > 0.50 THEN 3
    WHEN credit_utilization > 0.30 THEN 2
    ELSE 1
  END AS utilization_risk,
  -- final weighted risk score
  ROUND(
      0.5 *
      (CASE
        WHEN credit_score < 580 THEN 5
        WHEN credit_score < 620 THEN 4
        WHEN credit_score < 660 THEN 3
        WHEN credit_score < 700 THEN 2
        ELSE 1
      END)
    + 0.3 *
      (CASE
        WHEN dti > 0.40 THEN 5
        WHEN dti > 0.35 THEN 4
        WHEN dti > 0.25 THEN 3
        WHEN dti > 0.15 THEN 2
        ELSE 1
      END)
    + 0.2 *
      (CASE
        WHEN credit_utilization > 0.90 THEN 5
        WHEN credit_utilization > 0.75 THEN 4
        WHEN credit_utilization > 0.50 THEN 3
        WHEN credit_utilization > 0.30 THEN 2
        ELSE 1
      END)
  ,2) AS risk_score
FROM credit_risk_abt;
SHOW FULL TABLES IN credit_risk_db;
SELECT COUNT(*) FROM credit_risk_scoring;
-- STEP 4 
SELECT
  loan_id,
  risk_score,
  is_default
FROM credit_risk_scoring
ORDER BY risk_score DESC
LIMIT 10;
-- STEP 5 Sanity Check
SELECT
  ROUND(risk_score,1) AS risk_band,
  COUNT(*) AS loans,
  SUM(is_default) AS defaults,
  ROUND(SUM(is_default)/COUNT(*)*100,2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY ROUND(risk_score,1)
ORDER BY risk_band DESC;
-- STEP 6 Risk bands (Low/Medium/High)
SELECT
  CASE
    WHEN risk_score >= 3.5 THEN 'Low Risk'
    WHEN risk_score >= 2.5 THEN 'Medium Risk'
    ELSE 'High Risk'
  END AS risk_band,
  COUNT(*) AS total_loans,
  SUM(is_default) AS defaults,
  ROUND(100 * SUM(is_default) / COUNT(*), 2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY risk_band
ORDER BY default_rate_pct DESC;
-- STEP 7 Portfolio Risk Distribution
SELECT
  risk_band,
  COUNT(*) AS loans,
  ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM credit_risk_scoring), 2) AS portfolio_pct
FROM (
  SELECT
    CASE
      WHEN risk_score >= 3.5 THEN 'Low Risk'
      WHEN risk_score >= 2.5 THEN 'Medium Risk'
      ELSE 'High Risk'
    END AS risk_band
  FROM credit_risk_scoring
) t
GROUP BY risk_band;
-- STEP 8 Executive Summary Matrics
SELECT
  COUNT(*) AS total_loans,
  SUM(is_default) AS total_defaults,
  ROUND(100 * SUM(is_default) / COUNT(*), 2) AS overall_default_rate,
  ROUND(AVG(risk_score), 2) AS avg_risk_score,
  MIN(risk_score) AS min_risk_score,
  MAX(risk_score) AS max_risk_score
FROM credit_risk_scoring;

-- DAY 7 : Segmentation
-- STEP 1 : CREATE RISK BANDS FROM RISK SCORE
SELECT
    loan_id,
    risk_score,
    CASE
        WHEN risk_score < 2.0 THEN 'Low Risk'
        WHEN risk_score >= 2.0 AND risk_score < 5.0 THEN 'Medium Risk'
        WHEN risk_score >= 5.0 AND risk_score < 8.0 THEN 'High Risk'
        ELSE 'Very High Risk'
    END AS risk_band
FROM credit_risk_scoring;
-- SANITY CHECK
DESCRIBE credit_risk_scoring;
-- SANITY check 
SELECT
    ROUND(risk_score, 1) AS risk_band,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaults,
    ROUND(100 * SUM(is_default) / COUNT(*), 2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY ROUND(risk_score, 1)
ORDER BY risk_band DESC;

-- STEP 2: Risk Bucket Segmentation
SELECT
  CASE
    WHEN risk_score >= 3.5 THEN 'High Risk'
    WHEN risk_score >= 2.5 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS risk_bucket,
  COUNT(*) AS total_loans,
  SUM(is_default) AS total_defaults,
  ROUND(100 * SUM(is_default) / COUNT(*), 2) AS default_rate_pct,
  ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM credit_risk_scoring
GROUP BY risk_bucket
ORDER BY avg_risk_score DESC;

-- STEP 3: Risk Profiling by Bucket 
SELECT
  CASE
    WHEN risk_score >= 3.5 THEN 'High Risk'
    WHEN risk_score >= 2.5 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS risk_bucket,
  ROUND(AVG(credit_score), 0) AS avg_credit_score,
  ROUND(AVG(dti), 2) AS avg_dti,
  ROUND(AVG(credit_utilization), 2) AS avg_utilization,
  COUNT(*) AS loans
FROM credit_risk_scoring
GROUP BY risk_bucket
ORDER BY avg_credit_score ASC;

-- Step 4: Top 3 Risk Drivers (MySQL-friendly)
-- Credit Score, DTI, Credit Utilization
-- 4a Credit Score
SELECT 
    'credit_score' AS variable,
    ROUND(MIN(credit_score)/20)*20 AS min_band,
    ROUND(MAX(credit_score)/20)*20 AS max_band,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    ROUND(100*SUM(is_default)/COUNT(*),2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY ROUND(credit_score/20)*20
UNION ALL
-- 4b DTI
SELECT
    'dti' AS variable,
    MIN(dti) AS min_band,
    MAX(dti) AS max_band,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    ROUND(100*SUM(is_default)/COUNT(*),2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY CASE
    WHEN dti > 0.40 THEN '>40%'
    WHEN dti > 0.30 THEN '30-40%'
    WHEN dti > 0.20 THEN '20-30%'
    ELSE '<=20%'
END
UNION ALL
-- 4c Credit Utilization
SELECT
    'credit_utilization' AS variable,
    MIN(credit_utilization) AS min_band,
    MAX(credit_utilization) AS max_band,
    COUNT(*) AS loans,
    SUM(is_default) AS defaults,
    ROUND(100*SUM(is_default)/COUNT(*),2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY CASE
    WHEN credit_utilization > 0.90 THEN '>90%'
    WHEN credit_utilization > 0.75 THEN '75-90%'
    WHEN credit_utilization > 0.50 THEN '50-75%'
    ELSE '<=50%'
END
ORDER BY variable, default_rate_pct DESC;

-- STEP 5: Top Risk Drivers Summary
-- Calculate default rates by main drivers and rank them
-- 5a Credit Score
SELECT
    'Credit Score' AS variable,
    ROUND(credit_score, -1) AS bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaults,
    ROUND(100 * SUM(is_default)/COUNT(*), 2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY variable, bucket
ORDER BY default_rate_pct DESC
LIMIT 5;
-- 5b Credit Utilization
SELECT
    'Credit Utilization' AS variable,
    CASE
        WHEN credit_utilization BETWEEN 0 AND 0.5 THEN '0–0.5'
        WHEN credit_utilization BETWEEN 0.51 AND 0.75 THEN '0.51–0.75'
        WHEN credit_utilization BETWEEN 0.76 AND 0.9 THEN '0.76–0.9'
        ELSE '0.91–1.0'
    END AS bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaults,
    ROUND(100 * SUM(is_default)/COUNT(*), 2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY variable, bucket
ORDER BY default_rate_pct DESC;
-- 5c DTI
SELECT
    'Debt-to-Income Ratio' AS variable,
    CASE
        WHEN dti BETWEEN 0 AND 0.2 THEN '0–0.2'
        WHEN dti BETWEEN 0.21 AND 0.3 THEN '0.21–0.3'
        WHEN dti BETWEEN 0.31 AND 0.4 THEN '0.31–0.4'
        ELSE '>0.4'
    END AS bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaults,
    ROUND(100 * SUM(is_default)/COUNT(*), 2) AS default_rate_pct
FROM credit_risk_scoring
GROUP BY variable, bucket
ORDER BY default_rate_pct DESC;

-- STEP 6: Risk Driver Buckets (Credit Score, Utilization, DTI)
SELECT *
FROM (
    -- 6a Credit Score Buckets
    SELECT
        'Credit Score' AS variable,
        ROUND(credit_score, -1) AS bucket,
        COUNT(*) AS total_loans,
        SUM(is_default) AS defaults,
        ROUND(100 * SUM(is_default)/COUNT(*), 2) AS default_rate_pct
    FROM credit_risk_scoring
    GROUP BY bucket
    UNION ALL
    -- 6b Credit Utilization Buckets
    SELECT
        'Credit Utilization' AS variable,
        CASE
            WHEN credit_utilization BETWEEN 0 AND 0.5 THEN '0–0.5'
            WHEN credit_utilization BETWEEN 0.51 AND 0.75 THEN '0.51–0.75'
            WHEN credit_utilization BETWEEN 0.76 AND 0.9 THEN '0.76–0.9'
            ELSE '0.91–1.0'
        END AS bucket,
        COUNT(*) AS total_loans,
        SUM(is_default) AS defaults,
        ROUND(100 * SUM(is_default)/COUNT(*), 2) AS default_rate_pct
    FROM credit_risk_scoring
    GROUP BY bucket
    UNION ALL
    -- 6c DTI Buckets
    SELECT
        'Debt-to-Income Ratio' AS variable,
        CASE
            WHEN dti BETWEEN 0 AND 0.2 THEN '0–0.2'
            WHEN dti BETWEEN 0.21 AND 0.3 THEN '0.21–0.3'
            WHEN dti BETWEEN 0.31 AND 0.4 THEN '0.31–0.4'
            ELSE '>0.4'
        END AS bucket,
        COUNT(*) AS total_loans,
        SUM(is_default) AS defaults,
        ROUND(100 * SUM(is_default)/COUNT(*), 2) AS default_rate_pct
    FROM credit_risk_scoring
    GROUP BY bucket
) t
ORDER BY variable, bucket;

-- STEP 8 Identify Risk Bands
-- 8a Create Risk Buckets 
DROP VIEW IF EXISTS risk_band_view;
CREATE VIEW risk_band_view AS
SELECT
    loan_id,
    customer_id,
    risk_score,
    is_default,
    CASE
        WHEN risk_score >= 3.5 THEN 'Low Risk'
        WHEN risk_score >= 2.5 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_band
FROM credit_risk_scoring;
-- 8b Risk Metrics
SELECT
    r.risk_band,
    COUNT(*) AS total_loans,
    SUM(r.is_default) AS total_defaults,  -- specify table alias
    ROUND(100 * SUM(r.is_default)/COUNT(*),2) AS default_rate_pct,
    ROUND(AVG(r.risk_score),2) AS avg_risk_score,
    ROUND(AVG(c.dti),2) AS avg_dti,
    ROUND(AVG(c.credit_utilization),2) AS avg_utilization,
    ROUND(AVG(c.annual_income)/1000,2) AS avg_income_k
FROM risk_band_view r
JOIN credit_risk_abt c ON r.loan_id = c.loan_id
GROUP BY r.risk_band
ORDER BY default_rate_pct DESC;
-- 8c Top 3 Drivers
SELECT
    'credit_score' AS risk_driver,
    ROUND(100*SUM(CASE WHEN credit_score<660 THEN 1 ELSE 0 END)/COUNT(*),2) AS high_risk_pct
FROM credit_risk_abt
UNION ALL
SELECT
    'dti' AS risk_driver,
    ROUND(100*SUM(CASE WHEN dti>0.35 THEN 1 ELSE 0 END)/COUNT(*),2)
FROM credit_risk_abt
UNION ALL
SELECT
    'credit_utilization' AS risk_driver,
    ROUND(100*SUM(CASE WHEN credit_utilization>0.75 THEN 1 ELSE 0 END)/COUNT(*),2)
FROM credit_risk_abt;
-- 8d Portfolio Distribution
SELECT
    risk_band,
    COUNT(*) AS loans,
    ROUND(100*COUNT(*)/(SELECT COUNT(*) FROM credit_risk_abt),2) AS portfolio_pct
FROM risk_band_view
GROUP BY risk_band
ORDER BY portfolio_pct DESC;

-- DAY 8 Trend Analysis & Window Functions
-- Sanity Check 
SELECT COUNT(*) FROM credit_risk_scoring;
DESCRIBE credit_risk_scoring;
SHOW FULL TABLES IN credit_risk_db;

-- Step 1 : Rank Loans by Risk Score
SELECT
  loan_id,
  customer_id,
  risk_score,
  is_default,
  RANK() OVER (ORDER BY risk_score DESC) AS risk_rank
FROM credit_risk_scoring
ORDER BY risk_rank
LIMIT 20;

-- Step 2 Cumulative Default by Risk Rank
SELECT
  loan_id,
  risk_score,
  is_default,
  SUM(is_default) OVER (
    ORDER BY risk_score DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_defaults,
  SUM(is_default) OVER () AS total_defaults,
  ROUND(
    100 * 
    SUM(is_default) OVER (
      ORDER BY risk_score DESC
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )
    / SUM(is_default) OVER (),
    2
  ) AS cumulative_default_pct
FROM credit_risk_scoring
ORDER BY risk_score DESC
LIMIT 30;

-- Step 3: Create risk bands
-- Step 3–5 fixed: calculate cumulative defaults using a subquery
SELECT
    loan_id,
    risk_score,
    risk_band,
    is_default,
    SUM(is_default) OVER (PARTITION BY risk_band ORDER BY risk_score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_defaults,
    COUNT(*) OVER (PARTITION BY risk_band ORDER BY risk_score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_loans,
    ROUND(
        100.0 * SUM(is_default) OVER (PARTITION BY risk_band ORDER BY risk_score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) /
        COUNT(*) OVER (PARTITION BY risk_band ORDER BY risk_score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),
        2
    ) AS cumulative_default_pct
FROM (
    SELECT
        loan_id,
        risk_score,
        is_default,
        CASE
            WHEN risk_score >= 4.5 THEN 'Very High Risk'
            WHEN risk_score >= 4.0 THEN 'High Risk'
            WHEN risk_score >= 3.5 THEN 'Medium Risk'
            WHEN risk_score >= 3.0 THEN 'Low Risk'
            ELSE 'Very Low Risk'
        END AS risk_band
    FROM credit_risk_scoring
) t
ORDER BY risk_band DESC, risk_score DESC
LIMIT 20;

-- Finalise
-- DAY 8: TREND ANALYSIS & WINDOW FUNCTIONS
-- Sanity check
SELECT COUNT(*) AS total_loans FROM credit_risk_scoring;
DESCRIBE credit_risk_scoring;

-- Step 1: Rank all loans by risk score
SELECT
    loan_id,
    customer_id,
    risk_score,
    is_default,
    RANK() OVER (ORDER BY risk_score DESC) AS risk_rank
FROM credit_risk_scoring
ORDER BY risk_rank
LIMIT 20;

-- Step 2: Cumulative defaults & cumulative default %
SELECT
    loan_id,
    risk_score,
    is_default,
    SUM(is_default) OVER (ORDER BY risk_score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_defaults,
    SUM(is_default) OVER () AS total_defaults,
    ROUND(
        100.0 * SUM(is_default) OVER (ORDER BY risk_score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) /
        SUM(is_default) OVER (),
        2
    ) AS cumulative_default_pct
FROM credit_risk_scoring
ORDER BY risk_score DESC
LIMIT 30;

-- Step 3: Assign risk bands to each loan
-- Step 4: Calculate cumulative defaults & cumulative loan count per band
CREATE OR REPLACE VIEW credit_risk_trend AS
SELECT
    loan_id,
    risk_score,
    risk_band,
    is_default,
    SUM(is_default) OVER (
        PARTITION BY risk_band 
        ORDER BY risk_score DESC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_defaults,
    COUNT(*) OVER (
        PARTITION BY risk_band 
        ORDER BY risk_score DESC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_loans,
    ROUND(
        100.0 * SUM(is_default) OVER (
            PARTITION BY risk_band 
            ORDER BY risk_score DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) / COUNT(*) OVER (
            PARTITION BY risk_band 
            ORDER BY risk_score DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS cumulative_default_pct
FROM (
    SELECT
        loan_id,
        risk_score,
        is_default,
        CASE
            WHEN risk_score >= 4.5 THEN 'Very High Risk'
            WHEN risk_score >= 4.0 THEN 'High Risk'
            WHEN risk_score >= 3.5 THEN 'Medium Risk'
            WHEN risk_score >= 3.0 THEN 'Low Risk'
            ELSE 'Very Low Risk'
        END AS risk_band
    FROM credit_risk_scoring
) t;

-- Step 5: Check top loans by cumulative trend per band
SELECT * 
FROM credit_risk_trend
ORDER BY risk_band DESC, risk_score DESC
LIMIT 50;

-- Step 6: Aggregate trend for charts / executive summary
SELECT
    risk_band,
    COUNT(*) AS total_loans,
    SUM(is_default) AS total_defaults,
    ROUND(100.0 * SUM(is_default) / COUNT(*), 2) AS overall_default_rate,
    MAX(cumulative_default_pct) AS max_cumulative_default_pct
FROM credit_risk_trend
GROUP BY risk_band
ORDER BY FIELD(risk_band, 'Very High Risk','High Risk','Medium Risk','Low Risk','Very Low Risk');

DROP TABLE IF EXISTS credit_risk_ranked;
CREATE TABLE credit_risk_ranked AS
SELECT
    loan_id,
    customer_id,
    is_default,
    credit_score,
    dti,
    credit_utilization,
    credit_score_risk,
    dti_risk,
    utilization_risk,
    risk_score,
    -- adjust risk bands based on min=1.0, max=4.3
    CASE
        WHEN risk_score >= 3.5 THEN 'Very High'
        WHEN risk_score >= 2.8 THEN 'High'
        WHEN risk_score >= 2.1 THEN 'Medium'
        WHEN risk_score >= 1.5 THEN 'Low'
        ELSE 'Very Low'
    END AS risk_band,
    -- rank by risk_score descending
    RANK() OVER (ORDER BY risk_score DESC) AS risk_rank,
    -- cumulative defaults
    SUM(is_default) OVER (ORDER BY risk_score DESC) AS cumulative_defaults,
    -- cumulative default % of total defaults
    SUM(is_default) OVER (ORDER BY risk_score DESC) / SUM(is_default) OVER () * 100 AS cumulative_default_pct
FROM credit_risk_scoring
ORDER BY risk_score DESC;

SHOW TABLES;

SELECT loan_id, risk_score, risk_band, risk_rank, is_default, cumulative_defaults, cumulative_default_pct
FROM credit_risk_ranked
LIMIT 10;

SELECT * FROM credit_risk_ranked;

SHOW TABLES;

SELECT loan_id, risk_score, risk_band, risk_rank, is_default, cumulative_defaults, cumulative_default_pct
FROM credit_risk_ranked
LIMIT 10;

-- Get Top 5 riskiest borrowers by risk score
SELECT loan_id, customer_id, risk_score
FROM credit_risk_scoring
ORDER BY risk_score DESC
LIMIT 5;

SELECT loan_id, customer_id, risk_score, dti, credit_utilization
FROM credit_risk_scoring
ORDER BY risk_score DESC
LIMIT 5;

-- OFFICIALLY DONE!!





