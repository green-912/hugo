---
title: "Protocols in Link Layer – Ethernet / Wi-Fi / ARP / VLAN"
date: 2025-12-10
draft: false
weight: 10

categories: ["Networking", "Protocols"]
tags: ["protocols", "link-layer"]
topics: ["Link Layer", "Ethernet", "Wi-Fi", "ARP", "VLAN"]
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: บทนำ (สำหรับมือใหม่)
Layer 1 — Link Layer (OSI Layer 1–2)

“ชั้นที่อยู่ใกล้ลวด ใกล้สัญญาณ ใกล้ MAC Address”
Protocol / Technology พื้นฐาน

| Protocol           | ทำหน้าที่          | เข้าใจแบบง่าย               |
| ------------------ | ------------------ | --------------------------- |
| **Ethernet**       | ส่งข้อมูลใน LAN    | ภาษาที่ใช้คุยกันในวงแลน     |
| **Wi-Fi (802.11)** | ส่งข้อมูลแบบไร้สาย | LAN แบบไร้สาย               |
| **ARP**            | หา MAC จาก IP      | ถามว่า “IP นี้คือ MAC ใคร?” |
| **VLAN (802.1Q)**  | แบ่งเครือข่ายย่อย  | กั้นห้องภายในวง LAN         |

ภาพจำง่าย

    - Ethernet/Wi-Fi = ถนนชั้นล่างสุด

    - MAC address = บ้านเลขที่ในระดับชั้นล่าง

    - ARP = คนถามบ้านว่าเจ้าของชื่ออะไร


---

# **TH: บทนำ – Link Layer คืออะไร?**

Link Layer คือชั้นที่ใกล้ “สาย/สัญญาณ” ที่สุด ทำหน้าที่ส่งข้อมูลจากอุปกรณ์หนึ่งไปอีกอุปกรณ์หนึ่งที่อยู่ **ในเครือข่ายเดียวกัน (LAN)**  
ไม่ออกนอกวง ไม่ผ่าน Router

สิ่งที่เกิดขึ้นใน Layer นี้:

- ใช้ **MAC Address** ในการสื่อสาร
    
- จัดโครงสร้าง **Frame**
    
- ตรวจสอบความถูกต้องด้วย **FCS/CRC**
    
- ใช้ **ARP** เพื่อหา MAC ของปลายทาง
    
- แบ่งเครือข่ายภายในด้วย **VLAN**
    

เหมือนระบบ "ส่งของภายในหมู่บ้านเดียวกัน"

---

# **EN: Overview – What is the Link Layer?**

The Link Layer operates within a local network (LAN).  
It delivers frames between devices using **MAC addresses**.

Key responsibilities:

- Local delivery of frames
    
- Addressing with MAC
    
- ARP resolution
    
- Error checking (CRC)
    
- VLAN segmentation
    

Think of it as **local streets** inside a neighborhood.

---

# **Protocol List (TH + EN)**

### **1) Ethernet (LAN)**

- TH: โปรโตคอลหลักของ LAN แบบใช้สาย
    
- EN: Main wired LAN protocol
    
- ใช้: การส่ง frame ระหว่างอุปกรณ์ในวงเดียวกัน
    
- Packet unit: **Frame**
    

### **2) Wi-Fi (802.11)**

- TH: LAN แบบไร้สาย
    
- EN: Wireless LAN protocol
    
- ใช้เฟรมประเภทต่าง ๆ เช่น: Beacon, Probe, Data
    

### **3) ARP (Address Resolution Protocol)**

- TH: แปลง IP → MAC
    
- EN: Resolves IP to MAC
    
- ใช้เมื่อ: อุปกรณ์ต้องการส่ง frame ให้ปลายทาง แต่ยังไม่รู้ MAC
    

**ภาพจำ**: “ถามบ้านว่า MAC ใคร”

### **4) VLAN (802.1Q)**

- TH: แบ่งเครือข่ายเป็นกลุ่มย่อยในสวิตช์
    
- EN: Logical segmentation inside a switch
    
- ใช้: แยก traffic ระหว่างแผนกโดยไม่ต้องมี switch เพิ่ม
    

---

# **ตัวอย่างภาพเปรียบเทียบ**

- Ethernet/Wi-Fi = ถนนในหมู่บ้าน
    
- MAC Address = บ้านเลขที่
    
- ARP = คนเดินถามว่า “บ้านเลขที่นี้อยู่ไหน?”
    
- VLAN = แบ่งหมู่บ้านเป็นเขตๆ
    

---

# **Teaching Notes**

- ใช้ Wireshark ดู ARP / Ethernet Frame
    
- สาธิตด้วย `ip neigh` หรือ `arp -a`
    
- เวลาแนะนำ: 15–20 นาที