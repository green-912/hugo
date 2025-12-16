---
title: "Basic Log Analysis"
date: 2025-12-10T00:35:00+07:00
draft: false
weight: 3
tags:
  - "linux"
  - "logs"
topics:
  - "System Basics"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Basic Log Analysis

## TH – บทนำ
เน้นให้ผู้เรียนรู้ว่า:
- log อยู่ที่ไหน
- ดู log ยังไง
- ใช้ log ในการแก้ปัญหาพื้นฐานได้อย่างไร

## EN – Introduction
Focus on:
- Where logs are stored
- How to view logs
- Using logs in basic troubleshooting

## TH – เนื้อหาหลัก
1. แนะนำโฟลเดอร์ `/var/log`
2. แนะนำเครื่องมือ `journalctl`
3. ใช้ `grep` เพื่อค้นหาคำสำคัญใน log

## EN – Main Content
1. Log directories like `/var/log`
2. `journalctl` basics
3. Using `grep` to search in logs

## Exercises
- ให้ผู้เรียนลองค้นคำว่า "error" ใน log หนึ่งไฟล์
