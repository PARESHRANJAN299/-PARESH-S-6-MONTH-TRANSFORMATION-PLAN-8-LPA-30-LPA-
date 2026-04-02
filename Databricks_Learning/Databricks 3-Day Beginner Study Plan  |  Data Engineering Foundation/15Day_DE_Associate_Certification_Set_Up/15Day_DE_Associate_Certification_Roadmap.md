# 🎯 15-Day Databricks DE Associate Certification Roadmap
**By:** Paresh Ranjan Rout
**Start:** April 1, 2026
**Target:** April 15, 2026
**Goal:** Databricks Certified Data Engineer Associate 🏆

---

## 📋 Exam Overview

```
Exam Name:  Databricks Certified Data Engineer Associate
Format:     45 questions, Multiple Choice
Time:       90 minutes
Pass Score: 70% (32/45 correct)
Cost:       $200 USD
Platform:   Webassessor (online proctored)

5 Domains:
Domain 1: Databricks Lakehouse Platform (24%)
Domain 2: ELT with Apache Spark (29%)
Domain 3: Incremental Data Processing (22%)
Domain 4: Production Pipelines (16%)
Domain 5: Data Governance (9%)
```

---

## 🗓️ 15-Day Study Plan

---

### DAY 1 — April 1
**Domain 1: Databricks Lakehouse Platform**
**Theme: Solidify what you already know**

```
Study (2 hours):
→ Watch O'Reilly Module 1 (48 mins)
→ Lakehouse architecture deep dive
→ Cluster types (All-Purpose vs Job)
→ Databricks Runtime versions
→ Repos and Git integration

Assignment:
1. Draw Lakehouse architecture from memory
2. List 5 differences: All-Purpose vs Job cluster
3. Answer: Why is Lakehouse better than
   Data Warehouse + Data Lake separately?

Self Test:
→ Explain Lakehouse to yourself
   without looking at notes
→ Score yourself 1-10
```

---

### DAY 2 — April 2
**Domain 1 continued: Cluster & Workspace Deep Dive**
**Theme: Know every cluster option**

```
Study (2 hours):
→ Cluster configuration options
→ Autoscaling min/max settings
→ Spot instances vs On-demand
→ Cluster policies
→ Access modes (Single User, Shared, No Isolation)
→ Databricks File System (DBFS) deep dive
→ Unity Catalog structure (Catalog > Schema > Table)

Assignment:
1. Create cluster in Databricks with correct settings
2. Explore DBFS path structure
3. Answer: What access mode should
   you use for production pipelines?
4. Draw Unity Catalog 3-level hierarchy

Self Test:
→ 10 quick questions on clusters
→ Explain DBFS vs Volumes difference
```

---

### DAY 3 — April 3
**Domain 2: ELT with Apache Spark — Part 1**
**Theme: Reading and writing data**

```
Study (2 hours):
→ Watch O'Reilly Module 2 (48 mins)
→ spark.read options deep dive
→ Reading: CSV, JSON, Parquet, Delta
→ Writing: overwrite, append, merge
→ Schema definition vs inferSchema
→ SparkSQL vs DataFrame API

Assignment:
1. Read Titanic CSV with manual schema
   (no inferSchema!)
2. Write as Delta table
3. Read back and verify row count
4. Answer: When would you use
   DataFrame API vs SQL?

Notebook: Day3_ELT_Reading_Writing
```

---

### DAY 4 — April 4
**Domain 2: ELT with Apache Spark — Part 2**
**Theme: Transformations deep dive**

```
Study (2 hours):
→ All transformation functions:
   select, filter, where, groupBy
   orderBy, join, union, withColumn
   withColumnRenamed, drop, distinct
→ Built-in functions: F.sum, F.avg,
   F.max, F.min, F.count, F.round
   F.when, F.col, F.lit, F.concat
→ String functions: upper, lower, trim
→ Date functions: to_date, date_format
→ Window functions basics

Assignment:
1. On Titanic data:
   → Filter survivors only
   → GroupBy class + calculate
     survival rate
   → Add age_group column
     (child/adult/senior)
   → Find top 3 most common names
2. Answer: What is the difference
   between union() and unionAll()?

Notebook: Day4_Transformations
```

---

### DAY 5 — April 5
**Domain 2: ELT — SQL & Advanced**
**Theme: Spark SQL mastery**

```
Study (2 hours):
→ CREATE TABLE / VIEW / TEMP VIEW
→ CTAS (Create Table As Select)
→ INSERT INTO, INSERT OVERWRITE
→ MERGE INTO (upsert) ← EXAM FAVORITE!
→ Delta Lake SQL commands:
   DESCRIBE HISTORY
   RESTORE TABLE
   OPTIMIZE
   VACUUM
→ Array and Map functions
→ Higher-order functions (transform, filter)

Assignment:
1. Create temp view of Titanic Silver
2. Write SQL to find survival rate
   by gender and class
3. Practice MERGE INTO:
   → Create updates table
   → MERGE into Silver table
4. Run DESCRIBE HISTORY
5. Answer: What is difference between
   INSERT INTO and INSERT OVERWRITE?

Notebook: Day5_SparkSQL
```

