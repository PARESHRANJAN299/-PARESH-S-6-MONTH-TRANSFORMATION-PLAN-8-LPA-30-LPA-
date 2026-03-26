# 🎯 Day 3 — Interview Questions & Answers
**By:** Paresh Ranjan Rout
**Topic:** Silver Layer, Gold Layer, Workflow, Pipeline

---

## 1. Silver Layer Questions

**Q: What is the Silver layer in Medallion Architecture?**
> Silver is the second layer where Bronze raw data is cleaned. It removes nulls, duplicates, invalid rows, fixes data types, and renames messy columns. Silver has only valid, clean data — fewer rows than Bronze.

**Q: What PySpark functions do you use for data cleaning?**
> dropna() for nulls, dropDuplicates() for duplicates, filter() for invalid rows, withColumnRenamed() for column names, withColumn() + cast() for data types, fillna() for filling null values.

**Q: What is the difference between dropna() and fillna()?**
> dropna() removes entire rows that have null values — row is deleted. fillna() keeps the row but fills null with a default value like 0 or "Unknown". Use dropna() when null rows are invalid. Use fillna() when null can be replaced with a default.

**Q: Why does Silver always have fewer rows than Bronze?**
> Because Silver removes invalid rows — nulls, duplicates, negative values, wrong formats. Bronze has ALL raw rows including bad ones. Silver keeps only valid rows. Bronze rows > Silver rows always!

**Q: How is Silver layer related to EDA?**
> EDA (Exploratory Data Analysis) finds problems in data. Silver layer does EDA + fixing. EDA = find problems. Silver = find AND fix problems using PySpark functions. Silver is EDA logic implemented in code!

---

## 2. Gold Layer Questions

**Q: What is the Gold layer?**
> Gold is the third layer containing aggregated, business-ready data from Silver. It uses GroupBy and aggregation functions (sum, avg, max, min, count) to summarize detailed rows into business KPIs. BI Engineers and ML Engineers consume Gold.

**Q: What PySpark functions do you use for aggregation?**
> groupBy() to group data, agg() to aggregate, F.sum() for totals, F.avg() for averages, F.max() for highest, F.min() for lowest, F.count() for record counts, F.round() to clean decimals.

**Q: Why does Gold have fewer rows than Silver?**
> Because Gold aggregates/summarizes Silver. Silver has 3,40,000 detailed rows. Gold groups by market = 500 rows. Summarization reduces rows dramatically. Silver rows > Gold rows always!

**Q: Who uses Bronze, Silver, and Gold layers?**
> Bronze = Data Engineers only (raw safety net). Silver = Data Engineers only (cleaning). Gold = ML Engineers, BI Engineers, Business teams (reporting and analysis).

**Q: What is the difference between Silver and Gold?**
> Silver = cleaned detailed data (row level). Gold = aggregated summary data (grouped level). Silver fixes quality issues. Gold answers business questions like total sales per market, average price per product.

---

## 3. Databricks Workflow Questions

**Q: What is Databricks Workflow?**
> Databricks Workflow is an intelligent automation system that runs notebooks automatically at scheduled times without human intervention. Like an alarm clock for pipelines — set once, runs forever. Even on holidays and while engineers sleep!

**Q: Why do we need Workflow instead of running manually?**
> Manual running = human can forget, go on leave, miss timing. Workflow = runs automatically every day at exact time, no dependency on human, consistent results, alerts on failure. No productivity loss!

**Q: What are task dependencies in Workflow?**
> Task dependencies define the order of execution. Task 2 runs ONLY after Task 1 succeeds. Task 3 runs ONLY after Task 2 succeeds. If Task 1 fails — Task 2 and 3 don't run. Prevents wrong/incomplete data in downstream layers.

**Q: What happens if Task 1 fails in a Workflow?**
> Task 2 and Task 3 automatically stop — they don't run. Engineer receives an alert/email. This prevents bad Bronze data from flowing to Silver and Gold. Data quality is protected automatically!

**Q: How is Databricks Workflow different from Apache Airflow?**
> Both are pipeline schedulers. Databricks Workflow is built INTO Databricks — no separate setup needed, works directly with notebooks and clusters. Airflow is separate tool requiring own setup and infrastructure. For Databricks pipelines, Workflow is simpler and faster to use.

---

## 4. End-to-End Pipeline Questions

**Q: Explain your end-to-end Databricks pipeline.**
> Source CSV → Notebook 1 reads and saves as Bronze Delta → Notebook 2 cleans Bronze and saves as Silver Delta → Notebook 3 aggregates Silver and saves as Gold Delta → Databricks Workflow runs all 3 automatically every day at scheduled time. BI and ML teams consume Gold.

**Q: What is the complete flow of Medallion Architecture?**
> Raw data lands in Bronze unchanged (safety net). Silver cleans Bronze data — removes nulls, duplicates, invalid rows. Gold aggregates Silver data — GroupBy summaries for business. Workflow automates Bronze → Silver → Gold daily. BI dashboards and ML models consume Gold.

**Q: Why do we keep 3 separate notebooks instead of 1?**
> Separation of concerns — each notebook has one responsibility. If Silver fails, Bronze is safe. Easy to debug — know exactly which layer failed. Easy to rerun — just rerun the failed notebook. Workflow manages dependencies automatically.

**Q: How does your pipeline handle failure?**
> Workflow task dependencies stop downstream tasks on failure. Bronze is never modified — can always reprocess. Delta Lake ACID ensures no partial writes. Engineer gets alert on failure. Delta Time Travel can restore previous good version if needed.

---

## 5. PySpark Functions Quick Reference

**Q: What does withColumn() do?**
> Creates a new column or modifies existing column in DataFrame. Example: df.withColumn("Sales", df["$"].cast(DoubleType())) renames and fixes type of $ column to Sales.

**Q: What is the difference between filter() and dropna()?**
> filter() keeps rows matching a condition — you define the rule. dropna() specifically removes rows with null values. Use filter() for business rules (Sales > 0). Use dropna() for null handling.

**Q: What does groupBy().agg() do?**
> groupBy() groups rows by one or more columns. agg() calculates aggregate functions on each group. Together they summarize detailed data into business KPIs — like Excel PivotTable but for billions of rows!

---

## ⭐ Top 5 Most Important Questions

```
1. Explain end-to-end Medallion Architecture pipeline
2. What is Databricks Workflow and why use it?
3. What cleaning happens in Silver layer? Give functions.
4. What aggregation happens in Gold layer? Give functions.
5. What are task dependencies and why are they important?
```

---

## 💡 Interview Tips

```
For Silver questions:
→ Always mention EDA connection
→ Shows analytical thinking!
→ Give specific functions with examples

For Gold questions:
→ Mention business use cases
→ "BI and ML teams consume Gold"
→ Shows end-to-end thinking!

For Workflow questions:
→ Mention real business impact
→ "No productivity loss on leave"
→ "Non-stop business growth"
→ Business + technical answer = impressive!

For Pipeline questions:
→ Always mention all 3 layers
→ Mention task dependencies
→ Mention Delta Lake ACID protection
→ Mention Workflow automation
→ Shows complete DE thinking! 🎯
```

---
*"Strong foundation today = Senior Engineer tomorrow!"* 💪
