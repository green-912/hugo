#!/usr/bin/env bash
# Chapter 08 – Protocols Deep Dive (เวอร์ชันลึก แยกจาก 04-protocols พื้นฐาน)
# ใช้งาน: ./scripts/create_08_protocols_deep.sh

set -euo pipefail

CONTENT_DIR="${1:-content/networking/08-protocols-deep}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 08 – Protocols Deep Dive under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

create_page() {
  local path="$1"        # ไฟล์ .md
  local title="$2"       # title
  local weight="$3"      # weight
  local slug="$4"        # ใช้ใน tags
  local topics_csv="$5"  # รายการ topics คั่นด้วย comma (หรือ "")

  mkdir -p "$(dirname "$path")"

  # topics: inline array
  local topics_line
  if [[ -n "$topics_csv" ]]; then
    IFS=',' read -ra arr <<< "$topics_csv"
    topics_line="topics: ["
    local first=1
    for t in "${arr[@]}"; do
      local t_trimmed
      t_trimmed="$(echo "$t" | xargs)"
      if [[ $first -eq 0 ]]; then
        topics_line+=", "
      fi
      topics_line+="\"$t_trimmed\""
      first=0
    done
    topics_line+="]"
  else
    topics_line="topics: [\"$slug\"]"
  fi

  cat <<EOF > "$path"
---
title: "$title"
date: $TODAY
draft: false
weight: $weight

categories: ["Networking", "Protocols Deep Dive"]
tags: ["protocols-deep", "$slug"]
$topics_line
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: ภาพรวมเชิงลึก (Deep Overview – TH)

(อธิบายโปรโตคอลนี้แบบเชิงลึก:
- ทำงานอย่างไรตามลำดับขั้น (message flow)
- Field สำคัญใน Header / Options
- จุดที่ใช้ตรวจหาผิดปกติ / หลักฐานในงานสืบสวน)

## EN: Deep Overview (EN)

(Explain the protocol workflow in detail:
- Message sequence
- Critical header fields / options
- Forensic / detection points)

---

## Packet Structure & Fields

(สรุปโครงสร้าง packet แบบเป็นหัวข้อ  
เน้น field ที่ควรโฟกัสเมื่อเปิดใน Wireshark / Zeek / Suricata)

---

## Normal vs Abnormal Behaviour

- พฤติกรรมปกติ (Normal pattern)
- พฤติกรรมผิดปกติ (Suspicious pattern)
- ตัวอย่าง Filter / Rule ที่ใช้จับ

---

## Forensic / Detection Notes

(แนวคิดสำหรับ:
- ใช้ใน Labs
- ใช้ใน Case Study
- ใช้ใน Incident จริง)

---

## Teaching Notes

- ระดับผู้เรียนที่เหมาะ: Intermediate / Advanced
- Lab ที่ควรผูก เช่น 06-labs, 07-case-studies
- จุดที่ควรเน้นตอนสอนสด
EOF
}

###############################################
# _index.md – หน้า Chapter 08
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "08 – Protocols Deep Dive – โปรโตคอลเชิงลึก"
date: $TODAY
draft: false
weight: 80

categories: ["Networking", "Protocols Deep Dive"]
tags: ["networking", "protocols", "deep-dive"]
topics: ["Deep Protocol Analysis", "Forensics", "Detection"]

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: Chapter 8 – Protocols Deep Dive

บทนี้ต่อยอดจาก:
- 04 – Basic Protocols (พื้นฐาน)  
- 05 – Tools  
- 06 – Labs  
- 07 – Case Studies  

โฟกัสที่:
- โครงสร้าง packet และ field สำคัญ
- พฤติกรรมปกติ vs ผิดปกติของแต่ละโปรโตคอล
- มุมมองเชิง Forensic / Detection (ใช้ใน SOC / DFIR)

## EN: Chapter 8 – Protocols Deep Dive

This chapter is designed for advanced learners and practitioners.  
It connects protocol internals with real-world detection and forensics.
EOF

###############################################
# 1) ARP / ICMP / DHCP / DNS (Core Infra)
###############################################

create_page "$CONTENT_DIR/01-arp-deep.md" \
  "ARP Deep Dive – Caching, Spoofing & Detection" \
  10 \
  "arp-deep" \
  "ARP,Cache,Spoofing,Layer2"

create_page "$CONTENT_DIR/02-icmp-deep.md" \
  "ICMP Deep Dive – Types, Codes & Abuse" \
  20 \
  "icmp-deep" \
  "ICMP,Types,Codes,Tunneling"

create_page "$CONTENT_DIR/03-dhcp-deep.md" \
  "DHCP Deep Dive – Lease Process, Options & Attacks" \
  30 \
  "dhcp-deep" \
  "DHCP,Lease,Options,Rogue Server"

create_page "$CONTENT_DIR/04-dns-deep.md" \
  "DNS Deep Dive – Records, Caching & Tunneling" \
  40 \
  "dns-deep" \
  "DNS,RR,Cache,Tunneling"

###############################################
# 2) HTTP / HTTPS / TLS
###############################################

create_page "$CONTENT_DIR/05-http-deep.md" \
  "HTTP Deep Dive – Methods, Headers & Abnormal Patterns" \
  50 \
  "http-deep" \
  "HTTP,Methods,Headers,Abuse"

create_page "$CONTENT_DIR/06-https-tls-deep.md" \
  "HTTPS / TLS Deep Dive – Handshake, Cipher Suites & Anomalies" \
  60 \
  "tls-deep" \
  "TLS,Handshake,Ciphers,Anomalies"

###############################################
# 3) SSH / Email / NTP
###############################################

create_page "$CONTENT_DIR/07-ssh-deep.md" \
  "SSH Deep Dive – Key Exchange, Auth & Abuse" \
  70 \
  "ssh-deep" \
  "SSH,Key Exchange,Auth,Brute Force"

create_page "$CONTENT_DIR/08-email-deep.md" \
  "Email Protocols Deep Dive – SMTP / POP3 / IMAP Behaviours" \
  80 \
  "email-deep" \
  "SMTP,IMAP,POP3,Abuse,Spam"

create_page "$CONTENT_DIR/09-ntp-deep.md" \
  "NTP Deep Dive – Time Sync, Amplification & Detection" \
  90 \
  "ntp-deep" \
  "NTP,Time Sync,Amplification"

###############################################
# 4) SMB / SNMP / Misc
###############################################

create_page "$CONTENT_DIR/10-smb-deep.md" \
  "SMB Deep Dive – Sessions, Shares & Lateral Movement" \
  100 \
  "smb-deep" \
  "SMB,Shares,Lateral Movement"

create_page "$CONTENT_DIR/11-snmp-deep.md" \
  "SNMP Deep Dive – Communities, OIDs & Misconfigurations" \
  110 \
  "snmp-deep" \
  "SNMP,Monitoring,Weak Community"

echo "Done. Chapter 08 – Protocols Deep Dive created at: $CONTENT_DIR"

