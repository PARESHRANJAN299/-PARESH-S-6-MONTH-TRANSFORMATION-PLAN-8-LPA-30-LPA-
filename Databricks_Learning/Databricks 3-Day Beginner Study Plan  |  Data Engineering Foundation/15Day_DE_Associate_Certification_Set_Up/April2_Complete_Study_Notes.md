# 📓 Study Notes — April 2, 2026
**By:** Paresh Ranjan Rout
**Source:** O'Reilly DE Associate Course + Deep Discussion

---

## 1. Why Bronze Layer Exists

> **Bronze = Safety net. Store raw data once. Reprocess anytime.**

```
Without Bronze:
→ Source system overloaded ❌
→ Pipeline fails = data lost forever ❌
→ No audit trail ❌
→ Multiple teams hit source ❌

With Bronze:
→ Copy once from source ✅
→ Reprocess anytime ✅
→ Compliance audit ready ✅
→ Multiple teams use same copy ✅

Cost concern:
→ Parquet = 10x compressed
→ 43 MB = ~4 MB stored
→ Storage cost = nearly zero!
→ Risk of no Bronze = crores! ✅
```

---

## 2. What is Metadata

> **Metadata = Information ABOUT data. Helps understand data without reading actual data.**

```
Examples:
Phone photo:
→ Photo = DATA
→ Date, location, size = METADATA

Nielsen file:
→ Sales numbers = DATA
→ File name, received date,
  row count, column types = METADATA

Delta Lake _delta_log = METADATA!
Unity Catalog = Metadata manager!

Bronze stores:
→ Raw data + metadata about
  when/how data arrived ✅
```

---

## 3. Silver Layer — "Just Enough" Cleaning

```
Silver = 70-80% cleaned
→ Remove nulls ✅
→ Remove duplicates ✅
→ Fix data types ✅
→ Basic validation ✅

NOT 100% like Data Warehouse!
Still row-level data!
Not aggregated!

Remaining 20-30% → Gold layer!
```

---

## 4. Gold Layer — Final 20-30%

```
Gold = 95-100% complete
→ GroupBy business dimensions ✅
→ Calculate KPIs ✅
→ Aggregated summaries ✅
→ Dashboard ready ✅
→ BI + ML consume this ✅

Silver = detail rows
Gold   = summarized business data
```

---

## 5. Databricks Architecture — Old vs New

### Old Architecture (1 plane):
```
Administration (everything mixed):
→ Web Application
→ Compute Orchestration
→ Unity Catalog
→ Queries and Code

Compute → Storage
= All in ONE place ❌
= Less secure ❌
```

### New Architecture 2024 (3 planes):
```
PLANE 1: Control Plane (Databricks)
→ UI, notebooks, workspace
→ Databricks owns and manages
→ NOT your data!

PLANE 2: Classic Compute Plane (YOUR AWS)
→ YOUR machines (EC2)
→ YOUR storage (S3)
→ YOUR AWS account
→ Databricks NEVER sees your data! ✅

PLANE 3: Serverless Compute Plane (Databricks)
→ Databricks manages machines
→ Instant startup ⚡
→ Pay per second
→ Databricks AWS account
```

---

## 6. Classic Compute = YOUR AWS!

> **OFFICIAL Databricks Documentation:**
> **"For classic Databricks compute, the compute resources are in YOUR AWS account"**

```
Engg share compute:
→ YOUR company's AWS machines ✅
→ AWS US-East-1 ✅
→ i4i.large EC2 instances ✅
→ YOUR company pays AWS bill ✅

PROOF:
When AWS US-East-1 went DOWN →
Your cluster stopped! ✅
= Machines are on AWS! 🎯
```

---

## 7. Serverless vs Classic — Who Owns?

```
CLASSIC COMPUTE:
Hardware  = AWS (YOUR account) ✅
Software  = Databricks ✅
Management = YOU ✅
Data      = YOUR cloud ✅

SERVERLESS:
Hardware  = AWS (Databricks account)
Software  = Databricks ✅
Management = Databricks ✅
You just run code! ✅
```

---

## 8. Community Edition — Free Machines

```
Databricks Community Edition:
→ Databricks pays AWS machines
→ From their OWN AWS account
→ Marketing expense
→ Purpose: get developers hooked
→ Later buy enterprise! 😄

Business model:
Free → learn → love →
recommend to company →
company buys enterprise! 💰
```

---

## 9. Why Pay Databricks If We Have AWS?

```
AWS alone gives:
→ Empty machines only ❌
→ No Spark ❌
→ No notebooks ❌
→ No Delta Lake ❌
→ No Unity Catalog ❌
→ No Workflows ❌
→ YOU manage everything ❌

Databricks adds:
→ Complete platform ✅
→ All tools ready ✅
→ No DevOps needed ✅
→ Data Engineers focus on DATA ✅

Value delivered > cost paid! ✅
```

---

## 10. Databricks Architecture Evolution

```
2013 → Basic Spark platform
2016 → Old architecture (1 plane)
2019 → Delta Lake added
2020 → Unity Catalog
2022 → New 3-plane architecture
2024 → Serverless + DLT + AI
2026 → Still evolving! 🚀

Old = foundation
New = foundation + lessons learned
      + new features + better security

Technology always evolves!
```

---

## 11. O'Reilly Course Progress

```
✅ Lesson 1.1: Medallion Architecture
✅ Lesson 1.2: Databricks Platform
🔄 Lesson 1.3: Databricks Cluster (next)
⬜ Lesson 1.4: Notebook and DevOps
⬜ Practice Quiz

Progress: 23% complete
```

---

## 💡 Key Points to Remember

```
1. Bronze = store once, protect source
2. Metadata = info about data, everywhere
3. Silver = just enough (70-80%) cleaning
4. Gold = final 20-30% aggregation
5. Classic Compute = YOUR AWS machines
6. Serverless = Databricks AWS machines
7. Control Plane = Databricks manages UI
8. New architecture = 3 planes, more secure
9. AWS goes down = cluster stops = proof!
10. Databricks = software only, no hardware
```

---

## 🎯 Interview Questions from Today

```
Q: Why do we need Bronze layer?
A: Source protection, disaster recovery,
   preserve raw data, audit compliance,
   multiple teams use same copy!

Q: What is Metadata?
A: Information about data —
   file name, row count, column types,
   received date. Everywhere! ✅

Q: What is Classic Compute Plane?
A: YOUR company's AWS account machines.
   Databricks manages software only.
   YOUR data never leaves your cloud!

Q: Difference Classic vs Serverless?
A: Classic = your AWS machines, you manage
   Serverless = Databricks manages,
   instant start, pay per second
```

---
*"Question everything. Verify from documentation. That's engineering!"*
*— Paresh Ranjan Rout, April 2, 2026* 💪🔥
