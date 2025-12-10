#!/usr/bin/env bash
# Chapter 04 – Protocols by Layer (พื้นฐาน แยกตาม Layer)
# ใช้งาน: ./scripts/create_04_protocols.sh

set -euo pipefail

CONTENT_DIR="${1:-content/networking/04-protocols}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 04 – Protocols by Layer under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

create_page() {
  local path="$1"        # ไฟล์ .md
  local title="$2"       # title
  local weight="$3"      # weight
  local slug="$4"        # ใช้ใน tags
  local topics_csv="$5"  # รายการ topics คั่นด้วย comma (หรือ "")

  mkdir -p "$(dirname "$path")"

  # topics: inline array เช่น topics: ["Link Layer","Ethernet","ARP"]
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

categories: ["Networking", "Protocols"]
tags: ["protocols", "$slug"]
$topics_line
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: บทนำ (สำหรับมือใหม่)

(อธิบายหัวข้อนี้แบบง่าย ๆ:
- Layer นี้คืออะไร
- โปรโตคอลใน Layer นี้ทำหน้าที่อะไรโดยรวม
- ผู้เรียนควรเห็น “ภาพใหญ่แบบไหน”)

## EN: Overview (Beginner Friendly)

(Explain:
- What this layer is responsible for
- What kind of protocols live here
- How it fits into the end-to-end communication.)

---

## Protocol List (TH+EN)

(สรุปรายชื่อโปรโตคอลใน Layer นี้ และบทบาทสั้น ๆ)

---

## ตัวอย่างภาพเปรียบเทียบ

(ใช้เปรียบเทียบ เช่น ถนน, บ้านเลขที่, เบอร์ห้อง, สมุดโทรศัพท์ ฯลฯ)

---

## Teaching Notes

- เวลาแนะนำ: XX นาที  
- Chapter ก่อนหน้า/ถัดไปที่เชื่อมโยง  
- Demo แนะนำ (เช่น Wireshark, ping, traceroute ฯลฯ)
EOF
}

###############################################
# _index.md – หน้า Chapter 04 ทั้งบท
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "04 – Protocols by Layer – โปรโตคอลตามเลเยอร์"
date: $TODAY
draft: false
weight: 40

categories: ["Networking", "Protocols"]
tags: ["networking", "protocols", "by-layer"]
topics: ["Basic Protocols", "Layered View"]

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: Chapter 4 – โปรโตคอลตามเลเยอร์ (ภาพใหญ่ที่สมองจัดง่าย)

Chapter นี้ช่วยให้ผู้เรียนมองโปรโตคอลแบบเป็น “ชั้น ๆ”  
สอดคล้องกับ TCP/IP Model 4 Layers:

- Link Layer  
- Internet Layer  
- Transport Layer  
- Application Layer  

แทนที่จะจำโปรโตคอลแบบกระจัดกระจาย เราจะจัดเป็น Block ตาม Layer  
เพื่อให้เวลาเห็นชื่อ ARP, IP, TCP, DNS, HTTP, DHCP ฯลฯ  
สมองจะรู้ทันทีว่า “อยู่เลเยอร์ไหน ทำหน้าที่อะไร”

## EN: Chapter 4 – Protocols by Layer

We organize all core protocols **by layer** so that learners can build  
a structured mental model instead of memorizing random names.
EOF

###############################################
# บทที่ 1 – Link Layer Protocols
###############################################

create_page "$CONTENT_DIR/01-link-layer-protocols.md" \
  "Protocols in Link Layer – Ethernet / Wi-Fi / ARP / VLAN" \
  10 \
  "link-layer" \
  "Link Layer,Ethernet,Wi-Fi,ARP,VLAN"

###############################################
# บทที่ 2 – Internet Layer Protocols
###############################################

create_page "$CONTENT_DIR/02-internet-layer-protocols.md" \
  "Protocols in Internet Layer – IP / ICMP / Routing / NAT" \
  20 \
  "internet-layer" \
  "Internet Layer,IP,ICMP,Routing,NAT"

###############################################
# บทที่ 3 – Transport Layer Protocols
###############################################

create_page "$CONTENT_DIR/03-transport-layer-protocols.md" \
  "Protocols in Transport Layer – TCP / UDP / Ports" \
  30 \
  "transport-layer" \
  "Transport Layer,TCP,UDP,Ports"

###############################################
# บทที่ 4 – Application Layer Protocols
###############################################

create_page "$CONTENT_DIR/04-application-layer-protocols.md" \
  "Protocols in Application Layer – DNS / DHCP / HTTP / HTTPS / Email / SSH / FTP" \
  40 \
  "application-layer" \
  "Application Layer,DNS,DHCP,HTTP,HTTPS,Email,SSH,FTP"

echo "Done. Chapter 04 – Protocols by Layer created at: $CONTENT_DIR"

