# 📓 Complete Study Notes — April 4-5, 2026
**By:** Paresh Ranjan Rout
**Day:** 15-Day DE Associate Certification — Day 4-5
**Topics:** Cluster Creation, Instance Types, DBU, Photon, Runtime

---

## 1. Create New Compute — All Fields Explained

### Compute Name
```
= Name of your cluster
= Use meaningful names!

Good: "Paresh_Learning_Cluster" ✅
Good: "Nielsen_Pipeline_Cluster" ✅
Bad:  "Cluster1" ❌
```

### Policy
```
Personal Compute = only YOU use ✅
Shared = whole team uses
Job Compute = automated jobs only
No Restriction = admin only

For learning = Personal Compute ✅
```

### Machine Learning Checkbox
```
Checked = ML libraries included
         (TensorFlow, PyTorch etc.)
         Heavier runtime!

Unchecked = standard runtime ✅
           Lighter, faster startup!

For Data Engineering = UNCHECK! ✅
Only check for actual ML work!
```

---

## 2. Databricks Runtime

> **Runtime = Databricks + Spark + Libraries ALL packaged together**

```
Runtime: 18.1
→ 18   = Databricks version
→ .1   = minor update

Contains:
→ Spark 4.1.0 ✅
→ Scala 2.13 ✅
→ Python 3.11 ✅
→ Delta Lake 4.0 ✅
→ All pre-installed! ✅

YOU install NOTHING!
Databricks handles all! ✅
```

### 18.1 vs 14.3 LTS
```
18.1 (Latest):
→ Newest features ✅
→ Best for learning ✅
→ Latest Spark 4.1 ✅
→ May have small bugs ⚠️

14.3 LTS (Long Term Support):
→ Very stable ✅
→ Enterprise production use ✅
→ Supported for long time ✅
→ Older Spark 3.5 ❌

PRICE = SAME for both! ✅
Use 18.1 for learning! ✅
```

---

## 3. What is Scala?

> **Scala = Programming language that Spark was originally written in**

```
Apache Spark = written in Scala
PySpark = Python wrapper on top of Scala

YOU write: PySpark (Python) ✅
Underneath: Scala runs ✅
YOU don't need to learn Scala! ✅

Scala = English (original)
PySpark = Hindi translation

You read Hindi (PySpark) ✅
Book still in English (Scala) underneath!
```

### Who Needs Scala?
```
YOU need Scala:
→ Building Spark itself ❌
→ Senior Spark developer ❌

YOU don't need Scala:
→ Data Engineering ✅
→ Pipeline building ✅
→ Delta Lake work ✅
→ Learning Databricks ✅
```

---

## 4. CPU Cores

> **Core = one worker inside processor. More cores = more parallel tasks!**

```
1 Core = 1 chef in kitchen
4 Cores = 4 chefs simultaneously ✅
16 Cores = 16 chefs simultaneously

More cores = faster processing!
But more cores = more cost! 💸

For 43 MB Titanic data:
→ 4 cores = MORE than enough ✅
→ 16 cores = wasteful! 💸
```

### Core Count Guide
```
2 Cores  = tiny testing
4 Cores  = learning ✅ (you!)
8 Cores  = small production
16 Cores = medium production
32 Cores = large production
64 Cores = enterprise scale
```

---

## 5. AWS Instance Types

> **AWS has different machine types, each optimized for different work!**

### All Types Explained
```
m = General Purpose 🚗
    → Balanced CPU + RAM + Storage
    → Most common
    → Good for most workloads

c = Compute Optimized 🏎️
    → Very fast CPU
    → Heavy calculations
    → Less RAM

r = Memory Optimized 🚛
    → HUGE RAM
    → Large data in memory
    → BEST for Data Engineering! 🏆

i = Storage Optimized 🏭
    → Fast SSD disk
    → Fast read/write
    → Good for data processing ✅

g = GPU Accelerated 🎮
    → GPU chip included
    → AI/Deep Learning ONLY
    → Very expensive! 💸

t = Burstable 🚲
    → Cheapest
    → Light work only
    → Testing/dev

x = Extra Memory 🛳️
    → Enormous RAM
    → SAP/Oracle workloads
    → Most expensive! 💸💸
```

### Power vs Cost Ranking
```
Most Powerful: x > r > g > i > c > m > t
Most Expensive: x > g > r > i > c > m > t
Best for DE: r (memory) then i (storage)
Cheapest for learning: t or m family ✅
```

### Instance Size Meaning
```
i3.xlarge = TYPE (i3) + SIZE (xlarge)

Sizes smallest to largest:
nano < micro < small < medium <
large < xlarge < 2xlarge < 4xlarge <
8xlarge < 16xlarge < 32xlarge

YOUR i3.xlarge:
→ 30.5 GB RAM ✅
→ 4 Cores ✅
→ Medium-large size
```

---

## 6. What is DBU?

> **DBU = Databricks Unit = Databricks billing measurement. Like KWH for electricity!**

```
Electricity = measured in KWH
Internet    = measured in GB
Databricks  = measured in DBU

DBU rate depends on:
→ Instance type (bigger = more DBU)
→ Cluster type (all-purpose vs job)
→ Runtime type (ML = more DBU)
```

### DBU Rate by Instance
```
t3.medium   = 0.25 DBU/h (cheapest)
m5.large    = 0.5 DBU/h
i3.xlarge   = 1.0 DBU/h ← YOU
i3.2xlarge  = 2.0 DBU/h
i3.4xlarge  = 4.0 DBU/h
g4dn.xlarge = 0.71 DBU/h (GPU)
```

