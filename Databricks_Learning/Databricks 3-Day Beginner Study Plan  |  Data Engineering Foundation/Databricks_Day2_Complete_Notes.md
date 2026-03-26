# 📓 Databricks Day 2 — Complete Notes
**By:** Paresh Ranjan Rout
**Date:** 26 March 2026
**Topic:** Delta Lake, ACID, Time Travel, Medallion Architecture

---

## 1. What is Delta Lake?

> **Delta Lake = Storage layer that adds ACID transactions + Time Travel + Schema Enforcement on top of Parquet files**

```
Delta Lake = Just FILES on cloud storage!
├── Parquet files  → actual data
└── _delta_log/    → transaction history

NOT a database!
NOT a separate system!
Just smart files on S3/DBFS! ✅
```

---

## 2. Generation of Storage Formats

### Generation 1 — CSV
```
→ Simple text file
→ Human readable
→ Works everywhere
→ No ACID ❌
→ No compression ❌
→ No schema ❌
→ Multiple writers = corruption! ❌
→ Big data = very slow 🐢
→ Storage cost = HIGH 💸
```

### Generation 2 — Parquet
```
→ Columnar storage format
→ Reads only needed columns = fast ⚡
→ 10x compression = cheaper storage
→ Schema stored ✅
→ Still NO ACID ❌
→ Multiple writers = corruption! ❌
→ No time travel ❌
→ Cannot update/delete rows ❌
```

### Generation 3 — Delta Lake ⭐
```
→ Built ON TOP of Parquet
→ All Parquet benefits +
→ ACID transactions ✅
→ Time Travel ✅
→ Schema Enforcement ✅
→ Update/Delete support ✅
→ Multiple writers = SAFE ✅
→ Audit history ✅
→ Production standard! ✅
```

---

## 3. CSV vs Parquet vs Delta Lake

| | CSV | Parquet | Delta Lake |
|---|---|---|---|
| Generation | 1st | 2nd | 3rd ⭐ |
| ACID | ❌ | ❌ | ✅ |
| Time Travel | ❌ | ❌ | ✅ |
| Compression | ❌ | ✅ | ✅ |
| Update/Delete | ❌ | ❌ | ✅ |
| Multiple writers | ❌ Corrupt | ❌ Corrupt | ✅ Safe |
| Storage cost | High 💸 | Low ✅ | Low ✅ |
| Speed | Slow 🐢 | Fast ⚡ | Fastest 🚀 |
| Production | ❌ Never | Sometimes | ✅ Always |

---

## 4. Why Not Just Use a Database?

```
Database = good for:
→ Small transactional data
→ Single row lookups
→ Real time operations
→ Banking, user records

Delta Lake = good for:
→ Big analytical data
→ Billions of rows
→ Analytics, ML, reporting
→ Nielsen, sales data

These are TWO different worlds!
Right tool for right job! ✅

Companies use BOTH together:
Database  → real time transactions
Delta Lake → big data analytics
Data Engineers connect them via ETL! 🎯
```

---

## 5. ACID Transactions

### A = Atomic (All or Nothing!)
```
Either 100% SUCCESS or 100% FAILURE
Never 50%! No middle ground!

Example:
Writing 3,55,646 rows:
→ System crashes at 1,00,000
→ Delta cancels EVERYTHING
→ 0 rows written
→ Try again fresh! ✅
→ Never half-written data!

Like bank transfer:
→ Both accounts update = SUCCESS ✅
→ Any problem = CANCEL both ✅
→ Money never lost!
```

### C = Consistent (Rules Always Maintained!)
```
Rules we define = always enforced!
Nothing goes beyond rules and policy!

Example:
Rule: Sales column must be a number
Someone writes "abc" = REJECTED! ✅
Data always valid! ✅
```

### I = Isolated (No Conflicts!)
```
Everything runs in order
Nothing conflicts!

Example:
Two people can't get same 
bank account number! ✅
Queue process = 1,2,3,4,5
Never conflict! ✅
```

### D = Durable (Saved Forever! Trust!)
```
Once saved = saved forever!
Even if system crashes = data safe!

Example:
Write 3,55,646 rows
Server crashes immediately after
→ Data still there! ✅
→ Trust! ✅
```

---

## 6. Time Travel

> **Time Travel = Go back to any previous version of data. Like GitHub for data!**

```
Delta Lake records every change
in _delta_log folder:

/delta/sales/
├── part-001.parquet  ← data
└── _delta_log/
    ├── 00000.json → Version 0 (Monday)
    ├── 00001.json → Version 1 (Tuesday)
    └── 00002.json → Version 2 (Wednesday)

Go back anytime! ✅
```

### GitHub vs Delta Lake
```
GitHub (code)          Delta Lake (data)
─────────────          ────────────────
git commit        →    write to Delta
git log           →    DESCRIBE HISTORY
git checkout v1   →    versionAsOf = 1
git revert        →    restore version

Same concept!
GitHub = for code
Delta Lake = for DATA! 🎯
```

### Time Travel Code
```python
# Current version
df = spark.read.format("delta").load("/path")

# Go back to version 0
df_v0 = spark.read.format("delta") \
        .option("versionAsOf", 0) \
        .load("/path")

# Go back by date
df_date = spark.read.format("delta") \
          .option("timestampAsOf", "2026-03-18") \
          .load("/path")
```

### Why Time Travel is Useful
```
✅ Wrong data loaded = restore instantly!
✅ Client asks old data = time travel!
✅ ML model = same data every time!
✅ Debugging = check old versions!
✅ No manual backup needed!
```

---

## 7. Write & Read Delta Table

