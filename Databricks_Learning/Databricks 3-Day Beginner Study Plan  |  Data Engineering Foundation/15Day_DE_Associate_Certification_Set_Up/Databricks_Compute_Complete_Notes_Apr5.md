# 📓 Databricks Compute Page — Complete Deep Notes
**By:** Paresh Ranjan Rout
**Date:** April 5, 2026
**Topic:** All Compute Types Explained

---

## 🖥️ YOUR Current Compute Page

```
TWO clusters visible:

1. Engg share compute
   → Policy: Shared Compute
   → Runtime: 14.3 LTS
   → State: Terminated (circle icon)
   → Your company's shared cluster ✅

2. Paresh Ranjan Rout's Personal Com...
   → Policy: Personal Compute
   → Runtime: 18.1
   → State: Terminated
   → YOUR personal cluster ✅
```

---

## 📋 All Tabs Explained

---

## TAB 1 — All-Purpose Compute ✅
### (You are here!)

> **All-Purpose = Always-on clusters for interactive development work**

```
WHO USES:
→ Data Engineers developing pipelines
→ Data Scientists exploring data
→ Analysts writing SQL queries
→ YOU right now! ✅

KEY FEATURES:
→ Start manually
→ Stop manually
→ Multiple people can use same cluster
→ Connect notebook and run code
→ Always ready (when running)

COST:
→ Pay even when idle! 💸
→ Most expensive cluster type
→ Good for: development only

BEST FOR:
→ Learning ✅ (you!)
→ Interactive notebook work ✅
→ Team collaboration ✅
→ Data exploration ✅

YOUR CLUSTERS HERE:
→ Engg share compute (team) ✅
→ Your personal cluster ✅
```

---

## TAB 2 — Job Compute
### (Automated pipelines!)

> **Job Compute = clusters that AUTO-CREATE when job runs and AUTO-TERMINATE when job finishes**

```
WHO USES:
→ Automated scheduled pipelines
→ Production workflows
→ Nielsen daily pipeline!

KEY FEATURES:
→ Auto starts when job triggers ✅
→ Auto terminates after job ✅
→ One cluster per job only
→ Fresh cluster every run
→ No idle cost! ✅

COST:
→ Pay ONLY when job runs! ✅
→ 60-70% cheaper than All-Purpose!
→ Best for production!

BEST FOR:
→ Daily scheduled pipelines ✅
→ Nielsen data processing ✅
→ Automated workflows ✅
→ Production environments ✅
```

### ⚠️ WHY CAN'T YOU CREATE JOB CLUSTER DIRECTLY?

```
IMPORTANT CONCEPT! 🎯

Job Cluster CANNOT be created
standalone like All-Purpose!

WHY?
Job Cluster = CREATED BY A JOB!
Not by a human directly!

Process:
1. YOU create a Workflow/Job ✅
2. Inside Job = configure cluster
3. Job runs = cluster AUTO creates ✅
4. Job finishes = cluster AUTO deletes ✅

Job Cluster:
→ Belongs to a specific job
→ Lives only during job execution
→ Cannot exist without a job
→ Databricks creates it automatically

Like:
Freelancer (Job Cluster) =
hired FOR a project
Cannot hire without a project! 😄

All-Purpose Cluster:
= Permanent employee
= Always in office
= Create anytime! ✅

That's why Job Compute tab shows
HISTORY of past job clusters
NOT create button! 🎯
```

---

## TAB 3 — SQL Warehouses
### (SQL-only compute!)

> **SQL Warehouse = Dedicated compute ONLY for SQL queries. Optimized for BI and analytics!**

```
WHO USES:
→ BI Analysts running SQL ✅
→ Dashboard queries ✅
→ Power BI / Tableau connections ✅
→ SQL Editor in Databricks ✅

KEY FEATURES:
→ SQL ONLY (no Python/Scala) ✅
→ Serverless option available ✅
→ Auto scales instantly ✅
→ Optimized for SQL performance
→ Photon built-in! ✅

TYPES:
Classic SQL Warehouse:
→ YOUR AWS account machines
→ More control
→ Cheaper

Serverless SQL Warehouse:
→ Databricks manages
→ Instant startup (seconds!)
→ Pay per query
→ Zero management

COST:
→ Separate from compute clusters
→ Pay per DBU for SQL work
→ Serverless = most efficient

BEST FOR:
→ BI dashboards ✅
→ Business analyst SQL ✅
→ Power BI connections ✅
→ Ad-hoc SQL queries ✅

WHY SEPARATE FROM COMPUTE?
→ SQL needs different optimization
→ Photon always on for SQL
→ Different pricing model
→ Non-technical users
   don't need full cluster! ✅
```

