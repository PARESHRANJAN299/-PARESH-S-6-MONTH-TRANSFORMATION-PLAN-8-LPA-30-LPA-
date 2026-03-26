# 🎯 Day 2 — Interview Questions & Answers
**By:** Paresh Ranjan Rout
**Topic:** Delta Lake, ACID, Time Travel, Medallion Architecture

---

## 1. Delta Lake Basics

**Q: What is Delta Lake?**
> Delta Lake is a storage layer built on top of Parquet files that adds ACID transactions, Time Travel, and Schema Enforcement. It is just files on cloud storage (S3/DBFS) — not a separate database system.

**Q: Is Delta Lake a database?**
> No. Delta Lake is a storage layer — just smart files on cloud storage. It consists of Parquet data files and a _delta_log folder that records all changes. Spark is the engine that reads and writes Delta Lake.

**Q: What is _delta_log?**
> _delta_log is a folder inside every Delta table that records every single change as JSON files. It is the magic behind ACID transactions and Time Travel. Every write, update, delete = recorded in _delta_log.

**Q: What are the advantages of Delta Lake over CSV?**
> Delta Lake has ACID transactions, Time Travel, schema enforcement, compression, columnar reads, and supports update/delete operations. CSV has none of these — it's just a simple text file with no protection.

---

## 2. ACID Transactions

**Q: What is ACID? Explain each letter.**
> ACID stands for Atomic, Consistent, Isolated, Durable.
> - Atomic = Either 100% success or 100% failure. Never half written.
> - Consistent = Rules always maintained. Data always valid.
> - Isolated = No conflicts. Everything runs in order, one by one.
> - Durable = Once saved, saved forever. Even if system crashes.

**Q: What is Atomic in simple terms?**
> Atomic means all or nothing. Like a bank transfer — either both accounts update successfully OR both cancel. Money never disappears in between. Same for data — either all rows write successfully or nothing writes at all.

**Q: Why is Isolated important?**
> Without Isolation, two engineers writing to same file simultaneously causes conflicts and corruption. Isolation ensures one writer completes before another starts — like a queue system. No two people get same bank account number!

**Q: What problem does ACID solve in data engineering?**
> Without ACID, multiple writers corrupt files, system crashes leave half-written data, wrong data types get stored, and data is lost forever. ACID prevents all of these — making Delta Lake safe and reliable for production.

---

## 3. Time Travel

**Q: What is Time Travel in Delta Lake?**
> Time Travel means we can go back to any previous version of our data. Delta Lake records every change in _delta_log — like a diary. We can read data from any past version or date using versionAsOf or timestampAsOf options.

**Q: How is Delta Lake Time Travel similar to GitHub?**
> GitHub records every code change as commits. Delta Lake records every data change in _delta_log. GitHub has git checkout to go back — Delta Lake has versionAsOf. Same concept — GitHub for code, Delta Lake for data!

**Q: Give 3 real use cases of Time Travel.**
> 1. Wrong data loaded — restore to previous version instantly
> 2. Client asks for data on specific date — time travel to that date
> 3. ML model training — use exact same data every time for reproducibility

**Q: What is the difference between versionAsOf and timestampAsOf?**
> versionAsOf = go back by version number (0, 1, 2...)
> timestampAsOf = go back by date ("2026-03-18")
> Both achieve same result — reading older version of data.

---

## 4. Write & Read Delta

**Q: How do you write a DataFrame as Delta table?**
```python
df.write \
  .format("delta") \
  .mode("overwrite") \
  .save("/delta/bronze/sales")
```

**Q: What is the difference between overwrite and append mode?**
> overwrite = deletes existing data and writes fresh. Use for monthly full reload.
> append = keeps existing data and adds new rows. Use for daily incremental data.

**Q: How do you read a Delta table?**
```python
df = spark.read \
     .format("delta") \
     .load("/delta/bronze/sales")
```

**Q: What are all write modes in Spark?**
> overwrite = replace everything
> append = add to existing
> ignore = skip if exists
> error = fail if exists (default — safest!)

---

## 5. Medallion Architecture

**Q: What is Medallion Architecture?**
> Medallion Architecture is a 3-layer data pipeline pattern — Bronze, Silver, Gold. Raw data lands in Bronze unchanged. Silver cleans the data. Gold aggregates it for business use. ML and BI engineers consume Gold layer.

**Q: What is Bronze layer?**
> Bronze is the first layer that stores raw data exactly as received from source — no changes at all. It is the safety net. If anything goes wrong in Silver or Gold, we reprocess from Bronze. It is the original source of truth.

**Q: Why should Bronze data never be changed?**
> Bronze is our safety net and source of truth. If Silver or Gold processing goes wrong, we go back to Bronze and reprocess. If Bronze is changed, we lose the original data and cannot recover. Original documents must always be preserved!

**Q: What is Silver layer?**
> Silver is the cleaned version of Bronze data. Nulls are removed, duplicates are dropped, invalid rows are filtered, and data types are fixed. Silver has only valid, clean data — ready for aggregation.

**Q: What is Gold layer?**
> Gold is the business-ready aggregated data from Silver. It contains GroupBy summaries, calculations, and KPIs ready for dashboards, reports, and ML models. ML Engineers and BI Engineers consume Gold layer.

**Q: What is the difference between Bronze, Silver, and Gold in terms of data size?**
> Bronze = largest (all raw rows)
> Silver = medium (valid rows only, some removed)
> Gold = smallest (aggregated/summarized rows)

**Q: Who uses each layer?**
> Bronze = Data Engineers only
> Silver = Data Engineers only
> Gold = ML Engineers, BI Engineers, Business teams

---

## 6. CSV vs Parquet vs Delta Lake

**Q: What is Parquet and why is it better than CSV?**
> Parquet is a columnar storage format — stores data column by column instead of row by row. This means queries only read needed columns (10x faster). It also compresses data (10x smaller files). But it has no ACID transactions like Delta Lake.

**Q: Why use Delta Lake instead of Parquet?**
> Parquet is fast but has no ACID, no time travel, and multiple writers cause corruption. Delta Lake adds all these on top of Parquet — making it safe, reliable, and production-ready while keeping all Parquet performance benefits.

**Q: Why Delta Lake instead of Database for big data?**
> Database is great for small transactional data but fails at big data scale — too expensive, too slow for analytics. Delta Lake handles PBs of data cheaply on cloud, integrates with Spark for distributed processing, and costs a fraction of database. Companies use both — database for transactions, Delta Lake for analytics.

---

## ⭐ Top 5 Most Important Questions

```
1. What is ACID? Explain each letter with example.
2. What is Medallion Architecture? Explain all 3 layers.
3. What is Time Travel in Delta Lake? Give use cases.
4. Difference between CSV, Parquet, and Delta Lake?
5. Why use Delta Lake instead of a database?
```

---

## 💡 Interview Tips

```
For ACID questions:
→ Always give real life example for each letter
→ Atomic = bank transfer
→ Isolated = bank account number
→ Don't just say definition!

For Medallion questions:
→ Mention you did this in ADF too
→ Shows practical experience!
→ Mention CDC for extra points! ⭐

For Delta Lake questions:
→ Always mention _delta_log
→ Shows deep understanding!
```

---
*"Understand deeply, explain simply. That's the interview winning formula!"* 💪
