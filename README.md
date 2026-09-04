# 🇮🇳 India Crime Analytics — SQL + Python

> **Turning crime data into structured insights using SQL, Python, data cleaning, relational modeling, and analytical queries.**

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge\&logo=python\&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge\&logo=pandas\&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge\&logo=jupyter\&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-0F172A?style=for-the-badge)

---

## 📌 Project Overview

**India Crime Analytics** is an end-to-end data analytics project focused on exploring and analyzing crime-related data using **Python and SQL**.

The project follows a practical analytics workflow:

**Raw Data → Data Cleaning → Data Modeling → SQL Database → Analytical Queries → Insights**

The goal is to demonstrate how a Data Analyst can transform structured crime records into a relational data model and use SQL to answer analytical questions.

---

## 🎯 Project Objectives

This project was built to practice and demonstrate:

* Data cleaning and preparation
* Relational database design
* Fact and dimension modeling
* SQL database creation
* SQL joins and aggregations
* Analytical querying
* Exploratory data analysis
* Python-based data preparation
* Extracting meaningful patterns from crime data

---

## 🧩 Data Model

The project uses a **fact-and-dimension structure** to organize the crime data.

### Fact Table

`Fact_Crime.csv`

Contains the main crime records used for analysis.

### Dimension Tables

| Table              | Purpose                      |
| ------------------ | ---------------------------- |
| `Dim_Crime.csv`    | Crime-related attributes     |
| `Dim_Location.csv` | Location-related information |
| `Dim_Victim.csv`   | Victim-related attributes    |
| `Dim_Weapon.csv`   | Weapon-related information   |
| `Fact_Crime.csv`   | Main crime records           |

This structure makes it easier to perform scalable SQL analysis through relationships between the fact table and dimensions.

---

## 🗂️ Repository Structure

```text
India-Crime-Analytics-SQL-Python/
│
├── Data/
│   ├── Dim_Crime.csv
│   ├── Dim_Location.csv
│   ├── Dim_Victim.csv
│   ├── Dim_Weapon.csv
│   └── Fact_Crime.csv
│
├── Python code/
│   └── Importing data into sql.ipynb
│
├── SQL code file/
│   ├── Database_Setup.sql
│   ├── Data_Cleaning.sql
│   ├── Table_Joins.sql
│   ├── Full sql file.sql
│   └── _Analysis.sql
│
└── README.md
```

---

## 🐍 Python Workflow

Python is used as part of the data preparation and SQL ingestion workflow.

The notebook covers the process of preparing the dataset and importing the data into the SQL environment.

### Main Python Skills

* Pandas
* Data inspection
* Data preparation
* Data transformation
* SQL data loading
* Jupyter Notebook workflow

Example workflow:

```python
import pandas as pd

df = pd.read_csv("Data/Fact_Crime.csv")

print(df.head())
print(df.shape)
print(df.info())
```

---

## 🗄️ SQL Workflow

The SQL portion of the project is divided into multiple stages.

### 1. Database Setup

`Database_Setup.sql`

Creates the required database objects and tables for analysis.

### 2. Data Cleaning

`Data_Cleaning.sql`

Handles data preparation and cleaning tasks before analysis.

### 3. Table Joins

`Table_Joins.sql`

Demonstrates how the fact table can be connected with the dimension tables using SQL joins.

### 4. Data Analysis

`_Analysis.sql`

Contains analytical queries used to explore the crime dataset and generate insights.

---

## 🔍 Analysis Areas

The SQL analysis focuses on questions such as:

### Crime Analysis

* Which crime categories occur most frequently?
* Which crimes contribute the largest share of total incidents?
* How are different crime types distributed?

### Location Analysis

* Which locations report the highest number of incidents?
* How does crime distribution vary by location?
* Which areas appear as high-frequency crime zones?

### Victim Analysis

* What patterns exist across victim attributes?
* Which victim groups appear most frequently in the dataset?
* Are certain crime types associated with specific victim characteristics?

### Weapon Analysis

* Which weapons are most frequently associated with incidents?
* How does weapon usage vary across crime categories?
* What percentage of incidents involve specific weapon types?

### Comparative Analysis

* Which crime categories show the strongest concentration?
* How do different dimensions interact?
* What patterns emerge after joining multiple datasets?

---

## 🧠 SQL Concepts Demonstrated

This project demonstrates practical SQL concepts including:

