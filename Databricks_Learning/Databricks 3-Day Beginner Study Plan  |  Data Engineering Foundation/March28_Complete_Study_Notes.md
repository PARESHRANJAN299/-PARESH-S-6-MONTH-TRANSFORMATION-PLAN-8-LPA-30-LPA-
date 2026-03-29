# 📓 Complete Study Notes — March 28, 2026
**By:** Paresh Ranjan Rout
**Day:** 18-Day Sprint — Day 1
**Topics:** Databricks Platform, Data Estate, Lakehouse, Governance

---

## 1. Databricks UI — Key Menu Items

```
MAIN MENU:
├── Workspace    → Your notebooks & files (PRIVATE!)
├── Catalog      → All databases & tables
├── Jobs & Pipelines → Workflows & automation
├── Compute      → Cluster management
└── Marketplace  → Datasets & tools

SQL SECTION:
├── SQL Editor   → Write SQL queries
├── Dashboards   → Visual reports
└── SQL Warehouses→ SQL compute

DATA ENGINEERING:
├── Runs         → Pipeline run history
└── Data Ingestion→ Import data
```

---

## 2. Workspace Privacy Rule

```
YOUR workspace = 100% PRIVATE! 🔒
/Users/paresh.r@datapoem.com/
→ Only YOU see this
→ Team CANNOT see your work
→ Practice freely! ✅

/Shared/ = PUBLIC (whole team sees)
→ Don't put practice work here!
```

---

## 3. Catalog Structure

```
CATALOG (Level 1) = city
    ↓
SCHEMA (Level 2) = neighbourhood
    ↓
TABLE/VOLUME (Level 3) = building

Example:
workspace (catalog)
    └── default (schema)
            ├── my_table (table)
            └── my_volume (volume)
```

---

## 4. Table vs Volume

```
TABLE                    VOLUME
─────                    ──────
Structured data          Raw files
Rows and columns         Any file type
Query with SQL           Just storage
Delta Lake format        CSV, Excel, JSON
Created by Spark         Upload manually
Like spreadsheet         Like a folder
```

---

## 5. Cluster Connection Rule

```
GOLDEN RULE:
Before running ANY code:
Step 1 → Open notebook
Step 2 → Connect cluster 🟢
Step 3 → Write and run code

Green dot = Connected = Ready! ✅
No cluster = Nothing runs! ❌
```

---

## 6. Data Estate Fragmentation

> **Fragmentation = data estate broken into many separate pieces/tools**

```
OLD WAY — 9 separate tools:
→ Governance tool
→ ETL tool
→ Data Lake
→ Data Science tool
→ Streaming tool
→ Data Warehouse
→ BI tool
→ ML platform
→ Gen AI platform

Problems:
❌ 9 different costs
❌ 9 different teams
❌ Nothing talks together
❌ Complexity nightmare!

DATABRICKS SOLUTION:
→ ONE platform for ALL 9! ✅
→ Lower cost ✅
→ Less complexity ✅
→ ONE format (Delta Lake) ✅
```

---

## 7. Data Warehouse vs Data Lake vs Lakehouse

> **ALL THREE = STORAGE! Just different quality and requirements.**

### Data Warehouse (Gen 1 storage)
```
→ Structured data ONLY
→ Clean before storing
→ Good for BI + Reports ✅
→ Cannot do ML ❌
→ Expensive storage 💸
→ Example: Snowflake, Redshift
```

### Data Lake (Gen 2 storage)
```
→ Stores EVERYTHING raw
→ Structured + unstructured
→ Good for ML ✅
→ Cannot do BI directly ❌
→ Cheap storage ✅
→ Becomes "Data Swamp" if messy! 😱
→ Example: AWS S3, Azure ADLS
```

### Lakehouse (Gen 3 storage) ⭐
```
→ Data Lake + Data Warehouse
→ Stores everything ✅
→ With quality and structure ✅
→ Good for BI + ML BOTH! ✅
→ Cheap + organized ✅
→ = DELTA LAKE! 🎯
→ Example: Databricks Delta Lake
```

