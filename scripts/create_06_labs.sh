#!/usr/bin/env bash
# Chapter 06 – Labs
# รองรับการสร้าง Labs แบบเป็นหมวด (OSI / TCP-IP / Protocol / Tools)

set -euo pipefail

CONTENT_DIR="${1:-content/networking/06-labs}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 06 – Labs under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

create_lab() {
  local path="$1"
  local title="$2"
  local weight="$3"
  local slug="$4"
  local topics="$5"

  mkdir -p "$(dirname "$path")"

  # convert CSV → YAML list
  local topics_yaml=""
  IFS=',' read -ra arr <<< "$topics"
  for t in "${arr[@]}"; do
    topics_yaml+="  - \"$(echo "$t" | xargs)\"\n"
  done

cat <<EOF > "$path"
---
title: "$title"
date: $TODAY
draft: false
weight: $weight

categories: ["Networking", "Labs"]
tags: ["lab", "$slug"]
labs: ["$slug"]
topics:
$(printf "%b" "$topics_yaml")

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

# LAB: $title

## Objective (วัตถุประสงค์)

- ผู้เรียนจะเข้าใจ…
- ผู้เรียนสามารถสังเกต…
- ผู้เรียนสามารถวิเคราะห์…

---

## Background (พื้นฐานก่อนเริ่ม)

(อธิบายพื้นหลังของโปรโตคอลหรือเครื่องมือที่เกี่ยวข้อง)

---

## Requirements

- PCAP (แนบ path หรืออธิบายวิธีโหลด)
- Tools: Wireshark / tcpdump / Zeek / Suricata
- ระบบปฏิบัติการใดรองรับ

---

## Steps

### 1. เริ่มต้นการสังเกต Traffic
คำอธิบาย + ตัวอย่าง Filter  
\`\`\`
ตัวอย่างคำสั่ง หรือ filter
\`\`\`

### 2. วิเคราะห์ Packet ตามลำดับ
(อธิบาย Step-by-step แบบสอนสดได้)

### 3. ตอบคำถามสำคัญ
- Q1: …  
- Q2: …  
- Q3: …  

---

## Expected Outcome (ผลลัพธ์ที่คาดว่าได้)

(ผู้เรียนควรเห็นอะไรใน Wireshark / logs)

---

## Instructor Notes (เฉพาะผู้สอน)

- วิธีอธิบายให้เข้าใจเร็ว
- จุดที่ผู้เรียนมักผิดพลาด
- Demo ที่ควรทำให้ดู
EOF
}

###############################################
# _index.md – หน้า Chapter 06
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "06 – Labs – แบบฝึกปฏิบัติ"
date: $TODAY
draft: false
weight: 60

categories: ["Networking", "Labs"]
tags: ["labs", "networking"]
topics:
  - "Hands-on Labs"
  - "Packet Analysis Labs"

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: Chapter 6 – Labs

บทนี้คือชุดแบบฝึกปฏิบัติสำหรับการสอนออนไลน์  
ต่อยอดจาก Chapter 01–05 เช่น:

- OSI Layer Labs  
- TCP/IP Labs  
- Protocol Labs (ARP / DHCP / DNS / HTTP / TLS)  
- Wireshark Labs  
- tcpdump / Zeek / Suricata Labs  

เหมาะสำหรับสอนสด, อบรมหน่วยงาน, หรือให้ผู้เรียนไปทำต่อเอง

## EN: Chapter 6 – Hands-on Labs

This chapter provides all hands-on exercises  
to reinforce OSI, TCP/IP, protocols, and tool usage.
EOF


###############################################
# 1) OSI Labs
###############################################

create_lab "$CONTENT_DIR/01-osi-l1-l7-walkthrough.md" \
  "OSI Layer Walkthrough – มอง Packet แบบ 7 เลเยอร์" \
  10 \
  "osi-walkthrough" \
  "OSI,Packet Walkthrough,Layers"

create_lab "$CONTENT_DIR/02-encapsulation-lab.md" \
  "Encapsulation & Decapsulation Lab" \
  20 \
  "encapsulation" \
  "OSI,Encapsulation,Decapsulation"

###############################################
# 2) TCP/IP Labs
###############################################

create_lab "$CONTENT_DIR/03-tcp-handshake-lab.md" \
  "TCP 3-Way Handshake Lab" \
  30 \
  "tcp-handshake" \
  "TCP,Handshake,Transport Layer"

create_lab "$CONTENT_DIR/04-udp-traffic-lab.md" \
  "UDP Traffic Analysis Lab" \
  40 \
  "udp-lab" \
  "UDP,Transport Layer"

###############################################
# 3) Protocol Labs
###############################################

create_lab "$CONTENT_DIR/05-arp-lab.md" \
  "ARP Resolution Lab – การแก้ที่อยู่ MAC" \
  50 \
  "arp" \
  "ARP,Layer2,Address Resolution"

create_lab "$CONTENT_DIR/06-dhcp-lab.md" \
  "DHCP Lab – Discover / Offer / Request / ACK" \
  60 \
  "dhcp" \
  "DHCP,IP Assignment"

create_lab "$CONTENT_DIR/07-dns-lab.md" \
  "DNS Query/Response Lab" \
  70 \
  "dns" \
  "DNS,Name Resolution"

create_lab "$CONTENT_DIR/08-http-lab.md" \
  "HTTP Lab – Request / Response / Headers" \
  80 \
  "http" \
  "HTTP,Layer7,Web"

create_lab "$CONTENT_DIR/09-tls-handshake-lab.md" \
  "TLS Handshake Lab – ClientHello / ServerHello" \
  90 \
  "tls" \
  "TLS,HTTPS,Encryption"

###############################################
# 4) Tools Labs (Wireshark / tcpdump / Zeek / Suricata)
###############################################

create_lab "$CONTENT_DIR/10-wireshark-filtering-lab.md" \
  "Wireshark Filtering Lab – Basic to Advanced" \
  100 \
  "wireshark-filters" \
  "Wireshark,Filters"

create_lab "$CONTENT_DIR/11-tcpdump-capture-lab.md" \
  "tcpdump Capture Lab – CLI Packet Capture" \
  110 \
  "tcpdump" \
  "tcpdump,Capture"

create_lab "$CONTENT_DIR/12-zeek-logs-lab.md" \
  "Zeek Logs Lab – HTTP / DNS / Weird Log" \
  120 \
  "zeek" \
  "Zeek,Network Logs"

create_lab "$CONTENT_DIR/13-suricata-alerts-lab.md" \
  "Suricata Alerts Lab – IDS/IPS Event Analysis" \
  130 \
  "suricata" \
  "Suricata,IDS,IPS"

echo "Done. Chapter 06 – Labs created at: $CONTENT_DIR"

