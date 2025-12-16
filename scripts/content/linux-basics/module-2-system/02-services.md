---
title: "Services and systemctl"
date: 2025-12-10T00:30:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "systemd"
  - "services"
topics:
  - "System Basics"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Services and systemctl

## TH – บทนำ
แนะนำแนวคิด service ใน Linux:
- service ต่างจาก process ปกติอย่างไร
- systemd และ systemctl

## EN – Introduction
Explain:
- What services are
- The role of systemd
- Basic `systemctl` usage

## TH – เนื้อหาหลัก
1. ใช้ `systemctl status` ดูสถานะ service
2. สั่ง start / stop / restart service
3. ดู log สั้น ๆ ผ่าน `journalctl -u servicename`

## EN – Main Content
1. `systemctl status`
2. Start / stop / restart
3. Short logs with `journalctl -u`

## Exercises
- ให้ผู้เรียนลอง restart service ตัวหนึ่งและเช็ค log
