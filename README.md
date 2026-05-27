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