### Complete Code
```python
# CELL 1 — Read CSV (Day 1 code)
df = spark.read.format("csv") \
    .option("header", "true") \
    .option("sep", "|") \
    .option("inferSchema", "true") \
    .load("/Volumes/workspace/.../nielsen.txt")

print("✅ CSV loaded:", df.count(), "rows")

# CELL 2 — Write as Delta (Bronze)
df.write \
  .format("delta") \
  .mode("overwrite") \
  .save("/tmp/paresh_learning/bronze_nielsen")

print("✅ Saved as Delta!")

# CELL 3 — Read Delta back
df_delta = spark.read \
           .format("delta") \
           .load("/tmp/paresh_learning/bronze_nielsen")

print("✅ Delta loaded:", df_delta.count(), "rows")
df_delta.show(5)

# CELL 4 — See History
from delta.tables import DeltaTable
delta_table = DeltaTable.forPath(
    spark,
    "/tmp/paresh_learning/bronze_nielsen"
)
delta_table.history().show()
```

---

## 8. Write Modes

| Mode | Meaning | When to use |
|---|---|---|
| **overwrite** | Delete old, write fresh | Monthly full reload |
| **append** | Add to existing | Daily new data |
| **ignore** | Skip if exists | First time setup |
| **error** | Fail if exists | Safety — prevent accident |

```
overwrite = Replace everything fresh!
append    = Add to master sheet! ✅
```

---

## 9. Medallion Architecture ⭐

> **3 layer system: Raw data passes through Bronze → Silver → Gold and becomes clean, reliable, business-ready data**

```
SOURCE DATA (dirty)
      ↓
🥉 BRONZE  → Raw as-is (safety net)
      ↓
🥈 SILVER  → Cleaned data
      ↓
🥇 GOLD    → Business ready
      ↓
ML Engineers + BI Engineers 🎯
```

### Bronze Layer 🥉
```
→ Exact copy of source data
→ NO changes at all!
→ Safety net — if anything wrong
  go back to Bronze and reprocess
→ Original source of truth!
→ Largest size

Code:
df_raw.write.format("delta")
      .mode("overwrite")
      .save("/delta/bronze/nielsen")
```

### Silver Layer 🥈
```
→ Bronze data after cleaning
→ Remove nulls → dropna()
→ Remove duplicates → dropDuplicates()
→ Remove invalid rows → filter()
→ Fix data types
→ Medium size

Code:
df_silver = df_bronze \
    .dropna() \
    .dropDuplicates() \
    .filter(df_bronze["Units"] > 0)

df_silver.write.format("delta")
         .mode("overwrite")
         .save("/delta/silver/nielsen")
```

### Gold Layer 🥇
```
→ Silver data after aggregation
→ Summarized for business use
→ GroupBy + calculations
→ Ready for reports/dashboards/ML
→ Smallest size

Code:
from pyspark.sql import functions as F

df_gold = df_silver \
    .groupBy("Market_Key") \
    .agg(
        F.sum("$").alias("Total_Sales"),
        F.sum("Units").alias("Total_Units"),
        F.count("*").alias("Total_Records")
    )

df_gold.write.format("delta")
       .mode("overwrite")
       .save("/delta/gold/nielsen_summary")
```

---

## 10. Bronze vs Silver vs Gold

| | Bronze | Silver | Gold |
|---|---|---|---|
| Data | Raw dirty | Cleaned | Aggregated |
| Rows | All rows | Valid only | Summarized |
| Changes | Never! | Cleaned | Calculated |
| Purpose | Safety net | Clean source | Business ready |
| Used by | DE only | DE only | ML + BI + Business |
| Size | Largest | Medium | Smallest |

---

## 11. Real Life Analogy

```
Raw vegetables arrive 🥦
      ↓
Bronze = Store in warehouse
         Exactly as received
         Don't touch!
      ↓
Silver = Kitchen prep
         Wash, cut bad parts
         Peel and slice
      ↓
Gold = Cooked dish 🍛
       Ready to serve
       Perfect! ✅
```

---

## 12. Complete Pipeline Flow

```
Nielsen txt file (source)
        ↓
🥉 Bronze Delta Table
   /delta/bronze/nielsen
   3,55,646 rows — raw as-is
        ↓
🥈 Silver Delta Table
   /delta/silver/nielsen
   3,40,000 rows — cleaned
        ↓
🥇 Gold Delta Table
   /delta/gold/nielsen_summary
   500 rows — by market
        ↓
📊 Dashboards (BI Engineers)
🤖 ML Models (ML Engineers)
💼 Business Decisions
```

---

## ✅ Practical Pending

```
⏳ Run Day1_Read_Data notebook
   (AWS US-East-1 was down)
⏳ Write Bronze Delta table
⏳ Clean Silver Delta table
⏳ Aggregate Gold Delta table
⏳ Spark SQL — practical session
```

---

## 🎯 Top Interview Questions

```
1. What is Delta Lake?
2. What is ACID? Explain each letter.
3. What is Time Travel in Delta Lake?
4. Difference between CSV, Parquet, Delta?
5. What is Medallion Architecture?
6. What is Bronze, Silver, Gold layer?
7. Difference between overwrite and append?
8. Why Delta Lake instead of database?
9. What is _delta_log?
10. Why keep raw data in Bronze unchanged?
```

---

## 💡 Golden Rules

```
1. Delta Lake = Parquet + ACID + Time Travel
2. Bronze = never change raw data!
3. Silver = clean only, don't aggregate
4. Gold = aggregate for business use
5. Always save DataFrame to Delta Lake!
6. overwrite = replace, append = add
7. Time Travel = GitHub for data!
```

---
*"Delta Lake is the foundation of modern Data Engineering.
 Master this — master the pipeline!"* 💪
*— Paresh Ranjan Rout, 26 March 2026*