### Total Cost Calculation
```
TOTAL BILL = Databricks cost + AWS cost

COST 1 — Databricks:
DBU rate × hours × DBU price
= 1 DBU/h × 2h × $0.55 = $1.10

COST 2 — AWS:
EC2 machine cost per hour
= ~$0.31/h × 2h = $0.62

TOTAL = $1.10 + $0.62 = $1.72
for 2 hours! 💰
```

### DBU by Cluster Type
```
All-Purpose = $0.55/DBU (expensive)
Job cluster = $0.15/DBU (cheaper!) ✅
Serverless  = per second billing
```

---

## 7. Advanced Settings Explained

### Tags
```
Tags = Labels for cost tracking
Key = category, Value = specific value

Example:
Key: "Owner"   Value: "Paresh"
Key: "Project" Value: "Nielsen"

Used by finance team to track
who is spending what! 💰

For learning = leave empty ✅
```

### Access Mode
```
Single User = only YOU ✅
Shared = multiple users
No Isolation = old style

Unity Catalog REQUIRES
Single User mode! ✅
```

### Instance Profile
```
= AWS IAM role for cluster
= Access S3 buckets and AWS services

Unity Catalog handles this automatically!
Keep None for learning! ✅
```

### Spark Tab
```
= Advanced Spark configurations
= Default settings = perfect ✅
= Don't touch for learning!
```

### SSH Tab
```
= Direct terminal access to machines
= Advanced debugging only
= Don't touch for learning! ✅
```

### Logging Tab
```
= Where to save cluster logs
= Default = DBFS storage ✅
= Don't change for learning!
```

### Init Scripts
```
= Code that runs BEFORE cluster ready
= Install custom libraries
= Set environment variables

For learning = leave empty ✅
```

---

## 8. Photon Acceleration

> **Photon = Databricks own C++ query engine that replaces Spark's default Java engine. 10-100x faster for SQL!**

### How Photon Works
```
WITHOUT Photon (normal Spark):
SQL query → JVM (Java) → CPU
= Extra translation layer = slower ❌

WITH Photon:
SQL query → C++ engine → CPU directly!
= No extra layer = FASTER! ✅

C++ = closer to hardware
    = much faster execution!
```

### Speed Comparison
```
Simple SELECT    = 2-3x faster
Complex JOINs   = 5-10x faster
Aggregations    = 10-20x faster
Large table scan = 50-100x faster
```

### Photon Helps vs Doesn't Help
```
HELPS:
✅ SQL queries
✅ SELECT, WHERE, GROUP BY
✅ JOINs and aggregations
✅ Delta Lake reads
✅ BI dashboard queries

DOESN'T HELP:
❌ Python UDFs
❌ ML model training
❌ Custom Python functions
❌ Small datasets
```

### Photon Cost Reality
```
MORE expensive per hour
BUT finishes faster = cheaper overall!

Example:
Without: 10 hours × $0.55 = $5.50
With:    1 hour  × $0.75 = $0.75

Photon = SAVES money for heavy SQL! ✅
```

### When to Use Photon
```
USE when:
✅ Heavy SQL analytics
✅ Production BI queries
✅ Large table joins
✅ Gold layer queries

DON'T USE when:
❌ Learning/testing
❌ Small data (43 MB)
❌ Python heavy pipelines
❌ ML workloads
```

---

## 9. Cluster Creation Summary

### YOUR Cluster Config
```
Name     = Paresh Personal Cluster
Policy   = Personal Compute
ML       = Unchecked ✅
Runtime  = 18.1 (Spark 4.1.0)
Node     = i3.xlarge (30.5GB, 4 Cores)
Terminate = 10 mins idle ✅
Tags     = empty
Access   = Single User (Paresh) ✅
Profile  = None
Photon   = Off ✅
Price    = 1 DBU/h
```

### Cluster Creation Time
```
Minimum: 2-3 minutes ✅
Average: 3-5 minutes ✅
Maximum: 7-8 minutes ⚠️
```

---

## 10. Interview Questions from Today

```
Q1: What is Databricks Runtime?
A: Spark + Databricks features +
   Libraries all packaged together.
   Version 18.1 = latest!

Q2: What is Scala in Databricks?
A: Language Spark was built with.
   Data Engineers use PySpark,
   not Scala directly!

Q3: What is DBU?
A: Databricks billing unit like KWH.
   Two bills: Databricks (DBU) + AWS (EC2)

Q4: What is Photon?
A: Databricks C++ query engine.
   10-100x faster than Java Spark engine.
   Best for SQL analytics!

Q5: i3 vs r5 vs m5 instance?
A: i3=storage optimized,
   r5=memory optimized (best for DE),
   m5=general purpose (balanced)

Q6: What is LTS runtime?
A: Long Term Support = stable version
   supported for years. Production use!
```

---

## 💡 Golden Rules — Today

```
1. Runtime version = doesn't change price!
2. Instance type = determines price!
3. DBU = Databricks charge
   EC2 = AWS charge separately!
4. Photon = faster but costs more per hour
   Cheaper OVERALL for heavy SQL!
5. ML checkbox = uncheck for DE work!
6. Terminate after 10 mins = always! ✅
7. i3 = storage, r = memory, m = general
8. More cores = more parallel = faster!
9. Scala = underneath, PySpark = your tool!
10. Single User mode = Unity Catalog required!
```

---
*"Understanding every configuration = engineering mindset!"*
*— Paresh Ranjan Rout, April 5, 2026* 💪🔥
