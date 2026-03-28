# 📓 Data Governance & Unity Catalog — Notes
**By:** Paresh Ranjan Rout
**Date:** March 28, 2026

---

## 1. What is Data Governance?

> **Data Governance = Rules and policies that control WHO can access WHAT data, HOW it is used, and WHERE it goes.**

```
Without Governance:
→ Anyone sees any data ❌
→ Client A sees Client B data ❌
→ No audit trail ❌
→ Compliance violation ❌
→ Data breach risk! ❌

With Governance:
→ Right people see right data ✅
→ Complete audit trail ✅
→ Compliance maintained ✅
→ Data protected! ✅
```

---

## 2. Key Elements of Data Governance

| Element | Simple Meaning |
|---|---|
| **Data Cataloging** | Index of what data exists where |
| **Data Classification** | Label data — confidential/public |
| **Auditing & Access** | Who accessed what and when |
| **Data Discovery** | Find right data quickly |
| **Data Sharing** | Share safely across teams |
| **Data Lineage** | Track data journey A→B→C |
| **Data Security** | Lock data — right people only |
| **Data Quality** | Ensure data is correct and clean |

---

## 3. Governance Challenges (Old Way)

```
❌ Fragmented view of data estate
   → Data everywhere, nobody knows what exists

❌ Multiple tools for access management
   → Different tool for each platform

❌ Incomplete monitoring and visibility
   → Can't see who accessed data

❌ Lack of cross-platform data sharing
   → Teams can't share across platforms

All = because of FRAGMENTATION!
Databricks solves with Unity Catalog! ✅
```

---

## 4. What is Unity Catalog?

> **Unity Catalog = Databricks' ONE governance system for ALL data assets. Like MDM + DLP combined — but specifically for data in Databricks.**

```
Manages:
✅ Tables (Delta tables)
✅ Files (CSV, JSON)
✅ Notebooks (code)
✅ AI Models (ML)
✅ Dashboards (BI)

ALL assets in ONE place! 🎯
```

---

## 5. Unity Catalog — 4 Pillars

### Security 🔒
```
Access Control → who sees what data
Auditing       → complete history log
= Like SharePoint permissions
  but for ALL data! ✅
```

### Collaboration 🤝
```
Discovery           → find any data easily
Secure Data Sharing → share across teams safely
```

### Quality ⭐
```
Lineage            → track data journey
Quality Monitoring → auto check data quality
```

### Insights 💡
```
Cost Controls      → control spending
Business Semantics → define business terms
```

---

## 6. Unity Catalog = MDM + DLP

```
MDM (Master Data Management):
→ Single source of truth
→ Data quality & consistency

DLP (Data Loss Prevention):
→ Prevent sensitive data leaking
→ Mask personal information

Unity Catalog combines BOTH:
✅ Row level security
✅ Column masking
✅ Data sharing controls
✅ Prevent unauthorized access
✅ GDPR, HIPAA compliance
✅ Complete audit trail
```

---

## 7. Supported Formats

```
Unity Catalog works with:
→ Delta Lake  ✅ (Databricks format)
→ Parquet     ✅ (standard format)
→ Iceberg     ✅ (Netflix/Apple format)

NOT locked to one format!
Open and flexible! ✅
```

---

## 8. What is Iceberg?

```
Iceberg = Lakehouse format
          made by Netflix + Apple

vs Delta Lake = made by Databricks

Both:
✅ ACID transactions
✅ Time Travel
✅ Open source

Unity Catalog supports BOTH! ✅
```

---

## 9. Real World — DataPOEM Example

```
DataPOEM has 22 clients:
→ Unilever data = SENSITIVE
→ MARS data = SENSITIVE
→ Reckitt data = SENSITIVE

Unity Catalog:
→ Unilever team = Unilever tables only ✅
→ MARS team = MARS tables only ✅
→ Cross-client = BLOCKED ✅
→ Full audit trail ✅

Same as your SharePoint
permission work! 🎯
```

---

## 10. Interview Answer

```
Q: "What is Unity Catalog?"

A: "Unity Catalog is Databricks'
    unified governance solution —
    similar to MDM and DLP concepts
    but designed for data assets.

    It provides access control,
    auditing, lineage tracking,
    quality monitoring, and cost
    controls for ALL assets —
    tables, files, notebooks,
    AI models, and dashboards.

    Supports Delta Lake, Parquet,
    and Iceberg formats.
    Handles GDPR and compliance
    automatically!" 🎯
```

---

## 💡 Golden Rules

```
1. Governance = rules for WHO sees WHAT
2. Unity Catalog = ONE governance for ALL
3. Unity Catalog = MDM + DLP for data
4. Covers: Security, Collaboration,
           Quality, Insights
5. Works with Delta Lake + Parquet + Iceberg
6. Your SharePoint work = same concept! ✅
```

---
*"Governance is not optional — it's the foundation of enterprise data trust."* 💪