```text
SELECT
WHERE
GROUP BY
ORDER BY
HAVING
COUNT()
SUM()
AVG()
MIN()
MAX()
CASE
INNER JOIN
LEFT JOIN
Aggregations
Subqueries
Filtering
Data Transformation
```

The goal is not only to write SQL queries, but to use SQL to answer **real analytical questions**.

---

## 📊 Example Analytical Query

```sql
SELECT
    Crime_Type,
    COUNT(*) AS Total_Incidents
FROM Fact_Crime
GROUP BY Crime_Type
ORDER BY Total_Incidents DESC;
```

This query identifies the crime categories with the highest number of recorded incidents.

---

## 🔗 Example Multi-Table Analysis

```sql
SELECT
    c.Crime_Type,
    l.Location,
    COUNT(*) AS Total_Incidents
FROM Fact_Crime f
JOIN Dim_Crime c
    ON f.Crime_ID = c.Crime_ID
JOIN Dim_Location l
    ON f.Location_ID = l.Location_ID
GROUP BY
    c.Crime_Type,
    l.Location
ORDER BY Total_Incidents DESC;
```

This type of query demonstrates how multiple dimensions can be combined to produce deeper analytical insights.

---

## 📈 Key Learning Outcomes

Through this project, I strengthened my understanding of:

**Data Preparation**
→ Cleaning and structuring raw datasets

**Data Modeling**
→ Separating transactional data from descriptive dimensions

**SQL**
→ Writing joins, aggregations, filters, and analytical queries

**Python**
→ Using Pandas to inspect and prepare data

**Analytics**
→ Converting raw records into meaningful business-style questions and insights

---

## 🛠️ Tech Stack

| Technology       | Usage                                     |
| ---------------- | ----------------------------------------- |
| Python           | Data preparation and analysis             |
| Pandas           | Data manipulation                         |
| SQL              | Database analysis                         |
| Jupyter Notebook | Python workflow                           |
| CSV              | Data storage                              |
| GitHub           | Version control and project documentation |

---

## 🚀 How to Run the Project

### Step 1 — Clone the repository

```bash
git clone https://github.com/satyamsatyam1215-cmd/India-Crime-Analytics-SQL-Python.git
```

### Step 2 — Open the project

```bash
cd India-Crime-Analytics-SQL-Python
```

### Step 3 — Install Python dependencies

```bash
pip install pandas jupyter
```

### Step 4 — Open the notebook

```bash
jupyter notebook
```

Open:

```text
Python code/Importing data into sql.ipynb
```

### Step 5 — Set up the SQL database

Run:

```text
SQL code file/Database_Setup.sql
```

### Step 6 — Clean the data

Run:

```text
SQL code file/Data_Cleaning.sql
```

### Step 7 — Run joins and analysis

Execute:

```text
SQL code file/Table_Joins.sql
SQL code file/_Analysis.sql
```

---

## 📁 Dataset Files

The repository currently includes:

* Crime dimension data
* Location dimension data
* Victim dimension data
* Weapon dimension data
* Crime fact data

The main transaction-level dataset is stored in:

```text
Data/Fact_Crime.csv
```

---

## 💡 Why This Project Matters

Crime datasets can contain multiple entities, relationships, and attributes. Simply loading the data into a spreadsheet is not enough for deeper analysis.

This project demonstrates a more structured approach:

```text
Dataset
   ↓
Data Cleaning
   ↓
Data Modeling
   ↓
SQL Database
   ↓
Table Relationships
   ↓
Analytical Queries
   ↓
Crime Insights
```

This workflow is similar to the type of process used in real-world data analytics projects where analysts work with multiple related tables.

---

## 🔮 Future Improvements

Planned improvements for this project could include:

* Interactive Power BI dashboard
* Crime trend analysis over time
* Geographic visualization
* State-level crime comparison
* Advanced SQL window functions
* Automated Python ETL pipeline
* KPI dashboard
* Automated data-quality checks
* Crime severity analysis

---

## 👨‍💻 Author

**Satyam Singh**

Aspiring **Data Analyst** focused on:

`SQL` • `Python` • `Power BI` • `Excel` • `Data Analysis`

GitHub:
https://github.com/satyamsatyam1215-cmd

---

## ⭐ Project

If you found this project useful or interesting, consider giving the repository a **⭐ star**.

---

### 📌 Portfolio Note

This project was created as part of my hands-on Data Analytics portfolio to demonstrate practical skills in **Python, SQL, data cleaning, relational modeling, and analytical problem solving**.
