# 🚀 18-Day Databricks Sprint Plan
**By:** Paresh Ranjan Rout
**Start:** March 27, 2026
**Deadline:** April 15, 2026
**Goal:** Impress manager + speak confidently with customers!

---

## 🎯 End Goal — April 15

```
By April 15 YOU WILL:
✅ Build complete Nielsen pipeline
✅ Explain architecture to manager
✅ Speak with customers about requirements
✅ Solve problems independently
✅ Present solutions confidently
✅ Work as junior DE on real project!
```

---

## 📅 WEEK 1 — Foundation Practical
### (March 27 - April 2)

---

### Day 1 — Friday March 28
**Theme: Run Everything from Day 1-3 Theory**

```
Morning (1 hour):
→ Open Databricks
→ Open Day1_Read_Data notebook
→ Run the Nielsen CSV read code
→ See df.show() output! (finally! 😄)
→ Screenshot result

Afternoon (1 hour):
→ Create ingest_bronze notebook
→ Run Bronze Delta write
→ Verify data saved

Evening (30 mins):
→ Push to GitHub
→ Document what you ran

Achievement:
✅ First real code output seen!
✅ Bronze Delta table created!
```

**Skill gained:** Reading real data + saving Delta

---

### Day 2 — Saturday March 29
**Theme: Silver Layer Hands-On**

```
Morning (1.5 hours):
→ Create clean_silver notebook
→ Run dropna() on Nielsen data
→ Run dropDuplicates()
→ Run filter() for invalid rows
→ See how many rows removed
→ Save Silver Delta table

Afternoon (1 hour):
→ Compare Bronze vs Silver:
   Bronze rows = ?
   Silver rows = ?
   Difference = ?
→ Understand what was cleaned

Evening (30 mins):
→ Push to GitHub
→ Write what you learned

Achievement:
✅ Silver Delta table created!
✅ Data cleaning hands-on done!
```

**Skill gained:** Data cleaning in PySpark

---

### Day 3 — Sunday March 30
**Theme: Gold Layer + Workflow**

```
Morning (1.5 hours):
→ Create aggregate_gold notebook
→ Run groupBy Market_Key
→ Calculate sum, avg, max, min
→ Save Gold Delta table
→ See final 500-row summary!

Afternoon (1.5 hours):
→ Create Databricks Workflow
→ Add 3 tasks:
   Task 1 = ingest_bronze
   Task 2 = clean_silver
   Task 3 = aggregate_gold
→ Run Workflow manually
→ See all 3 tasks GREEN! ✅

Evening (30 mins):
→ Screenshot all 3 Delta tables
→ Screenshot Workflow success
→ Push everything to GitHub!

Achievement:
✅ Complete pipeline running!
✅ First Workflow created!
✅ Portfolio project 1 DONE!
```

**Skill gained:** Gold aggregation + Workflow automation

---

## 📅 WEEK 2 — PySpark Deep Dive
### (March 31 - April 6)

---

### Day 4 — Monday March 31
**Theme: PySpark Read & Schema**

```
Learn + Practice:
→ spark.read options deep dive
→ Define schema manually (no inferSchema)
→ Read different file formats
→ printSchema() understanding
→ Apply on Nielsen data

Key functions:
→ StructType, StructField
→ IntegerType, DoubleType, StringType
→ spark.read.schema(schema)

Achievement:
✅ Can read any file format
✅ Can define schema manually
✅ No more slow inferSchema!
```

**Speak to manager about:**
"I optimized our data ingestion by
defining schema manually — 
2x faster than inferSchema!"

---

### Day 5 — Tuesday April 1
**Theme: PySpark Select & Filter**

```
Learn + Practice:
→ df.select() — choose columns
→ df.filter() — filter rows
→ df.where() — same as filter
→ df.col() — reference columns
→ Multiple conditions (&, |)

Apply on Nielsen:
→ Select only needed columns
→ Filter markets > 1000 sales
→ Filter specific time periods

Achievement:
✅ Can query data like SQL
✅ Select exactly what's needed
✅ Filter any condition!
```

**Speak to manager about:**
"I filtered Nielsen data to show
only high-value markets above
₹1000 sales threshold"

---

### Day 6 — Wednesday April 2
**Theme: PySpark withColumn & Rename**

