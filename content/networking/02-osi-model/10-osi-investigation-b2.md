---
title: "OSI Model – Advanced Investigation (B2 Level)"
weight: 10
categories: ["OSI"]
topics: ["Investigation", "Advanced"]
---

# TH: OSI Model ในมุมมองมืออาชีพ (Advanced – B2)

ระดับนี้เหมาะกับ:
- วิศวกรเครือข่าย  
- Cybersecurity analysts  
- Instructor / ผู้บรรยายระดับองค์กร  
- ผู้ที่ต้องวิเคราะห์เหตุขัดข้องเชิงลึกในระบบเครือข่าย  

โฟกัสคือการใช้ OSI เพื่อ "แยกชั้นของปัญหา" และเข้าใจ flow จริงของแพ็กเก็ตในแต่ละชั้น

---

## TH: การวิเคราะห์ตาม Layer (Layer-Based Investigation)

### Layer 1 – Physical

อาการผิดปกติที่มักพบ:
- Duplex mismatch (ฝั่งหนึ่ง Full, อีกฝั่ง Half)  
- CRC error สูงผิดปกติ  
- Interface flapping (ลิงก์ล้ม–ขึ้นบ่อย)  
- ปัญหา MTU ที่ทำให้ downstream fragmentation  

การตรวจสอบตัวอย่าง:
- Cisco: `show interface`  
- Linux:  
  - `ip -s link`  
  - `ethtool <interface>`  

---

### Layer 2 – Data Link

อาการผิดปกติระดับ B2:
- MAC flapping → MAC เดียวโผล่หลายพอร์ต สลับไปมา  
- การใช้ ARP ในรูปแบบผิดปกติ (เช่น ARP reply จำนวนมากโดยไม่มี ARP request)  
- VLAN tag ไม่ตรงกัน (access/ trunk ผิด config)  

การตรวจสอบ:
- ตรวจ MAC-address table บนสวิตช์  
- ตรวจ ARP cache บนอุปกรณ์ปลายทาง  

---

### Layer 3 – Network

ปัญหาที่ต้องวิเคราะห์:
- Routing loop  
- เส้นทางไม่ตรงกับที่ออกแบบ (ผิด route)  
- Subnet overlap ระหว่าง network ต่างหน่วยงาน  
- TTL ลดลงผิดปกติ (วิ่งอ้อมเกินควร)  

แนวคิดการไล่ตรวจ:
1. ตรวจ routing table บนอุปกรณ์หลัก  
2. ใช้ `traceroute` / `tracert` ดู path จริง  
3. ตรวจ ICMP error (destination unreachable, time exceeded)  

---

### Layer 4 – Transport

สิ่งที่ต้องดูเชิงลึก:
- SYN retry / SYN timeout  
- Connection reset (RST) โดย firewall หรือปลายทาง  
- Retransmission / Duplicate ACK บ่งชี้คุณภาพลิงก์ไม่ดีหรือ congestion  

ตัวอย่าง Wireshark display filter:
tcp.analysis.retransmission
tcp.flags.syn == 1
tcp.flags.reset == 1

### Layer 5–7 – กลุ่มชั้นด้านบน (Session / Presentation / Application)

ในระดับ B1 อาจพูดรวมๆ แต่ B2 จะเริ่มดู:

- SSL/TLS handshake เบื้องต้น (ดูว่าเจรจาสำเร็จหรือไม่)
    
- HTTP error pattern (4xx, 5xx ผิดปกติ)
    
- DNS resolution ผิด เช่นตอบ IP ผิด / NXDOMAIN ผิดเวลา
    

---

## EN: OSI for Advanced Analysts (B2)

This level is aimed at:

- Network engineers
    
- Security analysts
    
- Trainers and technical leads
    

The main goal is to apply the OSI model as a structured troubleshooting and investigation framework.

### Layer 1

Look for:

- Duplex mismatches
    
- High CRC error counts
    
- Link flapping
    
- MTU-related issues causing fragmentation
    

### Layer 2

Look for:

- MAC flapping
    
- ARP anomalies
    
- VLAN misconfiguration (wrong tagging/untagging)
    

### Layer 3

Look for:

- Routing loops
    
- Incorrect routes
    
- Subnet overlap
    
- Abnormal TTL patterns
    

### Layer 4

Look for:

- SYN timeouts
    
- Excessive retransmissions
    
- RST storms caused by firewalls or endpoints
    

### Layer 5–7

Look for:

- SSL/TLS negotiation failures
    
- HTTP error spikes
    
- DNS misconfiguration or wrong responses
    

---

## TH: สรุประดับ B2

ระดับ B2 เน้นมุมมองของ "Network Troubleshooting Professional"  
เมื่อคุ้นกับการใช้ OSI ในระดับนี้แล้ว จะสามารถต่อยอดไปสู่ระดับ B3  
ซึ่งใช้ OSI เชื่อมกับ Incident Response / DFIR / Threat Hunting ได้อย่างเต็มรูปแบบ  
