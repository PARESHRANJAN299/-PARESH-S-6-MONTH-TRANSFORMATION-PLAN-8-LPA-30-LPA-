# 📓 Databricks Day 1 — Complete Study Notes
**By:** Paresh Ranjan Rout  
**Date:** 18 March 2026  
**Goal:** AWS Data Engineering — 30 LPA 🎯

---

## 1. What is Node?

> **Node = Just a machine (computer)**

```
Node = Machine = Computer = Server
All same thing — just different words!
```

---

## 2. What is a Cluster?

> **Cluster = A group of machines working together**

```
1 machine alone  = NOT a cluster
2+ machines      = CLUSTER ✅

Cluster = Group of Nodes
        = Group of Machines
        = Set of Nodes
```

---

## 3. What is Cluster Node?

> **Cluster Node = Any machine that is part of a cluster**

```
CLUSTER
├── Node 1 = Cluster Node ✅
├── Node 2 = Cluster Node ✅
├── Node 3 = Cluster Node ✅
└── Node 4 = Cluster Node ✅

Every machine inside cluster
= Cluster Node!
```

---

## 4. What is Master Node?

> **Master Node = First machine created in cluster = BOSS machine**

```
YOU click "Create Cluster"
        ↓
AWS gives machines
        ↓
First machine = MASTER NODE ✅
Rest          = WORKER NODES ✅

Master Node = Physical machine (hardware)
Master Node = ONE MAN ARMY! 💪

Contains:
├── Driver (software)          → manages jobs
└── Cluster Manager (software) → manages machines
```

---

## 5. What is Worker Node?

> **Worker Node = Remaining machines in cluster that process data**

```
Like employees in office:
→ Receive tasks from Driver
→ Process their partition
→ Return results to Driver
→ Never talk to YOU directly

More Worker Nodes = faster processing ⚡
```

---

## 6. What is Driver?

> **Driver = Software on Master Node that manages your job workflow**

```
Driver is SOFTWARE ✅ (not hardware)
Lives on MASTER NODE ✅
Installed AUTOMATICALLY by Databricks ✅

Driver's job:
1. Receives YOUR code
2. Creates execution plan (DAG)
3. Assigns work to Worker Nodes
4. Collects results from Workers
5. Returns final output to YOU ✅
```

---

## 7. What is Cluster Manager?

> **Cluster Manager = Software that manages machines in cluster**

```
Cluster Manager is SOFTWARE ✅
Lives on MASTER NODE ✅
Installed automatically by Databricks ✅

Cluster Manager's job:
1. Requests machines from AWS
2. Assigns Master + Worker roles
3. Monitors machine health
4. Starts/stops Worker Nodes
5. Manages memory and CPU
```

---

## 8. Master Node = One Man Army! 💪

```
MASTER NODE
├── Power 1 = Cluster Manager
│   → Manages all MACHINES
│
└── Power 2 = Driver
    → Manages all JOBS

Both powers in ONE machine!
That's why Master Node = One Man Army! 😄
```

---

## 9. What is Apache Spark?

> **Spark = Distributed compute engine. Takes data → processes it → gives output.**

```
Spark does NOT store data ❌
Spark has NO UI ❌
Spark has NO scheduler ❌
Spark has NO auto scaling ❌

Spark ONLY processes data ✅
```

**Where Spark runs:**
```
1. Local laptop     → pip install pyspark
                      only 1 machine
                      for learning only

2. On-premise       → company's own servers
                      banks, govt, hospitals
                      data privacy reasons

3. Cloud (AWS/Azure)→ Databricks / EMR
                      scalable, pay per use
                      most companies use this
```

---

## 10. What is Databricks?

> **Databricks = Spark + Cloud + Features = One Stop Solution**

```
Built on top of Apache Spark ✅
Has UI (notebooks) ✅
Has storage (Delta Lake) ✅
Has scheduler (Workflows) ✅
Has auto scaling ✅
Has SQL editor ✅
Has collaboration ✅
```

---

## 11. Spark vs Databricks