---

## TAB 4 — Vector Search
### (AI/ML search!)

> **Vector Search = Databricks AI-powered similarity search for ML applications**

```
WHO USES:
→ ML Engineers ✅
→ AI application developers ✅
→ Recommendation systems ✅

WHAT IS IT?
Vector = mathematical representation
         of data (text, images, audio)

Example:
"Cat" = [0.2, 0.8, 0.1, 0.5...]
"Dog" = [0.3, 0.7, 0.2, 0.4...]
Similar words = similar vectors!

Vector Search finds:
→ Similar products ✅
→ Similar documents ✅
→ Related content ✅
→ Semantic search ✅

REAL EXAMPLE:
Netflix recommendation:
"You watched Action movies"
→ Find similar movies by vector!

Amazon "you might also like":
→ Vector similarity search! ✅

FOR YOUR LEARNING:
→ Not needed now ❌
→ Advanced ML topic
→ Learn after mastering DE basics
→ Future skill! ✅
```

---

## TAB 5 — Pools
### (Pre-warmed machines!)

> **Pools = Pre-started AWS machines waiting to be used. Cluster starts INSTANTLY!**

```
PROBLEM WITHOUT POOLS:
Cluster start = 3-5 minutes wait
Every new job = wait again! 😢

SOLUTION WITH POOLS:
Pool = machines already running
       and waiting! ✅

Cluster + Pool:
→ Cluster starts in 30 SECONDS! ⚡
→ Not 3-5 minutes!
→ Machines already warm!

HOW IT WORKS:
1. Admin creates Pool
   (e.g. 5 machines pre-started)

2. Engineer creates cluster
   with Pool attached

3. Cluster starts = instantly
   takes machines from Pool! ✅

4. When cluster terminates =
   machines return to Pool
   (not deleted!)

COST:
→ Pay for Pool machines 24/7 💸
→ But saves time!
→ Good for: frequent job runs

WHEN TO USE:
✅ Many jobs running frequently
✅ Teams need fast cluster start
✅ Production pipelines
✅ Time-sensitive workloads

NOT NEEDED:
❌ Occasional learning
❌ Small teams
❌ Cost-sensitive environments

YOUR COMPANY:
→ No pool currently
→ Small team
→ Not needed yet ✅
```

---

## TAB 6 — Policies
### (Admin control rules!)

> **Policies = Rules that RESTRICT what engineers can configure in clusters**

```
WHO CREATES POLICIES:
→ Databricks Admin only!
→ Your manager/IT admin ✅

WHAT POLICIES CONTROL:
→ Which instance types allowed
→ Maximum cluster size
→ Auto-termination = mandatory?
→ Allowed runtime versions
→ Cost limits per cluster
→ Who can create what type

YOUR POLICIES:
Personal Compute = your cluster policy
Shared Compute = team cluster policy

WHY POLICIES EXIST:
Without policies:
→ Engineer creates 100 core cluster
→ Forgets to stop it
→ $10,000 bill! 💸😱

With policies:
→ Max 4 cores allowed! ✅
→ Auto-terminate mandatory! ✅
→ Only approved instances! ✅
→ Cost controlled! 💰

REAL EXAMPLE:
Your company has:
"Personal Compute" policy:
→ Max i3.xlarge only
→ Single user only
→ Terminate after 30 mins
→ Cannot change runtime

= Company controls costs! ✅
= Engineers cannot overspend! ✅

FOR YOUR LEARNING:
→ You use existing policies ✅
→ Cannot create policies ❌
  (Admin only!)
→ Understand what they do ✅
```

---

## TAB 7 — Apps
### (Deployed applications!)

> **Apps = Deploy Python/Streamlit/Gradio apps directly inside Databricks!**

```
WHAT IS IT?
Instead of:
Build app → Deploy to separate server
= Complex! ❌

With Databricks Apps:
Build app → Deploy INSIDE Databricks
= Simple! ✅

SUPPORTED APPS:
→ Streamlit (Python dashboards)
→ Gradio (ML model demos)
→ Dash (interactive charts)
→ Custom Python web apps

EXAMPLE USE:
Data Engineer builds pipeline
+ 
Builds Streamlit dashboard
= Deploy both in Databricks! ✅

No separate server needed!
No AWS EC2 for app deployment!

FOR YOUR LEARNING:
→ Future skill ✅
→ After learning Python well
→ Very useful for portfolio! 🎯
→ Impress manager April 15!
```

