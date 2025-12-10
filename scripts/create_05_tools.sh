#!/usr/bin/env bash
# Chapter 05 – Tools for Networking + Traffic Analysis
# ใช้ฟอร์แมตเดียวกับ Chapter 01–04

set -euo pipefail

CONTENT_DIR="${1:-content/networking/05-tools}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 05 – Tools under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

create_page() {
  local path="$1"
  local title="$2"
  local weight="$3"
  local slug="$4"
  local topics="$5"

  mkdir -p "$(dirname "$path")"

  # convert topics CSV ⇒ YAML
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

categories: ["Networking", "Tools"]
tags: ["tools", "$slug"]
topics:
$(printf "%b" "$topics_yaml")

showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: ภาพรวม / Concept (TH)

(อธิบายเครื่องมือนี้ไว้ใช้ทำอะไร  
อยู่เลเยอร์ใด, ใช้ในงานวิเคราะห์อะไร  
ข้อดี จุดเด่น เหมาะกับสถานการณ์แบบไหน)

## EN: Overview (EN)

(Explain the tool's purpose, usage scope, strengths, limitations.)

---

## Key Concepts (TH+EN)

- Concept 1  
- Concept 2  
- Concept 3  

---

## Example Commands

\`\`\`bash
# example here
\`\`\`

---

## Teaching Notes

- เวลาแนะนำ: XX นาที  
- Demo ที่ควรใช้  
- Lab ที่ต่อได้จากหัวข้อนี้  
EOF
}

###############################################
# _index.md – หน้า Chapter 05
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "05 – Tools – เครื่องมือวิเคราะห์เครือข่าย"
date: $TODAY
draft: false
weight: 50

categories: ["Networking", "Tools"]
tags: ["networking", "tools"]
topics:
  - "Wireshark"
  - "tcpdump"
  - "Zeek"
  - "Suricata"

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: Chapter 5 – Tools สำหรับงานเครือข่าย

บทนี้รวบรวมเครื่องมือที่จำเป็นสำหรับ  
- วิเคราะห์ทราฟฟิก  
- ตรวจสอบเหตุการณ์  
- ทำ Labs สำหรับสอน  
- มองภาพเชิงลึกของเครือข่าย  

## EN: Chapter 5 – Networking & Analysis Tools

A curated collection of essential tools for  
traffic inspection, troubleshooting, and teaching labs.
EOF

###############################################
# 1) Packet Analysis Tools
###############################################

create_page "$CONTENT_DIR/01-wireshark.md" \
  "Wireshark – Packet Analysis GUI" \
  10 \
  "wireshark" \
  "Packet Analysis,GUI"

create_page "$CONTENT_DIR/02-tcpdump.md" \
  "tcpdump – Command-line Packet Capture" \
  20 \
  "tcpdump" \
  "Packet Capture,CLI"

create_page "$CONTENT_DIR/03-tshark.md" \
  "Tshark – Wireshark CLI Engine" \
  30 \
  "tshark" \
  "Wireshark CLI,Packet Decode"

###############################################
# 2) Network Visibility & Logging Tools
###############################################

create_page "$CONTENT_DIR/04-zeek.md" \
  "Zeek – Network Security Monitoring" \
  40 \
  "zeek" \
  "Network Monitoring,Logs"

create_page "$CONTENT_DIR/05-suricata.md" \
  "Suricata – IDS/IPS + Network Analysis" \
  50 \
  "suricata" \
  "IDS,IPS,Detection"

###############################################
# 3) Scanning & Enumeration Tools
###############################################

create_page "$CONTENT_DIR/06-nmap.md" \
  "Nmap – Port Scanning & Host Discovery" \
  60 \
  "nmap" \
  "Port Scan,Service Detection"

create_page "$CONTENT_DIR/07-netcat.md" \
  "Netcat – Swiss Army Knife" \
  70 \
  "netcat" \
  "TCP/UDP Tools,Debug"

###############################################
# 4) DNS / Routing Tools
###############################################

create_page "$CONTENT_DIR/08-dig-nslookup.md" \
  "dig / nslookup – DNS Diagnostic Tools" \
  80 \
  "dig" \
  "DNS Tools,Query"

create_page "$CONTENT_DIR/09-traceroute-mtr.md" \
  "traceroute / mtr – Path Tracing" \
  90 \
  "traceroute" \
  "Path Trace,Routing"

###############################################
# 5) System Tools (Linux Networking Basics)
###############################################

create_page "$CONTENT_DIR/10-ip-ss-tools.md" \
  "ip / ss – Modern Linux Network Tools" \
  100 \
  "ip-ss" \
  "Linux Tools,Interfaces,Sockets"

echo "Done. Chapter 05 – Tools created at: $CONTENT_DIR"

