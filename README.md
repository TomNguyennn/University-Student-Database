# University-Student-Database-
This is a project for COMP1314 Data Management, create a database for managing students in a University
Here is a clean, professional **README.md** you can copy directly into your project.

---

# **University Student Database — MySQL Project**

This project is a complete database management assignment involving XML-to-CSV data processing, MySQL database creation, SQL exercises, and automated import scripts. It demonstrates practical skills in data transformation, relational schema design, SQL querying, and reproducible database setup.

---

## **📁 Project Structure**

```
University_Student_Database/
├─ sql/                     # SQL exercises and schema files (ex16.sql, ex17.sql, etc.)
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
The resulting CSV files are then imported into MySQL where all SQL exercises operate.

Key components of the project include:

* XML → CSV data extraction using Bash (`xmlstarlet` or custom parsing)
* MySQL schema creation & table design
* SQL exercises (`ex16.sql`, `ex17.sql`, etc.)
* Automated database import script
* Final project report in PDF/TeX

---

## **📦 Data Conversion (XML → CSV)**

The provided Bash script located in `scripts/` converts XML files into CSV files:

Example usage:

```bash
bash scripts/xml_to_csv.sh
```

You can customize the script depending on your XML structure.

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
mysql -u root -p university < sql/create_tables.sql
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

## **🧪 SQL Exercises**

All SQL task files are included in the `sql/` directory:

Example:

* `ex16.sql` — major exercise file (≈14 MB)
* `ex15.sql`, `ex17.sql`, `ex18.sql`, `ex19.sql`, `ex20.sql`
* SQL practice queries for selection, joins, grouping, views, or triggers (depending on course requirements)

You can run an exercise file using:

```bash
mysql -u root -p university < sql/ex16.sql
```

---

## **⚙️ Automation Scripts**

All helper scripts are under `scripts/`:

* `xml_to_csv.sh` — converts XML datasets to CSV
* `ex1.sh`, `ex2.sh`, etc. — individual task automation (if provided)

Scripts may require executable permissions:

```bash
chmod +x scripts/*.sh
```

---

## **📄 Documentation**

The `docs/` folder contains:

* `report.pdf` — final project report
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
* `xmlstarlet` (if used for XML parsing)
* LaTeX (optional, for compiling the report)

---

## **📬 Author**

This project was created as part of a university database management assignment.

If you have any questions or want help extending this project (ER diagrams, Docker setup, automated schema loading), feel free to ask!

---

