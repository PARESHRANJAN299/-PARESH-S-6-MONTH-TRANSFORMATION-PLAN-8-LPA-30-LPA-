# 🧱 Databricks Day 1 — Study Log
**Date:** 18 March 2026  
**Student:** Paresh Ranjan Rout  
**Goal:** AWS Data Engineering  

---

## ✅ Topics Completed Today

### 1. What is Databricks?
- Databricks is a cloud platform built on Apache Spark
- Spark = compute engine (processes data)
- Databricks = Spark + Cloud + Extra Features = One Stop Solution
- Analogy: Spark is like Android OS (free, open source). Databricks is like Samsung Galaxy (built on top, with extra features)

### 2. Apache Spark vs Databricks
| | Apache Spark | Databricks |
|---|---|---|
| Cost | Free (open source) | Paid (free Community Edition) |
| Owner | Apache Foundation | Private company |
| Use | Set up yourself | Ready on cloud |
| Extra Features | Just the engine | Delta Lake, Workflows, MLflow + more |

- Spark = purely a **distributed compute engine**
- Its only job = Take data → Process it → Give output
- Spark does NOT store data, does NOT schedule jobs, has NO UI
- You CAN use Spark without any platform (pip install pyspark)
- But in production → need Databricks/EMR for scale, UI, scheduling

### 3. Platforms Built on Spark
| Platform | Cloud |
|---|---|
| Databricks | AWS / Azure / GCP |
| AWS EMR | AWS only |
| Azure HDInsight | Azure only |
| Google Dataproc | GCP only |

### 4. Workspace & Cluster
- **Workspace** = Your working environment inside Databricks
  - Where you CREATE, WRITE, RUN, SAVE, SHARE your work
  - Personal workspace: `/Users/paresh.r@datapoem.com/`
  - Shared workspace: `/Shared/` (whole team)
- **Cluster** = The computer(s) that run your code
  - Your code runs ON the cluster, not on your laptop
  - More cluster machines = faster processing = more cost
  - Always TERMINATE cluster when done!

### 5. Cluster Types
| Type | Use |
|---|---|
| Single Node | Learning / small data |
| Multi Node | Production / big data |
| Job Cluster | Auto-starts for a job then stops |
| All Purpose | Always running, shared by team |

### 6. Scaling
- **Scale Up** = Make each machine bigger (more RAM/CPU)
- **Scale Out** = Add more machines
- **Auto Scale** = Databricks auto adds/removes machines based on load
- More Cluster = Faster ✅ but More Cost 💸

### 7. PySpark Code — Reading a File
```python
df = spark.read.format("csv") \
    .option("header", "true") \
    .option("sep", "|") \
    .option("inferSchema", "true") \
    .load("/Volumes/workspace/cdw_dp_nielsen_sales/nielsen/CognitiveROI_Unilever/CognitiveROI_Unilever_3502760/CognitiveROI_Unilever_fct_3502760.txt")

print("Total Rows:", df.count())
df.show(5)
```

### 8. Code Explained Line by Line
| Line | Meaning |
|---|---|
| `spark.read` | Use Spark engine to read data |
| `.format("csv")` | File format is CSV (pipe-separated txt is still CSV format) |
| `.option("header","true")` | First row = column names, not data |
| `.option("sep", "\|")` | Separator is pipe `\|` not default comma |
| `.option("inferSchema","true")` | Auto detect column data types |
| `.load("path")` | Location of the file |

### 9. Why Pipe `|` Instead of Comma `,`?
- If data contains commas inside values → CSV breaks
- Pipe `|` never appears in normal text → safer separator
- Example: `John|New York|He said hello, how are you?` ✅

### 10. header = true vs false
```
header = "true"  → First row = Column Names ✅
header = "false" → First row = treated as data
                   Spark creates dummy names: _c0, _c1, _c2...
```

### 11. inferSchema — Deep Understanding
```
inferSchema = "true" means:
Step 1 → Spark reads ENTIRE file (all rows)
Step 2 → Scans every column in every row
Step 3 → Decides data type for each column
Step 4 → Builds Schema (table structure) internally
Step 5 → Reads data into DataFrame with correct types
→ Reads file TWICE = SLOW 🐢
```

**Production Best Practice — Define Schema Manually:**
```python
from pyspark.sql.types import *

schema = StructType([
    StructField("Market_Key",  IntegerType(), True),
    StructField("Product_Key", IntegerType(), True),
    StructField("Period_Key",  IntegerType(), True),
    StructField("Sales",       DoubleType(),  True),
    StructField("Units",       DoubleType(),  True)
])

df = spark.read.format("csv") \
    .option("header", "true") \
    .option("sep", "|") \
    .schema(schema) \
    .load("path...")  # reads file only ONCE 🚀
```

### 12. df.show() and df.count()
```python
df.count()     # Returns total number of rows → 355646
df.show()      # Shows first 20 rows (default)
df.show(5)     # Shows first 5 rows only
df.show(100)   # Shows first 100 rows
```

### 13. Transformation vs Action — KEY CONCEPT
```
TRANSFORMATION              ACTION
(Lazy - does NOT run)       (Triggers actual Spark run)

df.filter()        →        df.show()
df.select()        →        df.count()
df.groupBy()       →        df.collect()
df.withColumn()    →        df.write()

Nothing runs until you call an ACTION!
```

### 14. Supported Data Sources in Databricks
| Source | What it is |
|---|---|
| SQL Database | MySQL, PostgreSQL, SQL Server |
| Amazon Redshift | AWS cloud data warehouse |
| S3 | AWS file storage |
| Blob Storage / ADLS Gen2 | Azure file storage |
| Kafka | Real-time streaming |
| Snowflake | Cloud data warehouse |
| Multiple File Formats | CSV, JSON, Parquet, Delta, Avro |

### 15. AWS Region & Multi-Region Concept
- Databricks hosted on AWS US-East-1
- Single region = if region down → everything down
- Multi-region = auto redirect (but 2x cost)
- **RTO** (Recovery Time Objective) = how fast must we recover?
- **RPO** (Recovery Point Objective) = how much data loss is acceptable?

---

## 🛠️ Practical Work Done Today
```
✅ Logged into company Databricks (premium)
✅ Explored Workspace, Catalog, Compute
✅ Created folder: Databricks_Learning_PareshR
✅ Created notebook: Day1_Read_Data
✅ Connected to Engg share compute cluster
✅ Wrote first PySpark code to read Nielsen data
⏳ Code execution pending (AWS US-East-1 outage)
```

---

## 📊 Dataset Used
- **File:** CognitiveROI_Unilever_fct_3502760.txt
- **Size:** 43 MB
- **Rows:** 3,55,646
- **Columns:** 23
- **Separator:** Pipe `|`
- **Source:** Nielsen retail sales data for Unilever

---

## 💡 Key Takeaways
1. Spark = compute engine only. Databricks = Spark + Cloud + Features
2. inferSchema = true is slow (reads file twice) — use manual schema in production
3. Pipe `|` separator used when data contains commas
4. Transformations are lazy — only Actions trigger Spark to run
5. Always terminate cluster when done to save cost
6. Multi-region = high availability but high cost tradeoff

---

## 📅 Tomorrow — Day 2
- Delta Lake basics
- Write data as Delta table (Bronze layer)
- Read Delta table back
- Spark SQL basics
- Medallion Architecture (Bronze → Silver → Gold)

---
*Study method: Read concept → Understand why → Practice in Databricks*  
*One concept per day. Strong foundation = Strong career.* 💪