### Simple Formula:
```
Data Lake + Data Warehouse = LAKEHOUSE ✅
Delta Lake = THE Lakehouse implementation! 🎯
```

---

## 8. Delta Lake = Lakehouse Format

```
Lakehouse  = the CONCEPT (idea)
Delta Lake = the IMPLEMENTATION (reality)

Like:
Smartphone = concept
iPhone     = implementation

Delta Lake works EVERYWHERE:
→ AWS S3 ✅
→. Azure ADLS ✅
→ MinIO (on-premise) ✅
→ Databricks ✅

Not locked to one platform! ✅
```

---

## 9. What is MinIO?

> **MinIO = Free open source version of Amazon S3 that runs on YOUR own server**

```
Amazon S3  = renting storage unit 🏪
             (Amazon owns it)

MinIO      = building YOUR OWN
             storage unit 🏠
             (you own it)

Same S3 API = same code works!
No cloud bill! ✅
Used by: Banks, Govt, Hospitals
         (data must stay on-premise)
```

---

## 10. On-Premise vs Cloud

```
ON-PREMISE (your server):
→ You buy physical server
→ Install software yourself
→ Data never leaves company
→ Full control ✅
→ Used by: Banks, Hospitals, Govt

CLOUD (AWS/Azure/GCP):
→ No server needed
→ Software pre-installed
→ Pay per use ✅
→ Scalable ✅
→ Used by: Most companies

HYBRID (both):
→ Some data on-premise
→ Some on cloud
→ Connected via network
→ Used by: Large enterprises
```

---

## 11. Data Journey Flow

```
Data Sources
    ↓
INGEST → bring raw data in (Bronze)
    ↓
TRANSFORM → clean + aggregate (Silver/Gold)
    ↓
QUERY → answer business questions
    ↓
VISUALIZE → BI dashboards (BI team)
    ↓
SERVE → deliver to external apps
    ↓
BUSINESS DECISIONS! 💼

All under: GOVERNANCE & SECURITY
```

---

## 12. Transform vs Query

```
TRANSFORM                    QUERY
─────────                    ─────
Background processing        Interactive exploration
Runs automatically           Runs on demand
Changes/saves data           Just reads data
Scheduled (Workflow)         Human asks question
Data Engineer builds         Analyst/Manager runs

Like:
Kitchen cooking food 🍳      Tasting food 👅
(background, automatic)      (you do yourself)
```

---

## 13. Data Engineer Role

```
Data Engineer (YOU!) builds:
✅ Ingest from multiple sources
✅ Combine different datasets
✅ EDA + cleaning (Silver)
✅ Aggregation (Gold)
✅ Automate with Workflow
✅ Monitor daily runs
✅ Manage entire pipeline

Then hands over to:
→ BI team = visualize (dashboards)
→ ML team = build models
→ Analysts = query and analyse
→ Business = make decisions

DE = Road builder 🏗️
Everyone else = Drivers 🚗
```

---

## 14. Azure vs Databricks

```
AZURE ALL-IN-ONE:
✅ Cheaper (one vendor)
✅ Simpler management
✅ Already Microsoft shop
❌ Still fragmented tools
❌ Azure locked only
❌ Not best Spark performance

DATABRICKS:
✅ Truly unified platform
✅ Cloud neutral (AWS+Azure+GCP)
✅ Best Spark performance
✅ Open source Delta Lake
❌ More expensive 💸
❌ Two bills (cloud + Databricks)

SMART COMPANIES:
→ Use BOTH together! ✅
→ ADF for simple ingestion
→ Databricks for heavy processing
→ Power BI for reporting
```

---

## 15. Serverless Compute

> **Serverless = Run code WITHOUT managing any server. Pay only when code runs!**

