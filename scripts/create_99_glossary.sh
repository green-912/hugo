#!/usr/bin/env bash
# Chapter 99 – Glossary (A–Z glossary for Networking)
# ใช้ PaperMod + taxonomies แบบเดียวกับทั้ง Site

set -euo pipefail

CONTENT_DIR="${1:-content/networking/99-glossary}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 99 – Glossary under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

###############################################
# 0) _index.md — หน้า Glossary หลัก
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "99 – Glossary – พจนานุกรมคำศัพท์ Networking"
date: $TODAY
draft: false
weight: 990

categories: ["Networking", "Glossary"]
tags: ["glossary", "dictionary", "network-terms"]
topics:
  - "Terms"
  - "Definitions"
  - "Vocabulary"

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: พจนานุกรมคำศัพท์ Networking (TH + EN)

รวบรวมคำศัพท์สำคัญในโลกเครือข่าย  
เช่น OSI, TCP/IP, Protocol, Security, Tools, Wireshark, Logs  

เหมาะสำหรับ:
- ผู้เรียนใหม่  
- ผู้สอน  
- ผู้ทำงานด้าน Network / SOC / DFIR  
- การเตรียมสอบ CompTIA / CCNA  

## EN: Networking Glossary

This glossary consolidates essential terminology  
used in networking, security analysis, and protocol studies.

---

เลือกหมวดตัวอักษร A–Z จากลิสต์ด้านล่าง
EOF

###############################################
# 1) Template สำหรับไฟล์ A–Z
###############################################

create_letter_file() {
  local letter="$1"
  local weight="$2"
  local file="$CONTENT_DIR/${letter}.md"

cat <<EOF > "$file"
---
title: "Glossary – ${letter^^}"
date: $TODAY
draft: false
weight: $weight

categories: ["Networking", "Glossary"]
tags: ["glossary", "${letter}"]
topics:
  - "Terms: ${letter^^}"

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

# Glossary: ${letter^^}

รายการคำศัพท์ที่ขึ้นต้นด้วยตัวอักษร **${letter^^}**

---

## ตัวอย่างรูปแบบการเพิ่มคำศัพท์

### **ARP (Address Resolution Protocol)**  
**TH:** โปรโตคอลสำหรับแปลง IP → MAC Address  
**EN:** Resolves IPv4 addresses to MAC addresses  
**Category:** Protocol / Layer 2  
**ใช้เมื่อ:** ต้องการหา MAC ของปลายทางใน LAN  

---

### **ACK (Acknowledgment)**  
**TH:** การตอบรับว่ารับข้อมูลแล้ว  
**EN:** A signal indicating successful receipt of data  
**Category:** TCP / Transport Layer  

---

## เพิ่มคำศัพท์ใหม่ด้านล่างนี้
EOF
}

###############################################
# 2) สร้างไฟล์ A–Z พร้อม weight
###############################################

letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

weight=1
for letter in "${letters[@]}"; do
  create_letter_file "$letter" "$weight"
  weight=$((weight + 1))
done

echo "Done. Chapter 99 – Glossary created at: $CONTENT_DIR"