---

### DAY 6 — April 6
**Domain 3: Incremental Data Processing — Part 1**
**Theme: Delta Lake internals**

```
Study (2 hours):
→ Watch O'Reilly Module 3 (48 mins)
→ Delta Lake transaction log (_delta_log)
→ ACID transactions deep dive
→ Time Travel (versionAsOf, timestampAsOf)
→ Schema Evolution vs Schema Enforcement
→ Data Skipping and Z-Ordering
→ OPTIMIZE command
→ VACUUM command + retention

Assignment:
1. Write to Delta table 3 times
   (overwrite, append, merge)
2. Run DESCRIBE HISTORY
3. Time travel to version 0
4. Run OPTIMIZE on your table
5. Run VACUUM RETAIN 168 HOURS
6. Answer: What happens if you run
   VACUUM with 0 hours retention?

Notebook: Day6_DeltaLake_Internals
```

---

### DAY 7 — April 7
**Domain 3: Incremental Data Processing — Part 2**
**Theme: Auto Loader + Structured Streaming**

```
Study (2 hours):
→ Auto Loader deep dive
   (cloudFiles format)
→ Auto Loader vs COPY INTO
→ Structured Streaming basics
→ readStream vs read
→ writeStream vs write
→ Checkpointing
→ Trigger options
   (Once, AvailableNow, Continuous)
→ Output modes
   (append, complete, update)

Assignment:
1. Set up Auto Loader to watch folder
2. Upload new file and see auto-ingestion
3. Answer these:
   → When to use Auto Loader vs COPY INTO?
   → What is a checkpoint in streaming?
   → What is Trigger.AvailableNow?
4. Draw: batch vs streaming flow

Notebook: Day7_AutoLoader_Streaming
```

---

### DAY 8 — April 8
**Domain 3: DLT — Delta Live Tables**
**Theme: Declarative pipelines**

```
Study (2 hours):
→ DLT architecture
→ @dlt.table decorator
→ @dlt.view decorator
→ Streaming tables vs Materialized views
→ DLT expectations (data quality)
→ DLT pipeline modes
   (Development vs Production)
→ DLT monitoring dashboard
→ DLT vs manual Workflow

Assignment:
1. Create simple DLT pipeline:
   → Bronze: raw Titanic data
   → Silver: cleaned with expectations
   → Gold: aggregated by class
2. Add data quality expectations:
   → age > 0
   → survived IN (0,1)
3. Answer: What is @dlt.expect?
   What happens when expectation fails?

Notebook: Day8_DLT_Pipeline
```

---

### DAY 9 — April 9
**Domain 4: Production Pipelines**
**Theme: Jobs and Workflows**

```
Study (2 hours):
→ Watch O'Reilly Module 4 (28 mins)
→ Job clusters vs All-Purpose clusters
→ Task types:
   Notebook, Python Script, JAR,
   SQL, DLT Pipeline, dbt
→ Task dependencies
→ Job parameters
→ Retry policies
→ Email alerts
→ Job scheduling (cron syntax)
→ Multi-task workflows

Assignment:
1. Create 3-task workflow:
   Task 1: ingest_bronze
   Task 2: clean_silver (depends on 1)
   Task 3: aggregate_gold (depends on 2)
2. Add email alert on failure
3. Set retry = 2 attempts
4. Answer: What is cron syntax
   for "every day at 6 AM"?
   Answer: 0 6 * * *

Notebook: Day9_Production_Workflows
```

---

### DAY 10 — April 10
**Domain 5: Data Governance**
**Theme: Unity Catalog mastery**

```
Study (2 hours):
→ Watch O'Reilly Module 5 (33 mins)
→ Unity Catalog 3-level namespace
   catalog.schema.table
→ Privileges: SELECT, MODIFY,
   CREATE, ALL PRIVILEGES
→ GRANT and REVOKE syntax
→ Row filters
→ Column masks
→ Data lineage
→ Audit logs
→ Delta Sharing

Assignment:
1. Create catalog and schema
2. GRANT SELECT to a user
3. REVOKE access
4. Answer:
   → What is minimum privilege principle?
   → Difference: MODIFY vs ALL PRIVILEGES?
   → What is Delta Sharing?

Notebook: Day10_Unity_Catalog
```

---

### DAY 11 — April 11
**REVISION DAY — Domain 1 + 2**
**Theme: Fill gaps and strengthen weak areas**

```
Morning (1 hour): Domain 1 revision
→ Re-read Day 1 + 2 notes
→ Answer 10 practice questions
→ Fix any gaps found

Afternoon (1 hour): Domain 2 revision
→ Re-read Day 3 + 4 + 5 notes
→ Practice writing PySpark from memory
→ No copy paste — write yourself!

Assignment:
1. Without notes — answer:
   → 5 cluster questions
   → 5 transformation questions
   → 5 SQL questions
2. Find your weakest topic
3. Re-study that topic tonight

Self Score Target: 8/10 minimum
```

