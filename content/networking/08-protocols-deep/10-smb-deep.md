---
title: "SMB Deep Dive – Sessions, Shares & Lateral Movement"
date: 2025-12-10
draft: false
weight: 100

categories: ["Networking", "Protocols Deep Dive"]
tags: ["protocols-deep", "smb-deep"]
topics: ["SMB", "Shares", "Lateral Movement"]
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: ภาพรวมเชิงลึก (Deep Overview – TH)

(อธิบายโปรโตคอลนี้แบบเชิงลึก:
- ทำงานอย่างไรตามลำดับขั้น (message flow)
- Field สำคัญใน Header / Options
- จุดที่ใช้ตรวจหาผิดปกติ / หลักฐานในงานสืบสวน)

## EN: Deep Overview (EN)

(Explain the protocol workflow in detail:
- Message sequence
- Critical header fields / options
- Forensic / detection points)

---

## Packet Structure & Fields

(สรุปโครงสร้าง packet แบบเป็นหัวข้อ  
เน้น field ที่ควรโฟกัสเมื่อเปิดใน Wireshark / Zeek / Suricata)

---

## Normal vs Abnormal Behaviour

- พฤติกรรมปกติ (Normal pattern)
- พฤติกรรมผิดปกติ (Suspicious pattern)
- ตัวอย่าง Filter / Rule ที่ใช้จับ

---

## Forensic / Detection Notes

(แนวคิดสำหรับ:
- ใช้ใน Labs
- ใช้ใน Case Study
- ใช้ใน Incident จริง)

---

## Teaching Notes

- ระดับผู้เรียนที่เหมาะ: Intermediate / Advanced
- Lab ที่ควรผูก เช่น 06-labs, 07-case-studies
- จุดที่ควรเน้นตอนสอนสด
