---
title: "Lab 1 – ARP Analysis (OSI Layer 2)"
weight: 1
categories: ["Networking", "Labs"]
topics: ["ARP", "OSI-L2"]
---

# TH: Lab 1 – วิเคราะห์ ARP (OSI Layer 2)

## วัตถุประสงค์
- ดู Flow ของ ARP Request / Reply
- ระบุ MAC–IP mapping
- ตรวจความผิดปกติใน ARP ให้ได้

## ขั้นตอน
1. เปิดไฟล์: `lab1_arp.pcap`
2. ใช้ filter:
   arp
3. ดูว่า IP ไหนถามหา MAC ไหน
4. ตรวจว่ามี ARP reply ที่ผิดปกติหรือไม่

## คำถาม
- IP 192.168.1.10 ถามหาใคร?
- MAC Address ที่แท้จริงคืออะไร?
- มี ARP duplicate หรือไม่?

## Expected Answer
(พี่เติมภายหลังตาม PCAP ที่ใช้)

# EN: Lab 1 – ARP Analysis

Object:
- Observe ARP Request/Reply flow
- Validate MAC–IP mapping
- Identify anomalies (duplicates, spoofing)
