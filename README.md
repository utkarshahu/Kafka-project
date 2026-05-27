````markdown
# Million Records MySQL Performance Benchmarking System

A professional large-scale data engineering and database benchmarking project
built using Python and MySQL.

This project demonstrates how to:

- generate millions of employee records
- perform optimized bulk insertion into MySQL
- benchmark insertion performance
- analyze throughput and scalability
- monitor CPU and memory usage
- visualize performance metrics using graphs

The project simulates real-world enterprise data ingestion systems.

---

# Project Objective

Modern applications generate massive amounts of data every second.

Examples:

- e-commerce transactions
- banking records
- employee logs
- user events
- IoT sensor streams
- analytics pipelines

The main goal of this project is to test:

> How efficiently MySQL handles huge bulk data insertion workloads.

This project benchmarks:

- insertion speed
- throughput
- memory usage
- CPU usage
- scalability

using millions of records.

---

# System Architecture

```text
                ┌─────────────────────┐
                │ Python Faker Script │
                │ (Data Generator)    │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ employees.csv       │
                │ Large Dataset File  │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ Python Inserter     │
                │ Chunk Processing    │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ MySQL Database      │
                │ employees table     │
                └──────────┬──────────┘
                           ▼
                ┌─────────────────────┐
                │ Benchmark Results   │
                │ + Graph Analysis    │
                └─────────────────────┘
````

---

# Project Workflow

The project follows this execution pipeline:

1. Generate fake employee records
2. Store records inside CSV file
3. Read CSV in chunks
4. Bulk insert into MySQL
5. Measure performance metrics
6. Save benchmark results
7. Generate performance graphs
8. Analyze scalability

---

# Tech Stack

| Technology             | Purpose                       |
| ---------------------- | ----------------------------- |
| Python                 | Core programming language     |
| MySQL                  | Relational database           |
| Faker                  | Fake employee data generation |
| pandas                 | CSV and DataFrame operations  |
| mysql-connector-python | MySQL connection driver       |
| psutil                 | CPU & memory monitoring       |
| matplotlib             | Graph generation              |
| tqdm                   | Progress bars                 |
| Jupyter Notebook       | Interactive development       |
| VS Code                | Development environment       |

---

# Why This Project Matters

This project demonstrates important backend engineering concepts:

* ETL processing
* bulk data ingestion
* database optimization
* performance benchmarking
* scalability analysis
* chunk-based processing
* memory optimization

These concepts are heavily used in:

* Data Engineering
* Backend Systems
* Big Data Processing
* Analytics Platforms
* Enterprise Applications

---

# Project Structure

```text
mysql-performance-project/

│
├── notebooks/
│   ├── 01_generate_data.ipynb
│   ├── 02_insert_data.ipynb
│   └── 03_performance_analysis.ipynb
│
├── data/
│   ├── employees.csv
│   ├── employees_cleaned.csv
│   └── results.csv
│
├── graphs/
│
├── .env
├── .gitignore
├── requirements.txt
└── README.md
```

---

# Folder Explanation

## notebooks/

Contains Jupyter notebooks.

### 01_generate_data.ipynb

Used for:

* generating fake employee data
* creating huge datasets
* exporting CSV files

---

### 02_insert_data.ipynb

Used for:

* connecting MySQL
* bulk insertion
* chunk processing
* benchmarking

---

### 03_performance_analysis.ipynb

Used for:

* graph generation
* throughput analysis
* CPU analysis
* memory analysis

---

## data/

Stores generated datasets and benchmark results.

### employees.csv

Main employee dataset.

Contains millions of employee records.

---

### employees_cleaned.csv

Cleaned dataset after:

* removing NaN values
* fixing corrupted rows
* correcting salary column

---

### results.csv

Stores benchmark metrics.

Example:

```csv
records,time,throughput,cpu,memory
10000,2.5,4000,25,60
100000,20,5000,40,70
```

---

## graphs/

Stores generated performance graphs.

---

# Virtual Environment Setup

## Create Virtual Environment

```bash
python -m venv venv
```

---

## Activate Virtual Environment

### Windows CMD

```bash
venv\Scripts\activate
```

### PowerShell

```powershell
.\venv\Scripts\Activate.ps1
```

---

# Install Dependencies

```bash
pip install pandas faker matplotlib mysql-connector-python psutil tqdm python-dotenv
```

---

# Environment Variables

Sensitive credentials are stored securely using `.env`.

## .env

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=performance_test
```

---

# .gitignore

```gitignore
venv/
.env
__pycache__/
*.csv
.ipynb_checkpoints/
```

This prevents:

* password leaks
* huge CSV uploads
* virtual environment uploads

---

# MySQL Database Setup

## Create Database

```sql
CREATE DATABASE performance_test;
```

---

## Use Database

```sql
USE performance_test;
```

---

## Create Table

```sql
CREATE TABLE employees (

    id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(255),

    email VARCHAR(255),

    city VARCHAR(255),

    salary INT
);
```

---

# Employee Dataset Structure

| Column | Type    |
| ------ | ------- |
| id     | Integer |
| name   | String  |
| email  | String  |
| city   | String  |
| salary | Integer |

---

# Fake Data Generation

The project uses Faker to generate realistic employee data.

Example:

```python
{
    "name": "Rahul Sharma",
    "email": "rahul@gmail.com",
    "city": "Delhi",
    "salary": 85000
}
```

---

# Why Faker?

Faker helps simulate:

* real-world datasets
* realistic testing
* scalable data generation

---

# CSV Generation Process

Employee records are generated and exported:

```python
df.to_csv("employees.csv", index=False)
```

This creates:

```text
employees.csv
```

containing millions of rows.

---

# Bulk Insertion Strategy

Instead of inserting rows one-by-one:

```text
1 INSERT query per row
```

the project uses:

```python
cursor.executemany()
```

which inserts multiple rows together.

---

# Why Bulk Insertion Is Important

Bulk insertion:

* reduces network overhead
* reduces transaction overhead
* improves insertion speed
* increases throughput

---

# Chunk Processing

Huge datasets cannot be inserted all at once safely.

For example:

```text
14 million+ rows
```

may crash:

* RAM
* MySQL connection
* Jupyter notebook

---

# Solution: Chunk Processing

The project reads CSV in chunks.

Example:

```python
chunksize = 5000
```

Meaning:

```text
5000 rows inserted at a time
```

---

# Benefits of Chunking

* lower memory usage
* stable insertion
* avoids timeout
* scalable architecture
* industry-standard ETL technique

---

# Throughput Calculation

Throughput measures insertion speed.

\text{Throughput} = \frac{\text{Total Records Inserted}}{\text{Total Time}}

---

# Example

```text
100000 rows / 20 sec
= 5000 records/sec
```

---

# Performance Metrics

The project measures:

| Metric         | Meaning                  |
| -------------- | ------------------------ |
| insertion time | total insertion duration |
| throughput     | records/sec              |
| CPU usage      | processor load           |
| memory usage   | RAM usage                |

---

# CPU Monitoring

CPU usage measured using:

```python
psutil.cpu_percent()
```

---

# Memory Monitoring

Memory usage measured using:

```python
psutil.virtual_memory().percent
```

---

# Graph Analysis

Performance graphs generated include:

* Records vs Time
* Throughput Analysis
* CPU Usage
* Memory Usage

---

# Scalability Testing

The system is tested with:

| Dataset Size |
| ------------ |
| 10,000       |
| 100,000      |
| 500,000      |
| 1,000,000    |
| 14,000,000+  |

This helps analyze:

* database scalability
* insertion efficiency
* memory stability

---

# Problems Faced During Development

## 1. pandas Installation Issue

Cause:

* Python 3.13 compatibility

Fix:

* install compatible wheels

---

## 2. MySQL Timeout

Cause:

* huge insertion in one query

Fix:

* chunk-based insertion

---

## 3. Corrupted CSV Rows

Cause:

* duplicate headers
* NaN values

Fix:

* data cleaning
* numeric conversion

---

# Optimizations Applied

## Bulk Insertion

Used:

```python
cursor.executemany()
```

---

## Chunk Processing

Inserted:

```text
5000 rows at a time
```

---

## Numeric Cleaning

Salary converted safely using:

```python
pd.to_numeric()
```

---

## NaN Removal

Invalid rows removed before insertion.

---

# Future Improvements

This project can be upgraded using:

---

## Apache Kafka

Architecture:

```text
Python → Kafka → Consumer → MySQL
```

Benefits:

* asynchronous processing
* higher scalability
* buffering
* fault tolerance

---

## Spring Boot Integration

Java consumer service for enterprise backend architecture.

---

## Docker Support

Containerized deployment using Docker Compose.

---

## PostgreSQL Benchmarking

Compare:

* MySQL
* PostgreSQL

---

## Multithreading

Parallel insertion for higher throughput.

---

# Industry Concepts Demonstrated

This project demonstrates:

* ETL pipelines
* backend engineering
* database optimization
* large-scale ingestion
* scalability analysis
* performance benchmarking
* memory optimization
* chunk processing

---

