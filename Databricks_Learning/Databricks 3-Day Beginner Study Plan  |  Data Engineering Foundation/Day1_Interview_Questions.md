# 🎯 Day 1 — Top Interview Questions & Answers
**By:** Paresh Ranjan Rout  
**Topic:** Databricks Basics — Data Engineering Interview Prep

---

## 1. Spark vs Databricks

**Q: What is Apache Spark?**
> Spark is an open-source distributed compute engine. Its job is to take data, process it, and give output. It does not store data, has no UI, and no scheduler.

**Q: What is Databricks?**
> Databricks is a cloud platform built on top of Apache Spark. It adds UI, Delta Lake, Workflows, SQL Editor, and collaboration on top of Spark — making it a one-stop solution for Data Engineering.

**Q: What is the difference between Spark and Databricks?**
> Spark is just the engine — free and open source. Databricks is the complete platform built around Spark — paid, cloud-native, with extra features like Delta Lake, Auto Scaling, and Workflows.

**Q: Can we use Spark without Databricks?**
> Yes. We can install PySpark locally using pip install pyspark. But locally, Spark only uses your laptop's CPU cores — not multiple machines. For real big data processing, we need a platform like Databricks or AWS EMR.

---

## 2. Cluster & Workspace

**Q: What is a Cluster in Databricks?**
> A cluster is the set of machines that run your Spark code. When you write code in a notebook and press run, the cluster processes it. Without a cluster, a notebook is just a text file.

**Q: What is a Workspace in Databricks?**
> Workspace is your personal working environment in Databricks where you create, write, run, and save notebooks, folders, and files.

**Q: What are the types of clusters in Databricks?**
> Single Node (learning), Multi Node (production), Job Cluster (auto-starts for a job then terminates), All Purpose (always running, shared by team).

**Q: Why should you terminate a cluster when done?**
> Because clusters cost money per hour. Every machine in the cluster is billed by the cloud provider (AWS/Azure). Terminating saves company cost.

**Q: Does Databricks own the machines in a cluster?**
> No. Databricks owns zero machines. It borrows machines from AWS/Azure/GCP on demand when you create a cluster and returns them when you terminate.

---

## 3. Auto Scaling

**Q: What is Auto Scaling?**
> Auto Scaling automatically increases the number of machines in a cluster when workload is high and decreases when workload is low — without human intervention.

**Q: What is the difference between Scale Up and Scale Out?**
> Scale Up = make each machine more powerful (more RAM/CPU). Scale Out = add more machines. Auto Scale combines both automatically based on load.

**Q: What are Min and Max instances in Auto Scaling?**
> Min = minimum machines always running (never zero — avoids cold start). Max = maximum machines allowed (budget limit). Databricks automatically stays between Min and Max.

**Q: What is a cold start problem?**
> If Min instances = 0, when load arrives, new machines take 2-3 minutes to spin up. During this time jobs wait. Setting Min = 1 or 2 avoids this delay.

**Q: Why is Auto Scaling important for cost optimization?**
> Without Auto Scaling, companies buy machines for peak load — wasting money during normal hours. With Auto Scaling, you pay only for what you use, exactly when you use it.

---

## 4. PySpark — Reading Data

**Q: How do you read a CSV file in PySpark?**
```python
df = spark.read.format("csv") \
    .option("header", "true") \
    .option("sep", ",") \
    .option("inferSchema", "true") \
    .load("/path/to/file.csv")
```

**Q: What does inferSchema do? What is the problem with it?**
> inferSchema = true tells Spark to automatically detect column data types. The problem is it reads the entire file twice — once to detect types, once to load data. This makes it slow. In production, always define schema manually.

**Q: What is the difference between header=true and header=false?**
> header=true → first row treated as column names. header=false → first row treated as data, columns get dummy names like _c0, _c1, _c2.

**Q: Why use pipe | as separator instead of comma?**
> If data contains commas inside values, CSV breaks. Pipe never appears in normal text, making it a safer separator for complex data.

**Q: What is a DataFrame in Spark?**
> A DataFrame is a distributed table with rows and columns — like an Excel sheet but spread across multiple machines. It can handle billions of rows that a normal laptop cannot.

---

## 5. Transformation vs Action ⭐ Most Asked!

**Q: What is the difference between Transformation and Action in Spark?**
> Transformation = lazy operation that defines what to do but does NOT execute (filter, select, groupBy). Action = triggers actual execution and returns a result (show, count, collect, write).

**Q: What is Lazy Evaluation in Spark?**
> Spark does not execute transformations immediately. It collects all transformations first, optimizes them, then executes everything at once when an action is called. This makes Spark faster and more efficient.

**Q: Give examples of Transformations.**
> filter(), select(), groupBy(), withColumn(), orderBy(), join(), drop()

**Q: Give examples of Actions.**
> show(), count(), collect(), write(), first(), take()

**Q: Why does Spark use Lazy Evaluation?**
> Because Spark can optimize the entire chain of transformations before running. Instead of running each step separately, it combines them and finds the most efficient execution plan — saving time and resources.

---

## 6. AWS Regions

**Q: What is an AWS Region?**
> A Region is a geographical location where AWS has data centers. Example: US-East-1 = North Virginia, AP-South-1 = Mumbai.

**Q: What happens if an AWS Region goes down?**
> If a company uses single region, everything hosted there goes down. Multi-region setup auto-redirects to another region but costs more.

**Q: What is RTO and RPO?**
> RTO (Recovery Time Objective) = how fast must we recover after a failure. RPO (Recovery Point Objective) = how much data loss is acceptable.

---

## ⭐ Top 5 Most Important Questions

```
1. What is difference between Spark and Databricks?
2. What is Lazy Evaluation / Transformation vs Action?
3. What is Auto Scaling and why is it important?
4. What does inferSchema do and why avoid it in production?
5. What is a Cluster and why do we terminate it?
```

---

## 💡 Interview Tips

- Always give a **one line definition** first
- Then give a **real world example**
- Then explain **why it matters in production**
- Never say "I don't know" — say "I understand the concept as..."

---
*"Interviews test your understanding, not your memory. Understand deeply, explain simply."* 💪
