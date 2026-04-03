# 🎯 Cluster Architecture — Interview Questions
**By:** Paresh Ranjan Rout
**Date:** April 2, 2026
**Topic:** Databricks Cluster, Nodes, Driver, Cluster Manager

---

## 🥉 PHASE 1 — Basic (8-10 LPA)
**Target: Fresher / Junior Data Engineer**

**Q1. What is a Cluster in Databricks?**
💡 Hint: Group of machines working together
✅ Answer: A cluster is a group of machines (nodes) organized together to process data using Apache Spark. All machines work simultaneously to handle large data workloads.

**Q2. What is a Node?**
💡 Hint: Simplest unit
✅ Answer: A Node is a single machine (computer/server) inside a cluster. Node = Machine = Computer = Server — all same thing, different words!

**Q3. What is a Cluster Node?**
💡 Hint: Every machine inside cluster
✅ Answer: A Cluster Node is any machine that belongs to a cluster. Every single machine inside a cluster = Cluster Node. Driver Node is a cluster node. Each Worker Node is also a cluster node.

**Q4. What is Master Node?**
💡 Hint: First machine created
✅ Answer: Master Node is the first machine created when a cluster starts. Databricks automatically assigns the first machine as Master Node. It contains Driver and Cluster Manager software. Also called Driver Node — same machine, different names!

**Q5. What is Driver Node? Is it same as Master Node?**
💡 Hint: Same machine — different perspective!
✅ Answer: Yes! Driver Node = Master Node = SAME physical machine. Master Node is the infrastructure perspective (first machine created). Driver Node is the Spark/application perspective (machine that runs your code). Both names refer to the same AWS EC2 instance.

**Q6. What is Worker Node?**
💡 Hint: Employee machines
✅ Answer: Worker Nodes are all remaining machines in the cluster after Master Node. They receive tasks from Driver, process data partitions in RAM, and return results back to Driver. Can be 1 to hundreds of workers depending on cluster size.

**Q7. What is Single Node Cluster? When to use it?**
💡 Hint: One machine plays both roles
✅ Answer: Single Node Cluster = ONE machine acting as both Driver AND Worker simultaneously. Driver assigns tasks to itself and processes them. Use for: learning, small data testing, development. Never use for production big data — RAM and CPU limited to one machine!

**Q8. What is Driver software? What does it do?**
💡 Hint: Project manager of your job
✅ Answer: Driver is software installed on Master Node by Databricks automatically. It receives your code, creates execution plan (DAG), assigns tasks to Worker Nodes, collects all results, and returns final output to you. Always 1 Driver per cluster. If Driver fails = entire job fails!

**Q9. What is Cluster Manager? What does it do?**
💡 Hint: Building manager — manages machines not jobs
✅ Answer: Cluster Manager is software installed on Master Node. It manages all machines in cluster — starts/stops Worker Nodes, monitors machine health, manages memory and CPU resources. Different from Driver — Driver manages YOUR JOB, Cluster Manager manages MACHINES.

**Q10. Which machine starts first in a cluster?**
💡 Hint: Master Node = first always!
✅ Answer: Master Node always starts first. Then Cluster Manager software starts on it. Then Cluster Manager requests Worker Nodes from AWS. Workers start one by one and connect to Master Node. Only then cluster is ready for use!

---

## 🥈 PHASE 2 — Intermediate (15-20 LPA)
**Target: 1-2 years experience**

**Q11. What is the difference between Driver and Cluster Manager?**
💡 Hint: Job level vs Infrastructure level
✅ Answer:
Driver = manages YOUR JOB → receives code, creates plan, assigns tasks, collects results
Cluster Manager = manages MACHINES → starts/stops workers, monitors health, manages resources
Both are SOFTWARE on same Master Node but completely different responsibilities!

**Q12. Where does Driver live? Where does Cluster Manager live?**
💡 Hint: Both on same machine!
✅ Answer: Both Driver and Cluster Manager are software installed on Master Node — the first machine in cluster. Master Node = ONE MAN ARMY because it runs both software simultaneously. Your notebook code runs ON the Driver which is ON the Master Node.

**Q13. What happens step by step when you press Run in notebook?**
💡 Hint: YOU → Driver → Workers → Driver → YOU
✅ Answer:
Step 1: YOU press Run in notebook
Step 2: Driver receives your code (on Master Node)
Step 3: Driver creates execution plan (DAG)
Step 4: Driver assigns partitions to Worker Nodes
Step 5: All Workers process simultaneously ⚡
Step 6: Workers return results to Driver
Step 7: Driver combines all results
Step 8: YOU see final output! ✅

**Q14. What is Classic Compute Plane? Who owns the machines?**
💡 Hint: Official Databricks docs answer this!
✅ Answer: Classic Compute Plane = YOUR company's AWS account machines. Databricks official documentation states: "For classic Databricks compute, the compute resources are in YOUR AWS account." Databricks only manages the software layer. AWS provides physical EC2 machines.

**Q15. What is the difference between Classic Compute and Serverless?**
💡 Hint: Who manages what?
✅ Answer:
Classic Compute: YOUR AWS account, YOU manage clusters, pay per hour, manual start/stop
Serverless: Databricks AWS account, Databricks manages everything, instant start ⚡, pay per second
Classic = cheaper for constant heavy workloads. Serverless = cheaper for short unpredictable workloads.

**Q16. What are the 3 planes in new Databricks 2024 architecture?**
💡 Hint: Control, Classic, Serverless
✅ Answer:
Plane 1 = Control Plane (Databricks account) → UI, notebooks, workspace management
Plane 2 = Classic Compute Plane (YOUR AWS account) → your machines + your data
Plane 3 = Serverless Compute Plane (Databricks account) → instant managed compute
Key improvement: YOUR data stays in YOUR cloud. Databricks never sees it! ✅

