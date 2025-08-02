
# 📊 Mini Data Warehouse Project

This repository contains a small-scale data warehouse project designed to demonstrate fundamental data engineering workflows — from raw data ingestion to data modeling and transformation.

The project includes:
- **Data ingestion** (from CSV sources)
- **Staging and transformation scripts**
- **Data warehouse schema setup**
- **ETL/ELT orchestration**
- **Documentation** to guide each phase

## 🔍 Project Structure and Origin

> **Important Note:**  
> The overall **idea, structure, and task breakdown** for this project are based on the original work by [DataWithBaara](https://github.com/DataWithBaara).  
> I followed Baara's public educational material to build and implement this project from scratch using my own code, while adhering to the conceptual framework provided.

All scripts, configurations, and documentation in this repository are written by me as a hands-on exercise to reinforce my learning and practical skills in data warehousing.

## 📁 Folder Structure

```bash
├── data/                   # Raw datasets (e.g., CSVs)
├── sql/                    # SQL scripts for staging, transformations, and modeling
├── dags/                   # Airflow DAGs or orchestration scripts
├── docs/                   # Documentation and ER diagrams
├── warehouse_setup/        # Schema and table creation scripts
└── README.md               # Project overview and acknowledgments
```

## ⚙️ Technologies Used

- PostgreSQL / Amazon Redshift (or your DWH of choice)
- SQL (for ELT)
- Python (for orchestration, if used)
- dbt (if applicable)
- Airflow or similar orchestration tools (optional)

## 🧾 Acknowledgments

- Huge thanks to **[DataWithBaara](https://github.com/DataWithBaara)** for sharing the project structure and guiding tasks that inspired this work.
- This project is for educational and portfolio purposes, built with full credit to the original idea author.  
  Please visit [DataWithBaara’s GitHub](https://github.com/DataWithBaara) for more amazing data engineering content.
