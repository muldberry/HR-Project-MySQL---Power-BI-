PROJECT TITLE
"Data Analysis Project: Employee Demographics and Turnover Analysis"

PROJECT DESCRIPTION
In this data analysis project, we aimed to understand various aspects of employee demographics and turnover within the company. We used a dataset containing information about employees, including gender, race/ethnicity, age, employment status, job titles, and location details.

OBJECTIVE
In this data analysis project, we aimed to understand various aspects of employee demographics and turnover within the company. We used a dataset containing information about employees, including gender, race/ethnicity, age, employment status, job titles, and location details.

SQL DATA PROCESSING
To prepare the data for analysis, we used MySQL to answer specific questions related to employee demographics and company statistics. Here are the questions we addressed using SQL:

- Gender breakdown of employees in the company.
- Race/ethnicity breakdown of employees in the company.
- Age distribution of employees in the company.
- Number of employees working at headquarters versus remote locations.
- Average length of employment for terminated employees.
- Gender distribution across departments and job titles.
- Distribution of job titles across the company.
- Department with the highest turnover rate.
- Distribution of employees across locations by city and state.
- Company's employee count changes over time based on hire and termination dates.
- Tenure distribution for each department.

POWER BI REPORTING
After cleaning and processing the dataset using SQL, we visualized the results and generated comprehensive reports using Power BI. The visualizations provide valuable insights into employee demographics, departmental statistics, turnover rates, and trends over time.

TECHNOLOGIES USED
The following technologies and tools were employed in this project:
- SQL (MySQL): Employed to perform data cleaning, data querying and filtering from the database. SQL was used to extract specific subsets of data required for analysis.
- Power BI: Utilized for creating visually appealing visualizations.

INSTALLATION AND SETUP
To run this project on your local machine, follow these steps:

1. Clone the Repository
Start by cloning this GitHub repository to your local machine using the following command in your terminal or command prompt:
git clone https://github.com/muldberry/IMDb_data_analysis.git

2. Set up the Database (if applicable)
If you plan to execute the SQL code, make sure you have a compatible database system installed (MySQL). Ensure that the database server is running and that you have the necessary permissions to create and manipulate tables.

3. Explore Power BI Visualization (if applicable)
If you'd like to interact with more visualizations and explore the results in a more interactive manner, you can either download the Power BI file or open the provided PDF.

FURTHER INSIGHTS AND IMPROVEMENTS
- Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.
- Some termdates were far into the future and were not included in the analysis. The only termdates used were those less than or equal to the current date.

AUTHOR
Alice Langone

ACKNOWLEDGMENTS
Special thanks to Her Data Project on YouTube for their insightful video that initially inspired me to take on this project. Their analysis and approach served as a guiding light and motivated me to explore the dataset.
