# E-commerce-analytics-pipeline 
 
### 🚀 Project Overview

This project represents an end-to-end data analytics pipeline that automates the entire data workflow, from ingestion to visualization. It covers data ingestion, transformation, loading, and workflow orchestration.

## 🛠️ Tech Stack

- Cloud Platform: Google Cloud Platform (GCP)
- Data Orchestration: Apache Airflow, Docker
- ETL Transformation: dbt (data build tool)
- Data Storage: BigQuery
- Data Visualization: Looker Studio
- Languages: Python, SQL

###  Architecture

Here is the architecture of the project:
![image](https://github.com/user-attachments/assets/4068199f-3019-4c38-ad30-08762d2b89e6)

The architecture can be summarized as follows:

- Data Source → CSV files containing raw data.
- Upload Data → Data stored in Google Cloud Storage.
- Transform & Load → Data transformed using dbt and stored in BigQuery.
- Workflow Orchestration → Managed by Apache Airflow, ensuring all processes run smoothly.
- Visualization → Final insights and dashboards created using Looker Studio.


### 📊 Dashboard

![image](https://github.com/user-attachments/assets/d955daae-6564-4ac3-9f0f-c34746a2e017)