| | Spark | Databricks |
|---|---|---|
| Cost | Free | Paid |
| Owner | Apache Foundation | Private company |
| UI | ❌ No | ✅ Yes |
| Storage | ❌ No | ✅ Delta Lake |
| Scheduler | ❌ No | ✅ Workflows |
| Auto Scale | ❌ Manual | ✅ Automatic |
| Setup | Manual | Ready on cloud |

> **One line: Databricks = Spark + everything Spark is missing!**

---

## 12. What is Workspace?

> **Workspace = Your personal home inside Databricks**

```
Where you:
CREATE  → notebooks, folders
WRITE   → PySpark / SQL code
RUN     → execute code
SAVE    → store your work
SHARE   → collaborate with team

Your workspace:
Workspace → Users → paresh.r@datapoem.com
                         ↓
                  Databricks_Learning_PareshR
                         ↓
                  Day1_Read_Data notebook
```

---

## 13. What is Auto Scaling?

> **Auto Scaling = Automatically expand machines when load is high, reduce when load is low — pay only for what you use!**

```
Normal day   → 5 machines  → normal cost
Black Friday → 50 machines → handles peak load
Night time   → 2 machines  → minimum cost

System decides automatically!
No human needed! ✅
```

**Types of Scaling:**
```
Scale Up   → make each machine bigger
Scale Out  → add more machines
Auto Scale → system decides automatically ✅
```

**Cost Impact:**
```
Without Auto Scale → pay for 20 machines always
With Auto Scale    → pay for average 5 machines
SAVING = 75% cost reduction! 💰
```

---

## 14. What is DataFrame?

> **DataFrame = Distributed table stored in RAM across multiple machines**

```
NOT a spreadsheet ❌
NOT on hard disk ❌
IS a table (rows + columns) ✅
IS in RAM (temporary) ✅
IS distributed (multiple machines) ✅
IS faster than RDD ✅
```

**How data splits:**
```
File on disk (S3/DBFS)
        ↓ Spark reads
DataFrame splits into partitions:

Machine 1 RAM → Partition 1
Machine 2 RAM → Partition 2
Machine 3 RAM → Partition 3
Machine 4 RAM → Partition 4

All process SIMULTANEOUSLY = FAST ⚡
```

---

## 15. What is Partition?

> **Partition = One chunk of data stored on one machine's RAM**

```
Driver automatically splits data
into partitions

1 partition = 1 machine RAM
All partitions processed simultaneously
Result = super fast! ⚡

YOU never see partitions!
Spark hides it — you see ONE table!
```

---

## 16. Types of Spark Data Structures

### RDD (Old — Spark 1.0)
```
→ No column names
→ Manual everything
→ Hard to use
→ No auto optimization
→ Rarely used today
→ Like manual car 🚗
```

### DataFrame (Modern — Most Used ⭐)
```
→ Has column names
→ Auto optimized
→ Easy to use
→ SQL support
→ Used 95% in production
→ Like automatic car 🚗✅
```

### Dataset
```
→ Only Java/Scala
→ NOT for Python
→ Rarely used
```

---

## 17. DataFrame vs Excel

| | Excel | Spark DataFrame |
|---|---|---|
| Type | Spreadsheet | Table (code) |
| Storage | Hard disk | RAM |
| Location | 1 machine | Multiple machines |
| Max rows | ~10 lakh | Unlimited |
| Speed | Slow | Fast ⚡ |
| Permanent | ✅ Yes | ❌ Temporary |

---

## 18. RAM vs Hard Disk

```
Hard Disk = permanent storage 💾
→ Files, Delta Lake, S3
→ Speed = 100 MB/second 🐢

RAM = temporary storage 🧠
→ DataFrame lives here
→ Speed = 50,000 MB/second 🚀
→ 500x faster than hard disk!
→ Cleared when job finishes
```

---

## 19. Transformation vs Action ⭐

> **Transformation = Planning (lazy, does NOT run)**
> **Action = Executing (actually runs Spark)**

```
TRANSFORMATION          ACTION
──────────────          ──────
Lazy 😴                 Executes! ⚡
Saves instruction       Shows output
Does NOT run            Actually runs
filter()                show()
select()                count()
groupBy()               collect()
withColumn()            write()
```

