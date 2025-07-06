# TYD Chatbot
### *(Talk to Your Data Chatbot)*
#### *Understand Your People, One Question at a Time*

TYD Chatbot is a conversational SQL assistant that allows you to query your employee database in plain English.  
Just type your question about employee data, and TYD converts it into a MySQL query, runs it, and shows you the results — instantly.

---

## 🚀 Features
- Ask natural language questions about employee data
- Converts questions into MySQL queries
- Runs queries on your MySQL `company_db` database
- Displays results in a clean table
- Uses Google Gemini 1.5 Flash model for natural language understanding

---

## 🖥️ Setup Instructions

### 1️⃣ Clone the repository
First, clone this repository from GitHub and move into the project directory:
```bash
git clone <your-repo-url>
cd tyd-chatbot
```
### 2️⃣ Install Python dependencies
Install all required Python libraries:
```bash
pip install -r requirements.txt
```
If you don’t have a ```requirements.txt```, you can also install manually:
```bash
pip install streamlit mysql-connector-python pandas python-dotenv google-generativeai
```
### 3️⃣ Set up your ```.env``` file
Create a file named ```.env``` in the project folder and add these environment variables:
```bash
GEMINI_API_KEY=your_google_api_key
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=your_mysql_password
MYSQL_DATABASE=company_db
```
✅ Replace your ```_google_api_key``` with your key from Google AI Studio.
✅ Replace your ```_mysql_password``` with your MySQL root password.

###4️⃣ Set up your MySQL database
✅ Make sure MySQL server is installed & running locally.
✅ Log into MySQL and create the database ```company_db```:
```bash
CREATE DATABASE company_db;
```
✅ Then create the ```employees``` table with the expected schema:
```bash
USE company_db;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    joining_date DATE,
    designation VARCHAR(50),
    location VARCHAR(50),
    experience FLOAT
);
```
✅ Insert some sample data to test:
```bash
INSERT INTO employees (id, name, department, salary, joining_date, designation, location, experience) VALUES
(1, 'Alice', 'HR', 50000, '2019-03-15', 'HR Manager', 'Mumbai', 5.0),
(2, 'Bob', 'Engineering', 75000, '2020-06-01', 'Software Engineer', 'Bangalore', 4.2),
(3, 'Charlie', 'Sales', 60000, '2021-01-20', 'Sales Executive', 'Delhi', 3.5),
(4, 'David', 'Engineering', 85000, '2018-10-05', 'Senior Engineer', 'Hyderabad', 6.1),
(5, 'Eva', 'HR', 52000, '2022-02-12', 'HR Executive', 'Pune', 2.0),
(6, 'Fiona', 'Marketing', 62000, '2020-11-01', 'Marketing Manager', 'Mumbai', 4.8),
(7, 'George', 'Engineering', 85000, '2017-04-10', 'Tech Lead', 'Bangalore', 7.2),
(8, 'Hina', 'Sales', 59000, '2021-08-25', 'Sales Associate', 'Delhi', 3.0),
(9, 'Ishaan', 'Marketing', 70000, '2019-12-15', 'Content Strategist', 'Chennai', 5.6),
(10, 'Jaya', 'HR', 54000, '2023-01-03', 'Recruiter', 'Pune', 1.1),
(11, 'Kevin', 'Sales', 85000, '2016-09-12', 'Sales Manager', 'Delhi', 8.0),
(12, 'Leela', 'Finance', 61000, '2020-03-09', 'Accountant', 'Mumbai', 3.9),
(13, 'Manav', 'Finance', 64000, '2019-07-27', 'Financial Analyst', 'Ahmedabad', 5.2),
(14, 'Nina', 'Engineering', 88000, '2015-05-18', 'Engineering Manager', 'Bangalore', 9.5),
(15, 'Om', 'Engineering', 88000, '2016-02-29', 'Engineering Manager', 'Bangalore', 9.0);
```
###5️⃣ Create a ```.gitignore``` file
Before pushing your project to GitHub, create a .gitignore file in your project root to exclude sensitive or unnecessary files.
✅ This ensures your ```.env``` file (with API keys & DB credentials), your virtual environment, and system junk files are not uploaded to GitHub.

###6️⃣ Run the Streamlit app
Start the app by running:
```bash
streamlit run app.py
```
✅ Open the link in your browser to interact with the chatbot.

### ✍️ Example Inputs and Outputs
## Input:
Who are the employees working in the HR department?
### Generated SQL:
```bash
SELECT * FROM employees WHERE department LIKE '%HR%';
```
###🧾 Assumptions
MySQL server is installed and running locally.

1. Database name is ```company_db```.

2. Table name is employees, with the schema specified above.

3. Google Gemini API key is valid and configured.

4. Python 3.7+ is installed.

5. ```.env``` file is properly set up with the required credentials.

6. ```.gitignore``` is present to protect sensitive data when pushing to GitHub.

### 🤝 Contributing
Pull requests and suggestions are welcome!
Feel free to open an issue if you find a bug or would like to see a new feature.
---
✨ Understand your people, one question at a time… with TYD Chatbot.
```bash

---

✅ This includes:
- Step 1: clone the repo  
- Step 2: install dependencies  
- Step 3: setup `.env`  
- Step 4: setup database & table  
- Step 5: create `.gitignore` & why  
- Step 6: run the app  

Everything. One single file.  
You can just **copy–paste it as `README.md` directly into your project folder.**

If you’d also like me to generate a `requirements.txt`, let me know! 🌟
```