```
Traditional Cluster:
→ YOU create cluster (3-5 mins)
→ YOU manage everything
→ Pay even when idle 💸
→ Human error = wasted money

Serverless:
→ Just run code! ✅
→ Starts in SECONDS ⚡
→ Auto stops when done
→ Pay per second only ✅
→ Databricks manages all

WHY USE SERVERLESS:
✅ Efficiency (zero idle cost)
✅ Auto managed (no human needed)
✅ Faster startup (seconds!)

BUT:
→ More expensive per unit 💸
→ Traditional = cheaper IF
  used perfectly without waste!

BEST FOR:
→ SQL queries ✅
→ Short jobs ✅
→ Ad-hoc analysis ✅
→ Development/testing ✅
```

---

## 16. Data Governance

> **Governance = Rules controlling WHO sees WHAT data, HOW used, WHERE it goes**

### Key Elements:
```
Data Cataloging    → index of all data
Data Classification→ label confidential/public
Auditing & Access  → who accessed when
Data Discovery     → find data quickly
Data Sharing       → share safely
Data Lineage       → track data journey
Data Security      → lock data
Data Quality       → ensure correctness
```

### Governance Challenges (Old Way):
```
❌ Fragmented view of data
❌ Multiple access management tools
❌ Incomplete monitoring
❌ No cross-platform sharing
```

---

## 17. Unity Catalog

> **Unity Catalog = Databricks' ONE governance system for ALL assets. Like MDM + DLP combined for data.**

### 4 Pillars:
```
SECURITY 🔒
→ Access Control (who sees what)
→ Auditing (complete history)

COLLABORATION 🤝
→ Discovery (find data easily)
→ Secure Data Sharing

QUALITY ⭐
→ Lineage (track data journey)
→ Quality Monitoring

INSIGHTS 💡
→ Cost Controls
→ Business Semantics
```

### Governs ALL assets:
```
✅ Tables (Delta tables)
✅ Files (CSV, JSON)
✅ Notebooks (code)
✅ AI Models
✅ Dashboards
```

### Supported formats:
```
✅ Delta Lake (Databricks)
✅ Parquet (standard)
✅ Iceberg (Netflix/Apple)
```

---

## 18. Unity Catalog = MDM + DLP

```
MDM = data quality & consistency
DLP = prevent data loss/leakage

Unity Catalog combines BOTH:
✅ Row level security
✅ Column masking
✅ Data sharing controls
✅ Unauthorized access prevention
✅ GDPR, HIPAA compliance
✅ Complete audit trail

DataPOEM example:
→ Unilever team = Unilever tables only
→ MARS team = MARS tables only
→ Cross-client = BLOCKED ✅
= Same as your SharePoint work! 🎯
```

---

## 19. What is Iceberg?

```
Iceberg = Lakehouse format by Netflix + Apple
Delta Lake = Lakehouse format by Databricks

Both have:
✅ ACID transactions
✅ Time Travel
✅ Open source

Unity Catalog supports BOTH! ✅
Companies can choose either!
```

---

## 20. Today's Key Connections

```
YOUR ADF experience = Medallion Architecture ✅
YOUR SharePoint work = Unity Catalog concept ✅
YOUR permission management = Data Governance ✅

You already understand enterprise
concepts — just learning Databricks
implementation! 🏆
```

---

## 💡 Top Interview Questions from Today

```
1. What is Data Estate Fragmentation?
2. Difference between Data Warehouse,
   Data Lake, and Lakehouse?
3. What is Delta Lake? Why is it
   called Lakehouse format?
4. What is Serverless Compute?
   When to use vs Traditional?
5. What is Unity Catalog?
6. How is Unity Catalog similar to
   MDM and DLP?
7. What is Data Lineage?
8. What is Iceberg?
```

---

## 🎯 Golden Rules — Today

```
1. Fragmentation = broken into pieces
   Databricks = brings all together!

2. All 3 storages = store data
   Just different quality!

3. Lakehouse = Lake + Warehouse = Delta Lake

4. Delta Lake = works everywhere
   Not locked to Databricks!

5. Serverless = efficient + auto + fast
   But expensive per unit!

6. Unity Catalog = MDM + DLP for data
   ONE governance for everything!

7. DE = road builder
   Everyone else = drivers!
```

---
*"One platform. One format. One governance. That's Databricks!"* 💪
*— Paresh Ranjan Rout, March 28, 2026*