**Pizza Analogy:**
```
Transformation = Writing pizza order 📝
Action         = Saying "deliver now!" 🍕
```

---

## 20. What is Lazy Evaluation?

> **Spark collects ALL transformations first, optimizes them, then runs everything at once when Action is called**

```
df.filter()    → saved ✅ (not run)
df.select()    → saved ✅ (not run)
df.groupBy()   → saved ✅ (not run)

df.show()      → NOW Spark runs everything!
                 All 3 steps at once! ⚡
```

---

## 21. First PySpark Code

```python
df = spark.read.format("csv") \
    .option("header", "true") \
    .option("sep", "|") \
    .option("inferSchema", "true") \
    .load("/Volumes/workspace/cdw_dp_nielsen_sales/nielsen/CognitiveROI_Unilever/CognitiveROI_Unilever_3502760/CognitiveROI_Unilever_fct_3502760.txt")

print("Total Rows:", df.count())
df.show(5)
```

**Code explained:**
```
spark.read          → use Spark to read data
.format("csv")      → file type is CSV
.option("header")   → first row = column names
.option("sep","|")  → separator is pipe not comma
.option("inferSchema") → auto detect data types
.load("path")       → file location
df.count()          → ACTION → total rows
df.show(5)          → ACTION → first 5 rows
```

---

## 22. Why Pipe | Not Comma ,?

```
Problem with comma:
John, New York, "He said hello, how are you?" ❌
                              ↑ breaks CSV!

Solution with pipe:
John|New York|He said hello, how are you? ✅
No problem — pipe never appears in text!
```

---

## 23. inferSchema = true (SLOW ⚠️)

```
Reads file TWICE:
1st read → detects column data types
2nd read → loads data into DataFrame
→ SLOW 🐢

Production best practice:
Define schema manually → reads ONCE → FAST 🚀

from pyspark.sql.types import *
schema = StructType([
    StructField("Market_Key", IntegerType(), True),
    StructField("Sales",      DoubleType(),  True)
])
df = spark.read.schema(schema).load("path")
```

---

## 24. Complete Spark Flow

```
YOU press Run
        ↓
DRIVER receives code (on Master Node)
        ↓
DRIVER creates DAG (execution plan)
        ↓
DRIVER assigns partitions to Workers
        ↓
Worker 1 → partition 1 RAM ⚡
Worker 2 → partition 2 RAM ⚡
Worker 3 → partition 3 RAM ⚡
(ALL SIMULTANEOUSLY!)
        ↓
Workers send results to Driver
        ↓
Driver combines all results
        ↓
YOU see final output! ✅
```

---

## 25. AWS Region & Outage

```
Databricks hosted on AWS US-East-1
Single region = if down → everything stops
Multi-region  = auto redirect (2x cost)

RTO = Recovery Time Objective
    = how fast must we recover?

RPO = Recovery Point Objective
    = how much data loss acceptable?
```

---

## 26. Dataset Used Today

```
File    : CognitiveROI_Unilever_fct_3502760.txt
Size    : 43 MB
Rows    : 3,55,646
Columns : 23
Sep     : Pipe |
Source  : Nielsen retail data for Unilever
```

---

## ✅ Practical Done Today

```
✅ Logged into company Databricks
✅ Explored Workspace, Catalog, Compute
✅ Created: Databricks_Learning_PareshR folder
✅ Created: Day1_Read_Data notebook
✅ Connected to Engg share compute cluster
✅ Wrote first PySpark code
✅ Pushed all materials to GitHub
```

---

## 🎯 Top Interview Questions

```
1. What is difference between Spark and Databricks?
2. What is Lazy Evaluation?
3. What is Transformation vs Action?
4. What is Auto Scaling?
5. What is a DataFrame?
6. What is a Partition?
7. What is Driver?
8. What is Master Node vs Worker Node?
9. What does inferSchema do?
10. Why use pipe | instead of comma?
```

---

## 📅 Tomorrow — Day 2

```
→ Delta Lake
→ ACID transactions
→ Bronze → Silver → Gold
→ Medallion Architecture
→ Spark SQL
```

---
*"I have to study more and change my family generation"*  
*— Paresh Ranjan Rout, 18 March 2026* 💪🔥
