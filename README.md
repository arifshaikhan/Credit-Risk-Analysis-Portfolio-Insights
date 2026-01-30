# Credit-Risk-Analysis-Portfolio-Insights
1. SQL project analyzing bank loan default risk with risk scoring, segmentation, and portfolio insights. End-to-end SQL project analyzing bank loan default risk using real-world data.

2. Project Overview
This project demonstrates applied credit risk analytics by analyzing loan and borrower data to identify factors driving defaults. It includes:
- Data cleaning and preparation
- Exploratory Data Analysis (EDA)
- Risk scoring and segmentation
- Trend analysis using window functions
- Professional consulting-style reporting

3. Tools & Skills Applied
- SQL (MySQL/PostgreSQL) – database setup, cleaning, aggregation, joins, window functions
- Excel – dataset exploration, charts, visualization
- Risk Analytics / Actuarial Thinking – DTI, credit utilization, default rates, risk scoring, segmentation
- Professional Reporting – consulting-style report and GitHub portfolio showcase

4. Project Structure
├── sql/          # All SQL scripts
├── report.pdf    # Consulting-style report

5. Key Insights
- Credit Score, DTI, and Credit Utilization are top drivers of loan default.
- Portfolio is concentrated in Medium & High-risk loans, requiring focused monitoring.
- Cumulative default trends highlight Very High / High-risk loans as priority for intervention.
- Top 5 riskiest loans identified for targeted action.

6. How to Run
- Import the dataset into MySQL/PostgreSQL.
- Run SQL scripts in order:
02_database_import.sql → 03_cleaning.sql → 04_eda.sql → ... → 08_window_functions.sql
- master_sql_script.sql contains all queries combined for reproducibility.
- Optional: Load results/ visuals for reporting or presentations.

7. Deliverables
- Complete SQL workflow
- Portfolio-ready consulting-style report (report.pdf)
- Visualizations supporting risk insights
- LinkedIn/GitHub showcase for recruiters

8. Next Steps
- Extend analysis with predictive modeling (e.g., logistic regression for default prediction)
- Apply to larger or live datasets for real-world portfolio risk monitoring
