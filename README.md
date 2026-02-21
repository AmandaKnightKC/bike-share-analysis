# Bike Share Analysis — Reproducing a BigQuery Analysis Locally

This project rebuilds and validates a previously completed Google BigQuery analysis using a fully local SQL and Python data pipeline.

The original analysis was performed using a cloud-hosted dataset.  
In this version, the same results are reproduced starting from raw operational files to demonstrate data ingestion, schema normalization, and reproducible analytics workflows.

The focus of this project is not creating a report — it is rebuilding the analytical dataset from scratch and verifying the results.

---

## Purpose of This Project

This project demonstrates the ability to:

- ingest raw operational data files
- resolve schema differences across files
- construct an analytics-ready dataset
- reproduce analytical results across platforms

The same analysis is executed in a different data environment to validate correctness and portability.

---

## Business Question

How do annual members and casual riders use the bike-share system differently, and how could behavioral differences inform strategies to convert casual riders into members?

---

## What This Project Demonstrates

Instead of starting with a prepared dataset, this project recreates the analytical dataset using local tools.

Skills demonstrated:

- translating warehouse SQL logic to a local database
- validating results across platforms
- building a reproducible pipeline
- automating dataset construction
- working with real-world messy data

---

## Project Structure

```
bike-share-analysis/
├── data
│   ├── processed
│   ├── raw_csv
│   └── raw_zips
├── docs
├── notebooks
├── reports
├── scripts
│   └── extract_data.sh
├── sql
│   ├── 01a_schema_create_table.sql
│   ├── 01b_reset_tables.sql
│   ├── 02_load_raw.sql
│   ├── 03_create_clean_view.sql
│   ├── 03_quality_checks.sql
│   ├── 04_build_facts_table.sql
│   └── 04_checkcount_query.sql
└── src
```

---

## Data Source

Public bike-share trip records (Cyclistic/Divvy dataset).

Each record contains:

- ride start and end timestamps
- ride duration
- station locations
- bike type
- rider classification (member vs casual)

Raw data is excluded from the repository due to size and reproducibility standards.

---

## Reproducibility

This repository intentionally does not include datasets.

Instead, it contains the code required to rebuild the analytical dataset locally from raw files.  
Anyone can recreate the database and reproduce the analysis.

---

## Setup

### Clone

git clone <https://github.com/YOUR_USERNAME/bike-share-analysis.git>

cd bike-share-analysis

### Create environment

Mac/Linux/WSL:
python -m venv .venv
source .venv/bin/activate

Windows:
python -m venv .venv
.venv\Scripts\activate

### Install dependencies

pip install -r requirements.txt

### Configure

cp .env.example .env

### Add data

Place downloaded monthly trip files into:

data/raw_zips/

Extract them into:
data/raw_csv/
