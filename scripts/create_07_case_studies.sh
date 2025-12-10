#!/usr/bin/env bash
# Chapter 07 – Case Studies (Network Incidents / Investigations)

set -euo pipefail

CONTENT_DIR="${1:-content/networking/07-case-studies}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 07 – Case Studies under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

create_case() {
  local path="$1"
  local title="$2"
  local weight="$3"
  local slug="$4"
  local topics="$5"

  mkdir -p "$(dirname "$path")"

  # convert topics CSV → YAML
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

categories: ["Networking", "Case Studies"]
tags: ["case-study", "$slug"]
topics:
$(printf "%b" "$topics_yaml")

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

# Case Study: $title

## TH: บริบทเหตุการณ์ (Context)

(สรุปสถานการณ์ เช่น อาการที่พบ, ผู้แจ้งเหตุ, พื้นที่เครือข่ายที่เกี่ยวข้อง  
อธิบายให้ผู้อ่านเห็น “จุดเริ่มต้นของเหตุการณ์”)

## EN: Incident Context

(Explain symptoms, environment, what triggered the investigation.)

---

## Evidence (หลักฐานที่ผู้สืบสวนได้รับ)

- PCAP / Logs  
- ผู้ใช้แจ้งว่า…  
- Firewall หรือ NAT มีข้อความ…  
- Packet Pattern น่าสงสัย…  

(ใส่ตารางหรือ bullets เพิ่มได้)

---

## Investigation Steps (ขั้นตอนสืบสวน)

### 1. Formulate Initial Hypothesis  
(TH + EN)

### 2. Inspect Key Packets  
- Wireshark Filter  
- Expected behavior vs abnormal behavior

### 3. Correlate Across Layers  
(เชื่อม OSI/TCP-IP/Protocols)

### 4. Validate Hypothesis  
(ยืนยันจากหลักฐาน)

---

## Findings (สิ่งที่ค้นพบ)

- รายละเอียดสาเหตุ  
- โปรโตคอลที่เกี่ยวข้อง  
- ลักษณะผิดปกติใน Packet/Logs  

---

## Root Cause (สาเหตุหลัก)

(เขียนทั้ง TH + EN)

---

## Mitigation & Prevention (แนวทางแก้ไข/ป้องกัน)

- Immediate fix  
- Long-term prevention  
- Hardening ที่ควรทำ

---

## Instructor Notes

- จุดที่ผู้เรียนมักเข้าใจผิด  
- ควรเน้นจุดไหนเป็นพิเศษ  
- PCAP ที่ควรเตรียม  
EOF
}

###############################################
# _index.md – หน้า Chapter 07
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "07 – Case Studies – เหตุการณ์จริงและการสืบสวน"
date: $TODAY
draft: false
weight: 70

categories: ["Networking", "Case Studies"]
tags: ["case-study", "incident", "investigation"]
topics:
  - "Network Forensics"
  - "Incident Response"
  - "Traffic Investigation"

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: Chapter 7 – Case Studies

บทที่สอน “ทักษะนักสืบเครือข่าย”  
ฝึกมองเหตุการณ์ในโลกจริง, วิเคราะห์พฤติกรรม, และระบุสาเหตุหลักของปัญหา  
เป็นบทสำคัญสำหรับงาน SOC / DFIR / Network Investigation

## EN: Chapter 7 – Real-world Network Investigations

This chapter provides realistic scenarios that simulate how investigators  
examine network events using packets, logs, and hypothesis-driven analysis.
EOF

###############################################
#  กลุ่ม Case Studies (รวม 8 เคสเริ่มต้น)
###############################################

# 01 – ARP Spoofing Attack
create_case "$CONTENT_DIR/01-arp-spoofing.md" \
  "ARP Spoofing Attack – การปลอม MAC เพื่อดักข้อมูล" \
  10 \
  "arp-spoofing" \
  "ARP,MITM,Layer2"

# 02 – DNS Poisoning
create_case "$CONTENT_DIR/02-dns-poisoning.md" \
  "DNS Poisoning – การตอบ DNS ปลอม" \
  20 \
  "dns-poisoning" \
  "DNS,Attack,Name Resolution"

# 03 – Slow Network Analysis
create_case "$CONTENT_DIR/03-slow-network.md" \
  "Slow Network Investigation – เครือข่ายช้า เกิดจากอะไร?" \
  30 \
  "slow-network" \
  "Performance,TCP,RTO,Retransmission"

# 04 – Suspicious Retransmissions
create_case "$CONTENT_DIR/04-tcp-retransmissions.md" \
  "Suspicious TCP Retransmissions – การสูญหายของแพ็กเก็ต" \
  40 \
  "tcp-retransmissions" \
  "TCP,RTO,Loss"

# 05 – Unauthorized Port Scanning
create_case "$CONTENT_DIR/05-portscan.md" \
  "Unauthorized Port Scanning – การตรวจพอร์ตผิดปกติ" \
  50 \
  "port-scan" \
  "Nmap,Recon,TCP-SYN"

# 06 – Malware C2 Traffic Pattern
create_case "$CONTENT_DIR/06-malware-c2.md" \
  "Malware C2 Traffic – พฤติกรรม Command & Control" \
  60 \
  "malware-c2" \
  "C2,Beaconing,Threat"

# 07 – Data Exfiltration via DNS
create_case "$CONTENT_DIR/07-dns-exfiltration.md" \
  "Data Exfiltration via DNS – การขโมยข้อมูลผ่าน DNS" \
  70 \
  "dns-exfiltration" \
  "DNS,Tunneling,Data Theft"

# 08 – HTTPS Anomaly Detection
create_case "$CONTENT_DIR/08-https-anomaly.md" \
  "HTTPS Anomaly – TLS Handshake ที่ผิดปกติ" \
  80 \
  "https-anomaly" \
  "TLS,HTTPS,Weird Handshake"

echo "Done. Chapter 07 – Case Studies created at: $CONTENT_DIR"

