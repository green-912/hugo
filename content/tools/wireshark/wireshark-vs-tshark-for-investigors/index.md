`---
title: "Wireshark vs Tshark  for  investigators"
date:  2025-12-17
draft: false
weight: 10

categories: ["Network Forensics","Tools"]
tags: ["wireshark","tshark","pcap","dfir","investigation","filters]
topics:
   - "Packet Analysis"
   - "Wireshark" 
   - "Tshark"
showtoc:  true
tocopen: true
comments: false
hidemeta: false
hideSummary: false
---

**TH:** Wireshark คือเครื่องมือวิเคราะห์แพ็กเก็ตแบบ GUI เหมาะกับการ “ดู–เล่าเรื่อง–สอน”  
TShark คือ CLI ที่ใช้เอนจินเดียวกัน เหมาะกับ “ทำงานอัตโนมัติ–ทำซ้ำ–สเกลบนเซิร์ฟเวอร์”

**EN:** Wireshark is the GUI for interactive visual analysis.  
TShark is the CLI counterpart using the same dissectors, ideal for automation and scalable workflows.


---
## 1) Investigator Mindset: “ดูให้เป็นระบบ”

**TH:** งานสืบสวนไม่ได้เริ่มจากเครื่องมือ แต่เริ่มจาก “คำถาม” เช่น

- ใครคุยกับใคร (who talks to whom)
    
- คุยกันเมื่อไหร่ (when)
    
- ใช้โปรโตคอลอะไร (what)
    
- มีหลักฐาน payload/metadata อะไรบ้าง (evidence)
    

**EN:** Start with questions (who/when/what/evidence), then choose the tool.

---
## 2) Wireshark vs TShark: เปรียบเทียบตรง ๆ

|Dimension|Wireshark (GUI)|TShark (CLI)|
|---|---|---|
|Primary use|Interactive analysis|Automation / batch processing|
|Environment|Desktop|Server/SSH/CI pipelines|
|Output|Visual views, graphs|Text/CSV/JSON/fields|
|Scale|Manual-friendly|High-scale friendly|
|Learning|Excellent|Requires filter literacy|
|Same dissectors?|Yes|Yes|

> Note: ทั้งสองใช้ “dissector engine” เดียวกัน ความแม่นในการ decode เทียบเท่า

----

## 3) เมื่อไหร่ควรใช้ Wireshark


ใช้ Wireshark เมื่อต้อง:

- Explore PCAP แบบ “ไล่สายตา” และหาจุดเริ่มต้น
    
- Follow Stream / ดู session context
    
- ใช้ Statistics, Conversations, IO Graph เพื่อเล่าเรื่องเชิงภาพ
    
- ทำ training / briefing
    

### 

Use Wireshark for interactive exploration, stream-following, statistics, and visual storytelling.

---
## 5) Investigator Workflow (แนะนำให้ใช้ “คู่กัน”)

### Step A — Triage ด้วย Wireshark (หา story)

**:** เปิด pcap แล้วตอบ 3 คำถามก่อน:

1. Top talkers / endpoints
    
2. Protocol distribution
    
3. Suspicious time windows
    

**EN:** Use Wireshark to map endpoints, protocols, and suspicious time windows.


### Step B — Extract หลักฐานด้วย TShark (ทำซ้ำ/ทำรายงาน)

**TH:** เลือก fields ที่จำเป็น แล้ว export เป็น CSV/JSON  
**EN:** Extract the required fields into structured data for reporting.

---
## 6) Practical Commands (TShark) สำหรับ Investigator

### 6.1 อ่านไฟล์ pcap + กรองด้วย Display Filter

```bash
tshark -r capture.pcap -Y "http.request"

```

### 6.2 Export เป็น fields (เหมาะกับทำตารางหลักฐาน)

```bash
tshark -r capture.pcap -Y "ip" \
  -T fields -E header=y -E separator=, \
  -e frame.time -e ip.src -e ip.dst -e ip.proto > evidence.csv


```

### 6.3 ดู “Conversations” แบบ CLI (ต้องการภาพรวมเร็ว)

```bash
tshark -r capture.pcap -q -z conv,ip

```

### 6.4 หา DNS queries

```bash
tshark -r capture.pcap -Y "dns.qry.name" -T fields -e frame.time -e ip.src -e dns.qry.name

```

### 6.5 แปลงเป็น JSON (ส่งต่อให้สคริปต์/ระบบอื่น)

```bash
tshark -r capture.pcap -T json > output.json

```

---

## 7) Filters ที่ควรรู้ (Wireshark/TShark ใช้ร่วมกันได้)

**Core display filters**

- `ip.addr == 10.10.10.10`
    
- `tcp.port == 443`
    
- `dns`
    
- `http.request`
    
- `tls.handshake`
    
- `tcp.analysis.retransmission`
    

> TH: พื้นฐานคือ “filter ให้เล็กลงเรื่อย ๆ”  
> EN: Narrow the scope iteratively.

---
## 8) Evidence Hygiene (ข้อควรระวังเชิงสืบสวน)



- เก็บ chain-of-custody ของ PCAP (hash/metadata)
    
- แยก “observations” ออกจาก “inference”
    
- export หลักฐานให้ reproducible (คำสั่งเดิมรันซ้ำได้)
    

**EN**

- Maintain chain-of-custody (hash/metadata), separate observation vs inference, and ensure reproducibility.



---

## 9) Vocabulary (TH+EN + Pronunciation)

|Term|อ่าน|TH|EN|
|---|---|---|---|
|Dissector|ดิ-เซค-เตอร์|ตัวถอดโปรโตคอล|protocol parser|
|Display filter|ดิส-เพลย์ ฟิล-เตอร์|กรองตอนแสดงผล|filter shown packets|
|Capture filter|แคพ-เชอร์ ฟิล-เตอร์|กรองตอนจับ|filter at capture time|
|Headless|เฮด-เลส|ไม่มี GUI|no graphical UI|
|Reproducible|รี-โพร-ดิว-ซิเบิล|ทำซ้ำได้ผลเดิม|repeatable results|