---

### DAY 12 — April 12
**REVISION DAY — Domain 3 + 4 + 5**
**Theme: Incremental + Pipelines + Governance**

```
Morning (1 hour): Domain 3 revision
→ Delta Lake internals quiz
→ Auto Loader vs COPY INTO
→ DLT expectations

Afternoon (1 hour): Domain 4 + 5
→ Workflow creation quiz
→ Unity Catalog privileges
→ GRANT/REVOKE syntax

Assignment:
1. Write from memory:
   → MERGE INTO syntax
   → Auto Loader code
   → DLT table definition
   → GRANT syntax
2. Explain each to yourself
   in simple words
3. Score yourself honestly
```

---

### DAY 13 — April 13
**MOCK EXAM DAY 1**
**Theme: Simulate real exam conditions**

```
Mock Exam Rules:
→ 45 questions
→ 90 minutes ONLY
→ No notes, no Google
→ Alone and quiet

After Mock Exam:
→ Check answers
→ Find wrong answers
→ Study those topics again
→ Note which domain was weakest

Target Score: 70%+ (32/45)

Resources for mock exam:
→ O'Reilly Final Quiz
→ Databricks practice questions
→ Udemy practice tests
```

---

### DAY 14 — April 14
**WEAK AREAS + MOCK EXAM DAY 2**
**Theme: Fix gaps and final practice**

```
Morning (1 hour):
→ Study topics you got wrong
  in Day 13 mock exam
→ Focus on weakest domain only

Afternoon (1 hour):
→ Second mock exam
→ 45 questions, 90 minutes
→ Target: 75%+ this time

Evening (30 mins):
→ Final notes review
→ Key commands memorization:
   OPTIMIZE, VACUUM, RESTORE
   DESCRIBE HISTORY
   MERGE INTO syntax
   Auto Loader syntax
   DLT decorator syntax
   GRANT/REVOKE syntax
```

---

### DAY 15 — April 15
**EXAM DAY! 🎯**
**Theme: Confidence + Manager Meeting**

```
Morning:
→ Light revision only (30 mins)
→ No new topics!
→ Review key commands
→ Eat well, sleep well

Before Exam:
→ Read each question carefully
→ Eliminate wrong answers first
→ Trust your preparation!

After Exam:
→ Manager meeting! 🎯
→ Show pipeline
→ Show certificates
→ Speak confidently!
```

---

## 📊 Domain Weightage Study Time

```
Domain 1: Lakehouse Platform (24%)
→ Day 1 + 2 = 4 hours

Domain 2: ELT with Spark (29%) ← Most important!
→ Day 3 + 4 + 5 = 6 hours

Domain 3: Incremental Processing (22%)
→ Day 6 + 7 + 8 = 6 hours

Domain 4: Production Pipelines (16%)
→ Day 9 = 2 hours

Domain 5: Data Governance (9%)
→ Day 10 = 2 hours

Revision + Mock: Day 11-14 = 8 hours
Total study time = ~28 hours ✅
```

---

## 🔑 Most Important Topics for Exam

```
DEFINITELY IN EXAM:
✅ MERGE INTO syntax
✅ Auto Loader vs COPY INTO
✅ Delta Lake Time Travel
✅ OPTIMIZE + VACUUM
✅ DLT expectations (@dlt.expect)
✅ Unity Catalog GRANT/REVOKE
✅ Cluster types comparison
✅ Streaming trigger options
✅ Job cluster vs All-Purpose
✅ _delta_log purpose
```

---

## 📝 Daily Assignment Template

```
Every day after studying:

1. EXPLAIN: Can I explain this topic
   to someone without notes? (Y/N)

2. CODE: Can I write the code
   from memory? (Y/N)

3. EXAMPLE: Can I give a real
   business example? (Y/N)

4. GAP: What is still unclear?
   → Study that tonight!

5. GITHUB: Push notebook to GitHub ✅
```

---

## 💡 Exam Tips

```
1. Read CAREFULLY — "which is CORRECT"
   vs "which is INCORRECT" — tricky!

2. Eliminate obvious wrong answers first

3. MERGE INTO questions = always read
   the ON condition carefully

4. Auto Loader questions = check if
   they ask about cloudFiles format

5. Time Travel = remember both:
   VERSION AS OF and TIMESTAMP AS OF

6. DLT = know difference between
   @dlt.table and @dlt.view

7. Unity Catalog = always 3 levels:
   catalog.schema.table
```

---

## 🏆 After Certification

```
Add to LinkedIn:
"Databricks Certified Data Engineer
 Associate — April 2026"

Add to Resume:
Certifications:
→ Databricks Fundamentals (March 2026)
→ Databricks DE Associate (April 2026)

Salary target unlocked:
→ 15-20 LPA range! 💰
```

---
*"15 days of focused study = lifetime of career impact!"*
*— Paresh Ranjan Rout, April 1, 2026* 🔥💪
