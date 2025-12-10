---
title: "Protocols in Transport Layer – TCP / UDP / Ports"
date: 2025-12-10
draft: false
weight: 30

categories: ["Networking", "Protocols"]
tags: ["protocols", "transport-layer"]
topics: ["Transport Layer", "TCP", "UDP", "Ports"]
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: บทนำ (สำหรับมือใหม่)

# **Layer 3 — Transport Layer (OSI Layer 4)**

“ชั้นควบคุมการคุยแบบโปรแกรม-ถึง-โปรแกรม (Port)”

## Protocol หลัก

|Protocol|ทำหน้าที่|เข้าใจแบบง่าย|
|---|---|---|
|**TCP**|คุยแบบเชื่อถือได้|คุยโทรศัพท์: ฟังกันชัดเจน|
|**UDP**|คุยเร็ว แต่ไม่เช็ค|ตะโกนผ่านกำแพง: ได้ยินก็ได้ ไม่ได้ก็ไม่เป็นไร|
|**Ports (0–65535)**|ระบุบริการ|เบอร์ห้องของโปรแกรมในคอมพ์|

## ภาพจำง่าย

- **TCP = โทรศัพท์แบบฟังกันชัด** (มี confirm, มีลำดับ)
    
- **UDP = ตะโกนฝากข้อความ**
    
- **Port = เบอร์ห้องที่ต้องการให้ข้อมูลเข้าไป**



# **TH: บทนำ – Transport Layer คืออะไร?**

ชั้นนี้ทำให้ “โปรแกรมกับโปรแกรมคุยกันได้”  
ใช้ระบบ **Port** เพื่อระบุว่าแพ็กเก็ตควรเข้าโปรแกรมไหน

หน้าที่:

- ควบคุมความน่าเชื่อถือของการส่งข้อมูล
    
- ตรวจสอบลำดับ
    
- เชื่อมการทำงานระหว่างบริการต่าง ๆ
    

---

# **EN: Overview – What is the Transport Layer?**

This layer provides **end-to-end communication between applications**  
using **ports**.

Responsibilities:

- Reliability (TCP)
    
- Speed (UDP)
    
- Multiplexing via ports
    

Analogies:

- TCP = Phone call
    
- UDP = Shouting across room
    
- Ports = Room numbers
    

---

# **Protocol List**

### **1) TCP**

- TH: คุยแบบเชื่อถือได้ (มี ACK, ลำดับ, แก้ไขการสูญหาย)
    
- EN: Reliable, ordered, error-checked delivery
    
- ใช้กับ: Web, Email, SSH
    

ภาพจำ: โทรศัพท์ที่ต้องฟังกันรู้เรื่อง

---

### **2) UDP**

- TH: เร็ว ไม่สนว่าถึงหรือไม่
    
- EN: Fast, connectionless
    
- ใช้กับ: DNS, VoIP, Video streaming
    

ภาพจำ: ตะโกนส่งข้อความ

---

### **3) Ports**

- TH: เบอร์ห้องของบริการ
    
- EN: Identifiers for services
    
- ตัวอย่าง:
    
    - 53 = DNS
        
    - 80 = HTTP
        
    - 443 = HTTPS
        
    - 22 = SSH
        
    - 25 = SMTP
        

---

# **Teaching Notes**

- Demo: `ss -tulpn`, `netstat`, Wireshark (TCP 3-way handshake)
    
- เวลาแนะนำ: 15–20 นาที