````markdown id="jlwm207"
# Spring Boot + MySQL Performance Issue & Kafka Solution

---

# Problem Statement

Initially, the project used direct bulk insertion from Python/Spring Boot into MySQL.

Architecture:

```text
Application → MySQL
````

This approach worked successfully for small datasets.

However, when huge datasets were used, the system started failing due to database overload and connection timeout issues.

---

# Small Dataset Test (Successful)

When inserting small datasets like:

* 10 rows
* 100 rows
* 1000 rows

the system worked correctly.

Example Output:

```text
✅ Data Inserted Successfully
📊 Total Rows: 10
⏱ Time Taken: 0.05 sec
```

---

# Why Small Data Works

Small datasets create:

* small SQL queries
* low RAM usage
* fast transactions
* minimal database load

So MySQL handles the insertion easily.

---

# Huge Dataset Problem

When huge datasets were tested:

```text
14 million+ rows
```

the system started failing.

---

# Error Encountered

```text
OperationalError: 2013 (HY000):
Lost connection to MySQL server during query
```

---

# Why This Error Happens

Huge bulk insertion creates:

* very large SQL packets
* long-running transactions
* high memory usage
* database overload
* connection timeout

The application tries to send millions of records directly to MySQL at once.

This causes:

| Problem            | Explanation                                |
| ------------------ | ------------------------------------------ |
| Timeout            | Query execution becomes too long           |
| Memory overload    | Huge batch stored in RAM                   |
| Database pressure  | MySQL cannot handle massive direct traffic |
| Application freeze | Thread blocks while waiting                |
| Scalability issue  | System cannot scale properly               |

---

# Direct Architecture Limitation

Initial Architecture:

```text
Python / Spring Boot → MySQL
```

This architecture is tightly coupled.

Meaning:

* application depends directly on database
* database becomes bottleneck
* traffic spikes crash performance

---

# Real Industry Scenario

Modern systems generate massive real-time data:

* banking transactions
* e-commerce orders
* analytics events
* ride bookings
* notifications
* streaming events

Millions of records may arrive every second.

Direct database insertion becomes unstable at scale.

---

# Solution → Apache Kafka

To solve this problem, Apache Kafka is introduced.

---

# Kafka Architecture

```text
Producer → Kafka → Consumer → MySQL
```

---

# Updated Project Architecture

```text
                ┌─────────────────────┐
                │ Python / Spring App │
                │ Producer            │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ Apache Kafka        │
                │ Message Broker      │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ Spring Boot         │
                │ Kafka Consumer      │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ MySQL Database      │
                └─────────────────────┘
```

---

# How Kafka Solves The Problem

---

# 1. Kafka Works As Buffer

Instead of directly sending data to MySQL:

```text
Application → Kafka
```

Kafka temporarily stores records safely.

Consumers then process records gradually.

This reduces database pressure.

---

# 2. Asynchronous Processing

Without Kafka:

```text
Application waits for database
```

With Kafka:

```text
Send message → Continue processing
```

Producer does not wait for database response.

System becomes much faster.

---

# 3. Prevents Database Overload

Kafka absorbs huge traffic spikes.

Instead of millions of direct insert queries:

```text
Kafka queues records safely
```

Consumers insert data in manageable batches.

---

# 4. Fault Tolerance

If MySQL crashes temporarily:

✅ Kafka still stores data safely.

No data loss occurs.

---

# 5. Better Scalability

Multiple consumers can run in parallel.

Example:

```text
Consumer-1
Consumer-2
Consumer-3
```

Parallel processing increases throughput.

---

# 6. High Throughput

Kafka can process:

```text
Millions of messages per second

```

which makes it ideal for:

* big data systems
* analytics pipelines
* real-time streaming
* enterprise applications

---

# Small Data vs Huge Data

| Feature             | Small Data | Huge Data |
| ------------------- | ---------- | --------- |
| Direct MySQL Insert | ✅ Works    | ❌ Fails   |
| Memory Usage        | Low        | Very High |
| Timeout Risk        | Low        | High      |
| Scalability         | Limited    | Poor      |
| Kafka Required      | No         | Yes       |

---

# Benefits of Kafka in This Project

| Benefit          | Explanation                                 |
| ---------------- | ------------------------------------------- |
| Decoupling       | Application and database become independent |
| Scalability      | Multiple consumers can be added             |
| Reliability      | Messages stored safely                      |
| Buffering        | Handles traffic spikes                      |
| Fault Tolerance  | No data loss                                |
| High Throughput  | Processes massive real-time data            |
| Async Processing | Faster system response                      |

---
```