**Q17. Why did AWS US-East-1 going down affect your cluster?**
💡 Hint: Proof that machines are on AWS!
✅ Answer: Because Classic Compute machines are physically located on AWS US-East-1 EC2 instances in YOUR company's AWS account. When AWS region goes down, those EC2 machines stop. This proves machines are on AWS, not owned by Databricks. Databricks only manages software layer.

**Q18. What is the difference between All-Purpose cluster and Job cluster?**
💡 Hint: Interactive vs automated
✅ Answer:
All-Purpose cluster: Always running, shared by team, for interactive notebook development, more expensive
Job cluster: Auto-starts when job runs, auto-terminates when job finishes, for automated pipelines, much cheaper
Production pipelines should use Job clusters — no idle cost! ✅

**Q19. What happens when Driver fails?**
💡 Hint: Critical single point of failure!
✅ Answer: If Driver fails, entire job fails immediately! All Worker results are lost. Job must restart from beginning. This is why Driver node gets more RAM than Workers — it's the most critical machine. Workers can fail and Spark recovers automatically, but Driver failure = complete job failure.

**Q20. Why does adding more Worker Nodes make processing faster?**
💡 Hint: More workers = more parallel processing
✅ Answer: Data is split into partitions. Each Worker processes one partition simultaneously. 4 Workers = 4 partitions processed at same time. 40 Workers = 40 partitions simultaneously. Same work, more workers = less time. This is called horizontal scaling — adding machines instead of making one machine bigger.

---

## 🥇 PHASE 3 — Senior/Architect (25-30 LPA)
**Target: Senior DE / Lead DE / Architect**

**Q21. Your cluster has 1 Driver and 10 Workers. Driver crashes at 3 AM. What happens? How do you prevent this?**
✅ Answer:
What happens: Entire job fails. All 10 Workers stop. Job must restart completely. Data in Worker RAM is lost.
Prevention:
→ Use Job clusters with retry policy (retry 2-3 times automatically)
→ Enable Driver high availability in production
→ Use checkpointing in streaming jobs (restart from checkpoint not beginning)
→ Set email/Slack alerts for Driver failures
→ Use Delta Lake ACID — even if job fails, no partial writes corrupt data
→ Monitor Driver memory — most crashes from OOM (out of memory)

**Q22. Manager asks: "Should we use Classic Compute or Serverless for our Nielsen daily pipeline?" What is your recommendation and why?**
✅ Answer:
My recommendation = Classic Compute (Engg share compute) ✅
Reason: Nielsen pipeline runs daily at fixed time, processes TBs of data, runs 2-3 hours continuously.
Classic compute = cheaper for constant heavy workloads.
Serverless = better for short unpredictable queries.
If cluster runs 80%+ of time = Classic always cheaper.
Also: Classic compute = YOUR AWS account = data sovereignty ✅
Serverless = Databricks account = data leaves your account ❌ (compliance risk for client data!)

**Q23. New engineer asks: "Why do we need Cluster Manager if Driver already manages the work?" How do you explain?**
✅ Answer:
Great question! They manage completely different things:
Driver manages YOUR JOB — like a project manager who assigns tasks to team members.
Cluster Manager manages THE OFFICE — like building management who decides how many desks, which floors are open, HVAC, electricity.
Project manager doesn't manage the building. Building manager doesn't manage your project.
Without Cluster Manager: no one would start/stop Worker machines, monitor their health, or scale up/down automatically!
Both needed. Different responsibilities.

**Q24. Company wants to reduce cluster cost by 40%. What options do you suggest?**
✅ Answer:
Option 1: Use Job clusters instead of All-Purpose for pipelines → no idle cost → save 30-50%
Option 2: Enable Auto Scaling (min 2, max 10) → pays only for machines actually used
Option 3: Use Spot instances for Workers → 60-80% cheaper than On-Demand (risk: spot can be reclaimed)
Option 4: Right-size cluster → most teams over-provision. Analyse actual CPU/RAM usage and reduce
Option 5: Schedule OPTIMIZE and VACUUM → reduces query time → less cluster runtime
Option 6: Terminate clusters when not in use → set auto-termination after 30 mins idle
Combined = easily 40-60% cost reduction without performance impact! ✅

**Q25. Explain complete flow: from user writing code to seeing output — include all nodes, software, and planes.**
✅ Answer:
Step 1: YOU write code in notebook (Control Plane — Databricks UI)
Step 2: Control Plane sends code to Classic Compute Plane (YOUR AWS)
Step 3: Driver software on Master Node receives code
Step 4: Driver creates DAG (execution plan)
Step 5: Driver asks Cluster Manager: "Give me workers!"
Step 6: Cluster Manager confirms Worker Nodes available
Step 7: Driver sends partition tasks to Worker Node 1, 2, 3...
Step 8: All Workers process their partitions simultaneously in RAM ⚡
Step 9: Workers return results to Driver
Step 10: Driver combines all results
Step 11: Result sent back through Control Plane
Step 12: YOU see output on screen! ✅
Throughout: Unity Catalog enforces who can see what data. All within YOUR AWS account!

---

## 💡 Golden Rules for Interviews

```
1. Master Node = Driver Node = SAME machine!
2. Driver = manages jobs (software)
3. Cluster Manager = manages machines (software)
4. Classic Compute = YOUR AWS machines ✅
5. Serverless = Databricks AWS machines
6. Worker failure = Spark recovers ✅
7. Driver failure = entire job fails ❌
8. Single Node = learning only ✅
9. More workers = faster processing ✅
10. All machines = Cluster Nodes ✅
```

---
*"Understand the architecture first. Code follows naturally!"*
*— Paresh Ranjan Rout, April 2, 2026* 💪🔥
