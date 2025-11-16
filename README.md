# **University Student Database — MySQL Project**

This project is a complete database management assignment involving XML-to-CSV data processing, MySQL database creation, SQL exercises, and automated import scripts. It demonstrates practical skills in data transformation, relational schema design, SQL querying, and reproducible database setup.

---

## **📁 Project Structure**

```
University_Student_Database/
├─ sql/                     # SQL database, schema files and query
├─ data/                    # CSV files converted from XML + optional XML originals
├─ scripts/                 # Bash scripts for XML→CSV conversion, import automation
├─ docs/                    # PDF report, LaTeX source, supporting documents
├─ .gitignore
└─ README.md
```

---

## **📝 Overview**

This project manages a **university student information system** using MySQL.
Source data is originally provided in **XML format** and converted into **CSV** using a Bash script.
The resulting CSV files are then imported into MySQL, where all SQL exercises operate.

Key components of the project include:

* XML → CSV data extraction using Bash 
* MySQL schema creation & table design
* SQL queries 
* Automated database import script
* Final project report in PDF/TeX

---

## **📦 Data Conversion (XML → CSV)**

The provided Bash script located in `scripts/` converts XML files into CSV files:

Example usage:

```bash
./scripts/convert.sh faculty.xml faculty.csv
```

You can customise the script depending on your XML structure.

---

## **🗄️ MySQL Setup**

### **1. Create a database**

```sql
CREATE DATABASE university;
USE university;
```

### **2. Create tables**

Run the schema file (if included), e.g.:

```bash
mysql -u root -p university < sql/create_table.sql
```

### **3. Load CSV datasets**

Example import command:

```sql
LOAD DATA LOCAL INFILE 'data/students.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Make sure your MySQL client allows `LOCAL INFILE`.

---

## **🧪 SQL Queries**

All SQL Queries files are included in the `sql/` directory:

You can run a query file using:

```bash
mysql -u root -p university < sql/query1.sql
```

---

## **⚙️ Automation Scripts**

All helper scripts are under `scripts/`:

* `converts.sh` — converts XML datasets to CSV
* `sorted_list.sh` - sort the CSV

Scripts may require executable permissions:

```bash
chmod +x scripts/*.sh
```

---

## **📄 Documentation**

The `docs/` folder contains:

* `report.pdf` — final project report, which includes the intuition behind the normalisation of the schema
* `report.tex` — LaTeX source file
* Additional documentation supporting the project

---

## **🔒 Notes on Repository & GitHub**

* No credentials or passwords are committed.
* Large files should use Git LFS if needed.
* `.gitignore` excludes temporary, OS, and secrets files.

---

## **📚 Requirements**

* **MySQL 8.0+**
* Bash (Linux/Mac) or WSL on Windows
* LaTeX (optional, for compiling the report)

---

## **📬 Author**

This project was created as part of a university database management assignment.

If you have any questions or want help extending this project (ER diagrams, Docker setup, automated schema loading), feel free to ask!

---

