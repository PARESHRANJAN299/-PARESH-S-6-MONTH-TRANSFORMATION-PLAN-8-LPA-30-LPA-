# 📓 Databricks Day 3 — Complete Notes
**By:** Paresh Ranjan Rout
**Date:** 27 March 2026
**Topic:** Silver Layer, Gold Layer, Workflow, End-to-End Pipeline

---

## 1. Silver Layer — Clean Data

> **Silver = Bronze dirty data after cleaning. EDA logic applied in PySpark code.**

### What Problems Silver Fixes:
```
❌ Missing values (nulls)
❌ Wrong data types
❌ Duplicate rows
❌ Invalid data (negative sales)
❌ Messy column names
❌ Format inconsistencies
```

### Key PySpark Cleaning Functions:

```python
from pyspark.sql import functions as F
from pyspark.sql.types import DoubleType, IntegerType

# Read Bronze
df_bronze = spark.read.format("delta") \
    .load("/tmp/paresh_learning/bronze_nielsen")

# Step 1 — Rename messy columns
df_silver = df_bronze \
    .withColumnRenamed("$", "Sales") \
    .withColumnRenamed("%ACV", "ACV_Pct")

# Step 2 — Fix data types
df_silver = df_silver \
    .withColumn("Sales",
                df_silver["Sales"].cast(DoubleType())) \
    .withColumn("Market_Key",
                df_silver["Market_Key"].cast(IntegerType()))

# Step 3 — Remove nulls
df_silver = df_silver.dropna(
    subset=["Market_Key", "Sales", "Units"]
)

# Step 4 — Remove duplicates
df_silver = df_silver.dropDuplicates(
    ["Market_Key", "Product_Key", "Period_Key"]
)

# Step 5 — Filter invalid rows
df_silver = df_silver.filter(
    (df_silver["Sales"] >= 0) &
    (df_silver["Units"] >= 0)
)

# Save Silver
df_silver.write.format("delta") \
    .mode("overwrite") \
    .save("/tmp/paresh_learning/silver_nielsen")

print("✅ Silver layer complete!")
```

### Key Functions Summary:
| Function | What it does |
|---|---|
| `dropna()` | Remove null rows |
| `fillna(0)` | Fill nulls with value |
| `dropDuplicates()` | Remove duplicate rows |
| `withColumnRenamed()` | Rename column |
| `withColumn()` | Add/modify column |
| `filter()` | Keep valid rows only |
| `cast()` | Fix data type |
| `F.trim()` | Remove whitespace |

---

## 2. Gold Layer — Aggregate Data

> **Gold = Silver clean data after aggregation. Business ready summaries for BI and ML teams.**

### What Gold Does:
```
Silver has 3,40,000 detailed rows
Gold summarizes to 500 rows

Like:
"Which market has highest sales?"
"What is average sales per market?"
"Total units sold per region?"
```

### Key PySpark Aggregation Functions:
```python
from pyspark.sql import functions as F

# Read Silver
df_silver = spark.read.format("delta") \
    .load("/tmp/paresh_learning/silver_nielsen")

# Aggregate by Market
df_gold = df_silver \
    .groupBy("Market_Key") \
    .agg(
        F.sum("Sales").alias("Total_Sales"),
        F.sum("Units").alias("Total_Units"),
        F.avg("Sales").alias("Avg_Sales"),
        F.max("Sales").alias("Max_Sales"),
        F.min("Sales").alias("Min_Sales"),
        F.count("*").alias("Total_Records")
    ) \
    .withColumn("Total_Sales",
                F.round("Total_Sales", 2)) \
    .withColumn("Avg_Sales",
                F.round("Avg_Sales", 2))

# Save Gold
df_gold.write.format("delta") \
    .mode("overwrite") \
    .save("/tmp/paresh_learning/gold_nielsen_market")

print("✅ Gold layer complete!")
df_gold.show(10)
```

### Aggregation Functions:
| Function | Meaning | Example |
|---|---|---|
| `F.sum()` | Total | Total sales |
| `F.avg()` | Average | Monthly avg salary |
| `F.max()` | Highest | Best sales month |
| `F.min()` | Lowest | Worst sales month |
| `F.count()` | Count rows | Total records |
| `F.round()` | Round decimals | Clean numbers |

---

## 3. Silver vs Gold Comparison

```
Silver (3,40,000 rows):
Market | Product  | Period | Sales | Units
220709 | 22738932 | 44806  | 2.000 | 1.000
220709 | 11323554 | 44804  | 4.968 | 1.218
...detailed row by row...

Gold (500 rows):
Market | Total_Sales | Avg_Sales | Max_Sales
220709 | 1,50,000   | 2.5       | 4968.0
203136 | 2,50,000   | 3.1       | 2905.0
...summarized by market...

3,40,000 → 500 rows! ✅
```

---

## 4. Databricks Workflow (Job)

> **Workflow = Intelligent automation system that runs notebooks automatically without human intervention — even while sleeping!**

### What Problem Workflow Solves:
```
Without Workflow:
→ Open Databricks manually every day
→ Run each notebook manually
→ Forget one day = data missing! ❌
→ On leave = pipeline stops! ❌

With Workflow:
→ Set once = runs forever ✅
→ Every day at scheduled time ✅
→ Even on holidays ✅
→ No productivity loss! ✅
→ Non-stop business growth! ✅
```

