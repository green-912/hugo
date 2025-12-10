---
title: "Protocols in Application Layer – DNS / DHCP / HTTP / HTTPS / Email / SSH / FTP"
date: 2025-12-10
draft: false
weight: 40

categories: ["Networking", "Protocols"]
tags: ["protocols", "application-layer"]
topics: ["Application Layer", "DNS", "DHCP", "HTTP", "HTTPS", "Email", "SSH", "FTP"]
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: บทนำ (สำหรับมือใหม่)

# **Layer 4 — Application Layer (OSI Layer 5–7)**

“ชั้นบริการที่เราใช้งานจริง เช่น Web, Email, DNS”

## Protocol หลักที่ต้องรู้

|Protocol|ทำอะไร|ภาพจำง่าย|
|---|---|---|
|**DNS**|แปลงชื่อเว็บเป็น IP|สมุดโทรศัพท์|
|**DHCP**|แจก IP อัตโนมัติ|เจ้าหน้าที่ทะเบียน แจกบ้านเลขที่ใหม่|
|**HTTP/HTTPS**|เปิดเว็บ|ดูเว็บผ่านเบราว์เซอร์|
|**TLS/SSL**|เข้ารหัสข้อมูลเว็บ|ซองจดหมายกันอ่าน|
|**SMTP / IMAP / POP3**|อีเมล|ระบบไปรษณีย์สำหรับ Email|
|**SSH**|Remote Login|ประตูเข้าบ้านแบบใช้กุญแจพิเศษ|
|**FTP / SFTP**|รับส่งไฟล์|ขนของไป-กลับ|

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