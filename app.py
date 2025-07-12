import streamlit as st
import mysql.connector
import pandas as pd
import os
from dotenv import load_dotenv
import google.generativeai as genai

load_dotenv()

# Configure Gemini API
genai.configure(api_key=os.getenv("GEMINI_API_KEY", st.secrets["google_api"]["GEMINI_API_KEY"]))

st.set_page_config(page_title="TYD Chatbot", layout="centered")
st.title("Talk to your Data")
st.markdown(
    "<h4 style='text-align: center; color: yellow;'>Understand Your People, One Question at a Time</h4>",
    unsafe_allow_html=True
)
user_question = st.text_input("Ask me anything about the employees:")

if user_question:
    with st.spinner("Thinking..."):

        prompt = f"""
You are an intelligent SQL assistant. The database has the following tables:

1️⃣ Table: `employees`  
- id: unique employee ID  
- name: name of the employee  
- department: department they work in  
- salary: monthly salary in INR  
- joining_date: the date they joined the company  
- designation: job title  
- location: city where the employee is based  
- experience: years of work experience  

2️⃣ Table: `employee_details`  
- detail_id: unique detail record ID  
- employee_id: foreign key referencing employees.id  
- phone_number: employee's contact number  
- email: employee's work email  
- emergency_contact: emergency contact name and number  
- blood_group: employee's blood group  

3️⃣ Table: `employee_projects`  
- project_id: unique project record ID  
- employee_id: foreign key referencing employees.id  
- project_name: name of the project  
- project_role: role in the project  
- start_date: project start date  
- end_date: project end date (NULL if ongoing)  

4️⃣ Table: `employee_performance`  
- performance_id: unique performance record ID  
- employee_id: foreign key referencing employees.id  
- review_date: date of the performance review  
- rating: performance rating (1–5)  
- comments: manager's comments  

✅ Guidelines:  
- Use the appropriate table(s) depending on what is asked.  
- Join tables when needed based on `employee_id`.  
- Use SQL’s `LIKE` operator for partial matches when appropriate (e.g., `WHERE designation LIKE '%Manager%'`).  
- When asked for current projects, assume `end_date IS NULL`.  
- If a column or table is not relevant to the question, do not include it.

Convert the following natural-language question into a **MySQL query**.  
Question: "{user_question}"  
Only return the SQL query. Do not include any explanation.

"""

        try:
            model = genai.GenerativeModel(model_name="gemini-1.5-flash-latest")

            response = model.generate_content(prompt)

            sql_query = response.text.strip().replace("```sql", "").replace("```", "").strip()

            st.code(sql_query, language="sql")

            conn = mysql.connector.connect(
                host=os.getenv("MYSQL_HOST", st.secrets["mysql"]["host"]),
                user=os.getenv("MYSQL_USER", st.secrets["mysql"]["user"]),
                password=os.getenv("MYSQL_PASSWORD", st.secrets["mysql"]["password"]),
                database=os.getenv("MYSQL_DATABASE", st.secrets["mysql"]["database"])
            )
            df = pd.read_sql(sql_query, conn)
            conn.close()

            if not df.empty:
                st.success("Result:")
                st.dataframe(df)
            else:
                st.warning("No results found.")

        except Exception as e:
            st.error(f"Error: {str(e)}")