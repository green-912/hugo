---
title: "Lab – Basic Log Analysis"
date: 2025-12-10T00:55:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "lab"
  - "logs"
topics:
  - "Hands-on Labs"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Lab – Basic Log Analysis

## TH – เป้าหมาย
- ผู้เรียนสามารถเปิดดู log พื้นฐาน
- สามารถค้นหา error หรือข้อความที่น่าสนใจใน log ได้

## EN – Goals
- Open and read basic logs
- Search for errors or interesting events in logs

## TH – โจทย์ตัวอย่าง
1. ใช้ `journalctl` ดู log ล่าสุด
2. ใช้ `grep` ค้นหาคำว่า "error" หรือ "fail" ใน log หนึ่งไฟล์
3. ให้ผู้เรียนอธิบายว่าข้อความที่พบอาจสื่อถึงปัญหาอะไร

## EN – Tasks
1. Use `journalctl` to view recent logs
2. Use `grep` to find "error" or "fail" in a log file
3. Ask learners to interpret what the messages might indicate