```
Learn + Practice:
→ withColumn() — add/modify column
→ withColumnRenamed() — rename
→ cast() — fix data types
→ F.lit() — add constant column
→ F.when() — conditional column

Apply on Nielsen:
→ Rename $ to Sales
→ Add calculated column
→ Add date column
→ Fix all data types

Achievement:
✅ Can transform any column
✅ Can add business calculations
✅ Clean column names!
```

---

### Day 7 — Thursday April 3
**Theme: PySpark GroupBy & Aggregations**

```
Learn + Practice:
→ groupBy() deep dive
→ agg() with multiple functions
→ F.sum, avg, max, min, count
→ F.round() — clean decimals
→ Multiple groupBy columns

Apply on Nielsen:
→ Sales by Market + Period
→ Top 10 markets
→ Monthly trends
→ Product performance

Achievement:
✅ Can answer any business question
✅ Can build Gold layer confidently
✅ KPI calculations mastered!
```

**Speak to customer about:**
"I can show you total sales,
average price, and top performing
markets for any time period"

---

### Day 8 — Friday April 4
**Theme: PySpark Joins**

```
Learn + Practice:
→ Inner Join
→ Left Join
→ Right Join
→ When to use which join

Apply on Nielsen:
→ Join fact table with market ref
→ Join with product reference
→ Enrich data with descriptions

Achievement:
✅ Can combine multiple datasets
✅ Can enrich Nielsen with reference data
✅ Real DE skill mastered!
```

---

### Day 9 — Saturday April 5
**Theme: Spark SQL Practical**

```
Learn + Practice:
→ spark.sql() — run SQL in notebook
→ %sql magic command
→ createOrReplaceTempView()
→ SELECT, WHERE, GROUP BY
→ JOIN in SQL

Apply on Nielsen:
→ Create temp view of Silver
→ Run SQL queries
→ Compare SQL vs PySpark results

Achievement:
✅ Can write SQL on Delta tables
✅ Can use both PySpark and SQL
✅ Flexible for any requirement!
```

---

### Day 10 — Sunday April 6
**Theme: Delta Lake Advanced**

```
Learn + Practice:
→ DESCRIBE HISTORY — see versions
→ Time Travel — read old versions
→ OPTIMIZE — improve performance
→ VACUUM — clean old files
→ MERGE — upsert data

Apply on Nielsen:
→ Check Bronze history
→ Time travel to first version
→ Optimize Gold table

Achievement:
✅ Can maintain Delta tables
✅ Can recover from mistakes
✅ Production ready skills!
```

---

## 📅 WEEK 3 — Real Project + Communication
### (April 7 - April 13)

---

### Day 11 — Monday April 7
**Theme: Build Analysis Notebook**

```
Create Notebook 4: nielsen_analysis

Answer business questions:
→ Top 10 markets by total sales
→ Which period had highest sales?
→ Average unit price by market
→ Products with zero promo sales
→ Markets with highest growth

Achievement:
✅ Can answer real business questions
✅ Analyst + Engineer skills combined!
```

**Speak to customer about:**
"I can analyze which markets
are performing best and identify
growth opportunities in your data"

---

### Day 12 — Tuesday April 8
**Theme: Auto Loader Basics**

```
Learn + Practice:
→ What is Auto Loader
→ spark.readStream.format("cloudFiles")
→ How it monitors new files
→ Why better than manual ingestion

Apply:
→ Set up Auto Loader for Nielsen
→ Simulate new file arriving
→ See automatic ingestion!

Achievement:
✅ Can handle incremental data
✅ Real production pattern known!
✅ CDC concept in Databricks!
```

---

### Day 13 — Wednesday April 9
**Theme: Error Handling + Logging**

```
Learn + Practice:
→ try/except in Python
→ Logging in notebooks
→ Handle missing files gracefully
→ Send alerts on failure
→ Data quality checks

Apply on pipeline:
→ Add error handling to all 3 notebooks
→ Add data quality checks
→ Log row counts at each step

Achievement:
✅ Production grade pipeline!
✅ Can handle real world issues!
```

---

### Day 14 — Thursday April 10
**Theme: Documentation + README**

```
Create:
→ README.md for your project
→ Architecture diagram
→ Data dictionary
→ Pipeline flow documentation
→ How to run guide

Push everything to GitHub:
→ All 4 notebooks
→ README
→ Screenshots
→ Architecture notes

Achievement:
✅ Professional documentation!
✅ Manager can understand project!
✅ GitHub portfolio complete!
```

---

### Day 15 — Friday April 11
**Theme: Communication Practice**

