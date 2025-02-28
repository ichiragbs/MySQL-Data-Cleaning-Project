# MySQL-Data-Cleaning-Project

📌 Project Overview

This project focuses on data cleaning using MySQL. The dataset used is layoffs.csv, which contains company layoff data. The project performs data transformation, handling missing values, standardizing formats, and ensuring data integrity using SQL queries.

📂 Files Included

Data Cleaning Project.sql → SQL script for data cleaning.
layoffs.csv → Raw dataset containing company layoff data.

🛠️ Setup Instructions

Download and Install MySQL (if not installed):
Download MySQL

Import Dataset:
Open MySQL Workbench or Command Line.

Create a new database:
CREATE DATABASE LayoffsDB;
USE LayoffsDB;

Import layoffs.csv into a table using MySQL Workbench or:
LOAD DATA INFILE 'path/to/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
Or use the User Interface window to import raw data

Run the SQL Script:
Execute Data Cleaning Project.sql in MySQL Workbench to clean the dataset.

Data Cleaning Steps:
The script includes the following transformations:
-- 1. check for duplicates and remove if any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways

📢 Contact

For any questions or collaboration opportunities, feel free to connect!📧 
Email: chiru.01002@gmail.com🔗 