### Task Dependencies:
```
Task 1 (Bronze) → Task 2 (Silver) → Task 3 (Gold)

If Task 1 FAILS:
→ Task 2 does NOT run ✅
→ Task 3 does NOT run ✅
→ Alert sent to engineer ✅

Why?
→ No point cleaning if Bronze failed!
→ Prevents wrong data in Gold!
```

### How to Create Workflow:
```
Left menu → Jobs & Pipelines → Create Job

Task 1:
→ Name = "Ingest_Bronze"
→ Notebook = ingest_bronze
→ Cluster = Engg share compute

Task 2:
→ Name = "Clean_Silver"
→ Notebook = clean_silver
→ Depends on = Ingest_Bronze ✅

Task 3:
→ Name = "Aggregate_Gold"
→ Notebook = aggregate_gold
→ Depends on = Clean_Silver ✅

Schedule = Every day 6:00 AM
Save → Done! 🎉
```

### Workflow vs Manual:
| | Manual | Workflow |
|---|---|---|
| Who runs | You manually | Automatic ✅ |
| When | When you remember | Exact schedule ✅ |
| On leave | Pipeline stops ❌ | Runs anyway ✅ |
| If fails | You notice later | Alert immediately ✅ |
| Consistency | Depends on you | Always consistent ✅ |

---

## 5. Complete 3-Notebook Pipeline

### Notebook 1 — ingest_bronze:
```python
print("🥉 Starting Bronze ingestion...")

df_raw = spark.read.format("csv") \
    .option("header", "true") \
    .option("sep", "|") \
    .option("inferSchema", "true") \
    .load("/Volumes/.../nielsen.txt")

df_raw.write.format("delta") \
    .mode("overwrite") \
    .save("/tmp/paresh_learning/bronze_nielsen")

print("✅ Bronze complete! Rows:", df_raw.count())
```

### Notebook 2 — clean_silver:
```python
print("🥈 Starting Silver cleaning...")

df_bronze = spark.read.format("delta") \
    .load("/tmp/paresh_learning/bronze_nielsen")

df_silver = df_bronze \
    .withColumnRenamed("$", "Sales") \
    .dropna(subset=["Market_Key", "Sales"]) \
    .dropDuplicates(["Market_Key","Product_Key","Period_Key"]) \
    .filter(df_bronze["Units"] > 0)

df_silver.write.format("delta") \
    .mode("overwrite") \
    .save("/tmp/paresh_learning/silver_nielsen")

print("✅ Silver complete! Rows:", df_silver.count())
```

### Notebook 3 — aggregate_gold:
```python
print("🥇 Starting Gold aggregation...")

from pyspark.sql import functions as F

df_silver = spark.read.format("delta") \
    .load("/tmp/paresh_learning/silver_nielsen")

df_gold = df_silver \
    .groupBy("Market_Key") \
    .agg(
        F.sum("Sales").alias("Total_Sales"),
        F.count("*").alias("Total_Records")
    )

df_gold.write.format("delta") \
    .mode("overwrite") \
    .save("/tmp/paresh_learning/gold_nielsen_market")

print("✅ Gold complete! Rows:", df_gold.count())
df_gold.show(10)
```

---

## 6. Complete Pipeline Flow

```
Every day at 6 AM — Workflow runs:

Nielsen CSV (source)
        ↓
🥉 Bronze Delta Table
   Raw data — as is
   3,55,646 rows
        ↓
🥈 Silver Delta Table
   Cleaned data
   3,40,000 rows
        ↓
🥇 Gold Delta Table
   Aggregated by market
   500 rows
        ↓
📊 BI Dashboard (fresh data!)
🤖 ML Models (clean data!)
💼 Business Decisions!

YOU are still sleeping! 😄
```

---

## 7. EDA vs Silver Layer

```
EDA = Exploratory Data Analysis
    = FIND the problems

Silver = EDA + FIXING
       = FIND + FIX problems!

Silver Layer = EDA logic 
               applied in PySpark code! ✅
```

---

## 8. Complete 3-Day Summary

```
DAY 1 — Foundation:
✅ What is Databricks
✅ Spark vs Databricks
✅ Cluster, Node, Master, Worker
✅ Driver, Cluster Manager
✅ DataFrame, Partition
✅ Transformation vs Action
✅ Auto Scaling
✅ First PySpark code

DAY 2 — Delta Lake:
✅ CSV vs Parquet vs Delta
✅ ACID transactions
✅ Time Travel
✅ Write & Read Delta
✅ Write modes
✅ Medallion Architecture

DAY 3 — Pipeline:
✅ Silver cleaning functions
✅ Gold aggregation functions
✅ Databricks Workflow
✅ End-to-End pipeline logic
✅ Task dependencies

WEEKEND — Practical:
⏳ Run all 3 notebooks
⏳ Create Workflow
⏳ See real output
⏳ First portfolio project!
```

---

## 💡 Golden Rules — Day 3

```
1. Silver = EDA in code — find AND fix!
2. Gold = GroupBy + Aggregate for business
3. Bronze rows > Silver rows always
4. Silver rows > Gold rows always
5. Workflow = set once, run forever
6. Task dependencies prevent wrong data
7. BI + ML teams only touch Gold!
```

---
*"Foundation strong = Career strong.
 Logic first, practical second.
 Series by series = mastery!"* 💪
*— Paresh Ranjan Rout, 27 March 2026*
