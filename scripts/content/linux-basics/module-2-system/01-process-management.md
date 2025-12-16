---
title: "Process Management"
date: 2025-12-10T00:25:00+07:00
draft: false
weight: 1
tags:
  - "linux"
  - "process"
topics:
  - "System Basics"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Process Management

## TH – บทนำ
สอนผู้เรียนให้ดู process ที่รันอยู่ และหยุด process ที่มีปัญหา:
- ใช้ `ps aux` ดู process ทั้งระบบ
- ใช้ `top` หรือ `htop` ดูการใช้ทรัพยากร
- ใช้ `kill` หรือ `pkill` หยุด process

## EN – Introduction
Teach how to inspect and control processes:
- `ps aux`, `top` / `htop`
- `kill`, `pkill`

## Vocabulary (TH + EN)
- Process – โพรเซส – A running program instance  
- PID – หมายเลขโพรเซส – Process ID  

## Exercises
- ให้ผู้เรียนลองหา process ที่ใช้ CPU สูงสุดจาก `top` แล้วอธิบาย