```
Practice explaining:

1. Architecture explanation:
"I built a Medallion Architecture
pipeline with Bronze, Silver, Gold
layers using Delta Lake on Databricks"

2. Technical problem solving:
"When data had nulls and duplicates
I used dropna() and dropDuplicates()
in the Silver cleaning layer"

3. Business value:
"The Gold layer gives you market
level summaries updated daily
automatically via Workflow"

Practice out loud 10 times each!

Achievement:
✅ Can explain to manager clearly
✅ Can explain to customer simply
✅ Confidence built!
```

---

### Day 16 — Saturday April 12
**Theme: Mock Manager Meeting**

```
Pretend you're in meeting:

Manager asks → YOU answer:

Q: "What did you build?"
A: Explain full pipeline

Q: "Why Delta Lake not CSV?"
A: ACID, Time Travel, performance

Q: "How does Workflow work?"
A: Automation, dependencies, schedule

Q: "What if data has errors?"
A: Silver layer handles this

Q: "How long does pipeline run?"
A: X minutes, automated daily

Practice until smooth! ✅

Achievement:
✅ Manager meeting ready!
✅ Technical questions handled!
```

---

### Day 17 — Sunday April 13
**Theme: Mock Customer Meeting**

```
Customer = non-technical person

Practice:

Q: "Can you show our sales data?"
A: "Yes! I built a system that
    automatically processes your
    Nielsen data daily. You can
    see total sales by market,
    top products, and monthly trends"

Q: "What if wrong data comes?"
A: "Our system automatically
    removes invalid data in the
    cleaning step and only shows
    verified numbers"

Q: "Can we go back to old data?"
A: "Yes! Delta Lake keeps full
    history — we can show you
    data from any date"

Practice simple, clear answers!

Achievement:
✅ Customer communication ready!
✅ Non-technical explanation mastered!
```

---

### Day 18 — Monday April 14
**Theme: Final Polish + Rehearsal**

```
Morning:
→ Run complete pipeline end to end
→ Fix any remaining issues
→ Final GitHub push
→ Check all notebooks work

Afternoon:
→ Final rehearsal
→ Explain pipeline to yourself
→ Record yourself speaking (phone)
→ Listen back and improve

Evening:
→ Prepare for tomorrow
→ Open your pipeline
→ Know every line of code
→ Sleep early! 😴

Achievement:
✅ 100% ready for April 15!
✅ Pipeline running perfectly!
✅ Communication confident!
```

---

## 🎯 April 15 — Manager Meeting!

```
Walk in with:
✅ Pipeline running in Databricks
✅ All 3 Delta tables populated
✅ Workflow scheduled
✅ GitHub documentation
✅ Business insights ready
✅ Confident explanation prepared

Say:
"I built a complete data pipeline
on our Nielsen data using Databricks
Medallion Architecture. Bronze layer
ingests raw data, Silver cleans it,
Gold aggregates by market for
business insights. Automated with
Workflow running daily.

I can show you top markets,
sales trends, and product performance.
All data is in Delta Lake with
full history and automatic updates."

Manager thinks:
"This fresher is READY!" 🏆
```

---

## 📊 Skills You Will Have by April 15

```
Technical Skills:
✅ PySpark read/write/transform
✅ Delta Lake operations
✅ Medallion Architecture
✅ Databricks Workflow
✅ Data cleaning (Silver)
✅ Data aggregation (Gold)
✅ Spark SQL basics
✅ Auto Loader basics
✅ Error handling
✅ Documentation

Communication Skills:
✅ Explain architecture to manager
✅ Explain pipeline to customer
✅ Discuss requirements clearly
✅ Present solutions confidently
✅ Handle technical questions
✅ Simplify complex concepts
```

---

## 💡 Daily Routine — Every Day

```
Before studying:
→ Review yesterday's notes (10 mins)

While studying:
→ Learn concept
→ Practice in Databricks
→ Write notes

After studying:
→ Push to GitHub
→ Write 3 things learned today

Before sleep:
→ Read today's notes out loud
→ Think about tomorrow's topic
```

---

## 🔥 Motivation Corner

```
April 15 = Manager opportunity
September = 29th birthday
Family = girlfriend, father, mother

Every day you study:
→ One step closer to promise
→ One step closer to 30 LPA
→ One step closer to their smiles

180 days started.
18 days sprint begins NOW! 💪
```

---
*"Promise made. Plan ready. Execution starts NOW!"*
*— Paresh Ranjan Rout, March 27, 2026* 🔥
