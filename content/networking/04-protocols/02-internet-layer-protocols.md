---
title: "Protocols in Internet Layer – IP / ICMP / Routing / NAT"
date: 2025-12-10
draft: false
weight: 20

categories: ["Networking", "Protocols"]
tags: ["protocols", "internet-layer"]
topics: ["Internet Layer", "IP", "ICMP", "Routing", "NAT"]
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: บทนำ (สำหรับมือใหม่)

# **Layer 2 — Internet Layer (OSI Layer 3)**

“ชั้นของการเดินทางระหว่างเครือข่าย (Routing)”

## Protocol ที่ต้องรู้

| Protocol                          | ทำหน้าที่                 | เข้าใจแบบง่าย                         |
| --------------------------------- | ------------------------- | ------------------------------------- |
| **IP (IPv4/IPv6)**                | ที่อยู่ของอุปกรณ์         | บ้านเลขที่สำหรับทั่วโลก               |
| **ICMP**                          | ทดสอบเส้นทาง / แจ้ง error | ไปรษณีย์ส่งจดหมายบอกว่า “ส่งไม่ได้นะ” |
| **Routing (Static / OSPF / BGP)** | เลือกเส้นทาง              | GPS ของโลกอินเทอร์เน็ต                |
| **NAT**                           | แปลง IP                   | เปลี่ยนป้ายบ้านก่อนออกนอกหมู่บ้าน     |

## ภาพจำง่าย

- **IP = ทะเบียนบ้าน**
    
- **Router = คนเลือกเส้นทาง**
    
- **ICMP = Messenger บอกปัญหา**



# **TH: บทนำ – Internet Layer คืออะไร?**

ชั้นนี้ทำหน้าที่ “ส่งข้อมูลออกนอกวง”  
จาก LAN → LAN อื่น ผ่าน Router  
เป็นชั้นของ **การเดินทางข้ามเครือข่าย**

สิ่งสำคัญ:

- ใช้ **IP Address**
    
- หาเส้นทางด้วย **Routing**
    
- แจ้งปัญหาเส้นทางด้วย **ICMP**
    
- เปลี่ยนที่อยู่ด้วย **NAT**
    

---

# **EN: Overview – What is the Internet Layer?**

This layer handles **routing between networks**.  
It decides _how data travels_ across routers to the destination.

Key tasks:

- Logical addressing (IP)
    
- Routing decisions
    
- Error messaging (ICMP)
    
- NAT translation
    

Think of it as **highways** between cities.

---

# **Protocol List (TH + EN)**

### **1) IP (IPv4 / IPv6)**

- TH: ที่อยู่ของอุปกรณ์ในเครือข่าย
    
- EN: Logical addressing scheme
    
- Packet unit: **Packet**
    

ภาพจำ: “ทะเบียนบ้านสำหรับเดินทางไกล”

---

### **2) ICMP**

- TH: ส่งข้อความแจ้งปัญหา เช่น host unreachable
    
- EN: Control and diagnostic protocol
    
- คำสั่งที่ใช้บ่อย: `ping`, `traceroute`
    

ภาพจำ: Messenger บอกว่า “ส่งของไม่ได้”

---

### **3) Routing (Static / OSPF / BGP)**

- TH: เลือกเส้นทางไปหาปลายทาง
    
- EN: Path selection for packet delivery
    
- Static = กำหนดเอง
    
- OSPF = ภายในองค์กร
    
- BGP = ระดับอินเทอร์เน็ต
    

ภาพจำ: GPS+แผนที่คมนาคมของโลก

---

### **4) NAT (Network Address Translation)**

- TH: แปลง IP เพื่อให้หลายเครื่อง share เน็ต
    
- EN: Translates private IP → public IP
    
- ใช้: Router บ้านทุกเครื่อง
    

ภาพจำ: เปลี่ยนป้ายบ้านก่อนออกนอกหมู่บ้าน

---

# **Teaching Notes**

- Demo: `ping`, `ip route`, traceroute
    
- ใช้ Wireshark ดู ICMP / TTL / Routing
    
- เวลาแนะนำ: 20–30 นาที