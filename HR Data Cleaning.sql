-- Create database
CREATE DATABASE projects;

-- Use database
USE projects;

-- Deactivate safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Renaming the column "id"
ALTER TABLE hr
RENAME COLUMN ï»¿id TO emp_id;

-- Renaming the column "location_state"
ALTER TABLE hr
CHANGE COLUMN `location_state;` `location_state` VARCHAR(50);

-- Remove the semicolon at the end of each state name
UPDATE hr
SET location_state = SUBSTRING(location_state, 1, LENGTH(location_state) - 1)
WHERE location_state LIKE '%;';

-- Change the data type of emp_id column to VARCHAR
ALTER TABLE hr  
MODIFY emp_id VARCHAR(20);

-- Transforming date formats to a standardized format
UPDATE hr
SET birthdate = 
    CASE
		WHEN birthdate REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN birthdate  -- Already in the desired format
        WHEN birthdate REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{1}/[0-9]{2}/[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{2}/[0-9]{1}/[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{1}-[0-9]{2}-[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
        WHEN birthdate REGEXP '^[0-9]{2}-[0-9]{1}-[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
        ELSE NULL
    END;
    
-- Change the data type of birthdate column to DATE
ALTER TABLE hr  
MODIFY birthdate DATE;

-- Transforming date formats to a standardized format
UPDATE hr
SET hire_date = 
    CASE
		WHEN hire_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN hire_date  -- Already in the desired format
        WHEN hire_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{1}/[0-9]{2}/[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{2}/[0-9]{1}/[0-9]{4}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{1}-[0-9]{2}-[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
        WHEN hire_date REGEXP '^[0-9]{2}-[0-9]{1}-[0-9]{2}$' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
        ELSE NULL
    END;
    
-- Change the data type of hire_date column to DATE
ALTER TABLE hr  
MODIFY hire_date DATE;

-- Set problematic termdate values to NULL
UPDATE hr
SET termdate = NULL
WHERE termdate IS NOT NULL AND termdate NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} UTC$';

-- Convert valid date format for termdate
UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'));

-- Change the data type of termdate column to DATE
ALTER TABLE hr  
MODIFY termdate DATE;

-- Create the age column
ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

-- Select people with an incorrect birthdate
SELECT COUNT(*)
FROM hr
WHERE age < 18;