---

## TAB 8 — Lakebase
### (NEW! Database inside Lakehouse!)

> **Lakebase = Databricks' new OLTP database. Combines operational database WITH Lakehouse!**

```
WHAT IS IT?
Traditional world:
→ Operational DB (MySQL) = for apps
→ Data Lake = for analytics
→ Two separate systems! ❌

Lakebase:
→ ONE system for BOTH! ✅
→ Run apps (OLTP) ✅
→ Run analytics ✅
→ Same data! ✅

VERY NEW FEATURE:
→ 2024-2025 release
→ Still evolving
→ Replaces need for MySQL/PostgreSQL!

EXAMPLE:
E-commerce app:
Orders table = operational (Lakebase)
Orders analytics = same table! ✅
No ETL needed between systems!

FOR YOUR LEARNING:
→ Very new concept ✅
→ Learn basics now
→ Deep dive later
→ Future of data platforms! 🔮
```

---

## 📊 Complete Comparison Table

```
TAB             USE CASE              WHO NEEDS
───             ────────              ─────────
All-Purpose     Interactive dev       DE, DS, Analyst
Job Compute     Automated pipelines   DE (production)
SQL Warehouse   SQL/BI queries        Analyst, BI team
Vector Search   AI similarity search  ML Engineers
Pools           Fast cluster start    Admin + DE
Policies        Cost control rules    Admin only
Apps            Deploy web apps       DE + Data Scientists
Lakebase        OLTP + Analytics      All roles (future)
```

---

## 💡 Why Job Cluster Cannot Be Created Directly

```
SIMPLE EXPLANATION:

Job Cluster = child of a Job/Workflow

Like:
Employee (Job Cluster) cannot exist
without a Company (Job/Workflow)!

Steps to use Job Cluster:
1. Go to Jobs & Pipelines ✅
2. Create new Workflow ✅
3. Add Task (notebook/script) ✅
4. Configure compute = Job Cluster ✅
5. Set schedule ✅
6. Job runs = cluster auto creates!
7. Job done = cluster auto deletes!

YOU cannot go to Compute page
and click "Create Job Cluster"!
It doesn't work that way! ✅

Job Compute tab = shows HISTORY only
= Past job clusters that ran
= Not for creating! 🎯
```

---

## 🎯 Interview Questions from Today

```
Q1: Difference between All-Purpose
    and Job Compute?
A: All-Purpose = always on, manual,
   for interactive work.
   Job Compute = auto create/delete,
   exists only during job run,
   much cheaper! ✅

Q2: Why can't you create Job cluster
    directly?
A: Job cluster belongs to a Job/Workflow.
   It's automatically created when job
   runs and deleted when done.
   Cannot exist without a job! ✅

Q3: What is SQL Warehouse?
A: Dedicated SQL-only compute with
   Photon built-in. Optimized for BI
   and analytics. Separate from
   notebook compute. ✅

Q4: What is a Pool?
A: Pre-warmed machines waiting to be
   assigned. Cluster starts in seconds
   instead of 3-5 minutes.
   Pay to keep machines warm 24/7. ✅

Q5: What are Policies?
A: Admin-created rules that restrict
   cluster configurations. Control costs,
   instance types, auto-termination.
   Prevents engineers from
   overspending! ✅

Q6: What is Lakebase?
A: Databricks new OLTP database that
   combines operational database with
   Lakehouse. One system for both
   apps and analytics! ✅
```

---

## 💡 Golden Rules — Today

```
1. All-Purpose = manual, always on,
   for development ✅
2. Job Compute = auto, belongs to job,
   cannot create standalone! ✅
3. SQL Warehouse = SQL only,
   Photon built-in ✅
4. Pools = pre-warmed machines,
   instant cluster start ✅
5. Policies = admin rules,
   cost control ✅
6. Apps = deploy Python apps
   inside Databricks ✅
7. Lakebase = OLTP + Analytics
   in one platform ✅
8. Job cluster = child of workflow,
   lives only during execution ✅
```

---
*"Understanding every option = confident engineer!"*
*— Paresh Ranjan Rout, April 5, 2026* 💪🔥
