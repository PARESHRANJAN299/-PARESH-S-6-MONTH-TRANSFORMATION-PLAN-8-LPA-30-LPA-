# 🎯 50 Interview Questions — 3 Phases
**By:** Paresh Ranjan Rout
**Date:** March 31, 2026
**Goal:** 8 LPA → 10 LPA → 20 LPA → 30 LPA 🎯

---

## 🥉 PHASE 1 — Basic (8-10 LPA)
### "Prove you know the fundamentals"
**Target: Junior Data Engineer / Data Engineer Fresher**

1. What is Apache Spark?
2. What is Databricks?
3. What is the difference between Spark and Databricks?
4. What is a Cluster in Databricks?
5. What is Master Node and Worker Node?
6. What is Driver in Spark?
7. What is a DataFrame in Spark?
8. What is the difference between DataFrame and RDD?
9. What is a Partition in Spark?
10. What is Transformation? Give 2 examples.
11. What is Action? Give 2 examples.
12. What is Lazy Evaluation in Spark?
13. What is Auto Scaling?
14. What is Workspace in Databricks?
15. What is inferSchema? What is the problem with it?
16. What is Delta Lake?
17. What is ACID? Explain each letter.
18. What is Time Travel in Delta Lake?
19. What is the difference between CSV, Parquet, and Delta Lake?
20. What is Medallion Architecture? Explain Bronze, Silver, Gold.

---

## 🥈 PHASE 2 — Intermediate (15-20 LPA)
### "Prove you can build real pipelines"
**Target: Data Engineer with 1-2 years experience**

21. What is the difference between Data Warehouse, Data Lake, and Lakehouse?
22. Why use Delta Lake instead of a Database?
23. What is Data Estate Fragmentation? How does Databricks solve it?
24. What is Unity Catalog?
25. How is Unity Catalog similar to MDM and DLP?
26. What is Data Lineage?
27. What is Serverless Compute? When to use vs Traditional cluster?
28. What is DLT (Delta Live Tables)?
29. What is "Declarative" in DLT?
30. What is Lakeflow Jobs?
31. What is the difference between Workflow and Lakeflow Jobs?
32. What are the 4 trigger types in Lakeflow Jobs?
33. What is Observability in pipelines?
34. What is the difference between overwrite and append mode?
35. What PySpark functions do you use for Silver layer cleaning?
36. What PySpark functions do you use for Gold layer aggregation?
37. What is groupBy() and agg() in PySpark?
38. What is withColumn() and withColumnRenamed()?
39. What is dropna() vs fillna()?
40. What is the difference between filter() and where() in PySpark?

---

## 🥇 PHASE 3 — Advanced (25-30 LPA)
### "Prove you think like a Senior DE"
**Target: Senior Data Engineer / Lead Data Engineer**

41. What is the difference between Databricks and Azure Synapse? When to use which?
42. What is Lakehouse Federation?
43. What is Iceberg? How is it different from Delta Lake?
44. What is MinIO? When would you use it?
45. What is the difference between On-Premise, Cloud, and Hybrid deployment?
46. What is CDC (Change Data Capture)? How does it work?
47. What is Auto Loader? How is it different from manual ingestion?
48. What is Data Governance? What are its key elements?
49. Can AI replace Data Engineers? Justify your answer.
50. You have a pipeline failing in production at 3 AM — what is your approach to fix it?

---

## 💡 How to Answer — Golden Rule

```
For EVERY question:
Step 1 → One line definition
Step 2 → Real world example
Step 3 → Why it matters in production

Example:
Q: What is Delta Lake?

Step 1: "Delta Lake is a storage layer
         that adds ACID transactions,
         Time Travel, and schema
         enforcement on top of
         Parquet files."

Step 2: "In our Nielsen pipeline,
         we store Bronze, Silver,
         and Gold layers as Delta
         tables — ensuring data
         quality and history."

Step 3: "Without Delta Lake, multiple
         pipeline failures could corrupt
         data. Delta's ACID ensures
         data is always consistent!" ✅
```

---

## 🎯 Phase-wise Salary Targets

```
PHASE 1 (Q1-20):
→ Answer all 20 confidently
→ Target: 8-10 LPA ✅

PHASE 2 (Q21-40):
→ Answer all 20 with examples
→ Target: 15-20 LPA ✅

PHASE 3 (Q41-50):
→ Answer all 10 with depth
→ Target: 25-30 LPA ✅

Master ALL 50 = 30 LPA by September! 🎯
```

---

## 📅 Practice Schedule

```
Week 1: Answer Phase 1 (Q1-20)
        in your own words daily

Week 2: Answer Phase 2 (Q21-40)
        with real examples

Week 3: Answer Phase 3 (Q41-50)
        with business context

Week 4: Mock interview all 50
        Record yourself speaking!
```

---
*"Answer simply. Example clearly. Connect to business. That's the winning formula!"*
*— Paresh Ranjan Rout, March 31, 2026* 💪🔥
