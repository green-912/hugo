#!/usr/bin/env bash
# สร้างโครงสร้าง Chapter 03 – TCP/IP Suite สำหรับ Hugo (PaperMod)
# ใช้งาน: ./scripts/create_03_tcpip.sh  (จาก root ของ Hugo site)

set -euo pipefail

CONTENT_DIR="${1:-content/networking/03-tcp-ip}"
TODAY="$(date +%Y-%m-%d)"

echo "Creating Chapter 03 – TCP/IP under: $CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

create_page() {
  local path="$1"        # ไฟล์ .md
  local title="$2"       # title
  local weight="$3"      # weight สำหรับเรียงลำดับ
  local level="$4"       # B1 / B2 / B3
  local slug="$5"        # ใช้ใน tags
  local topics_csv="$6"  # รายการ topics คั่นด้วย comma (หรือ "")

  mkdir -p "$(dirname "$path")"

  # สร้างบรรทัด topics: แบบ inline array
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

categories: ["Networking", "TCP/IP"]
tags: ["tcpip", "$level", "$slug"]
$topics_line
showtoc: true
tocopen: false
comments: false
hidemeta: false
hideSummary: false
---

## TH: บทนำ / Concept Overview

(เขียนอธิบายหัวข้อนี้เป็นภาษาไทยแบบเข้าใจง่ายสำหรับผู้เริ่มต้น  
เชื่อมโยงกับภาพใหญ่ของ TCP/IP และ OSI:
- ทำหน้าที่อะไรในระบบเครือข่าย
- ผู้เรียนควรเข้าใจอะไรจากบทนี้
)

## EN: Introduction / Concept Overview

(Write the English explanation here for learners.  
Focus on:
- What this concept does in the network
- Why it matters
- Key terms)

---

## TH: หัวข้อสำคัญ (Key Points – TH)

- จุดที่ 1
- จุดที่ 2
- จุดที่ 3

## EN: Key Points

- Point 1
- Point 2
- Point 3

---

## TH: ตัวอย่าง / เปรียบเทียบ

(ใช้ตัวอย่างในชีวิตจริงอธิบาย เช่น การส่งจดหมาย, เบอร์โทรศัพท์, บ้านเลขที่ ฯลฯ)

## EN: Examples / Analogies

(Use simple analogies to make the concept concrete.)

---

## สำหรับสอนออนไลน์ (Teaching Notes)

- ระยะเวลาแนะนำ: XX นาที
- Demo ที่ควรใช้ (เช่น Wireshark, ping, traceroute)
- คำถามที่ใช้กระตุ้นผู้เรียน (TH+EN)
EOF
}

###############################################
# 0. _index ของทั้ง Chapter 03-tcp-ip
###############################################

cat <<EOF > "$CONTENT_DIR/_index.md"
---
title: "03 – TCP/IP Suite – โครงสร้าง TCP/IP"
date: $TODAY
draft: false
weight: 30

categories: ["Networking", "TCP/IP"]
tags: ["tcpip", "chapter3"]
topics: ["TCP/IP Suite", "Networking Fundamentals"]

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: Chapter 3 – TCP/IP Suite

บทนี้เป็นแกนกลางสำหรับเข้าใจการทำงานของเครือข่ายในโลกจริง  
โฟกัสที่:
- โครงสร้าง 4 Layers ของ TCP/IP
- IP Addressing / Subnetting
- TCP vs UDP
- Protocol สำคัญ: ARP, ICMP, DHCP, DNS, HTTP/HTTPS
- การดูทราฟฟิกจริงผ่าน Wireshark เพื่อสอนออนไลน์

## EN: Chapter 3 – TCP/IP Suite

This chapter is the core of practical networking.  
Focus on:
- The 4-layer TCP/IP model
- IP addressing and subnetting basics
- TCP vs UDP
- Key protocols: ARP, ICMP, DHCP, DNS, HTTP/HTTPS
- Live traffic analysis with Wireshark for online teaching.
EOF

###############################################
# 1. B1 – Foundation (พื้นฐาน TCP/IP)
###############################################

B1_DIR="$CONTENT_DIR/b1-foundation"
mkdir -p "$B1_DIR"

cat <<EOF > "$B1_DIR/_index.md"
---
title: "B1 – TCP/IP Foundation – พื้นฐาน"
date: $TODAY
draft: false
weight: 10

categories: ["Networking", "TCP/IP"]
tags: ["tcpip", "b1", "foundation"]
topics: ["TCP/IP Fundamentals", "Basic Networking"]

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: ระดับ B1 – พื้นฐาน TCP/IP

เป้าหมาย:
- ให้ผู้เรียนเห็นภาพรวมของ TCP/IP และ Layer ต่างๆ
- รู้จักคำศัพท์พื้นฐาน (packet, frame, segment, port, IP)
- เข้าใจการไหลของข้อมูลแบบง่ายๆ

## EN: Level B1 – TCP/IP Foundation

Objectives:
- Understand the big picture of the TCP/IP model
- Learn basic network terms (packet, frame, segment, port, IP)
- See how data flows through the layers in a simple way.
EOF

create_page "$B1_DIR/01-tcpip-overview.md" \
  "TCP/IP Overview – ภาพรวม TCP/IP" \
  10 "B1" "overview" \
  "TCP/IP Overview,Basics"

create_page "$B1_DIR/02-tcpip-layers.md" \
  "TCP/IP Layers – 4 เลเยอร์ของ TCP/IP" \
  20 "B1" "layers" \
  "TCP/IP Layers,Model"

create_page "$B1_DIR/03-ip-addressing-basics.md" \
  "IP Addressing Basics – พื้นฐาน IP Addressing" \
  30 "B1" "ip-addressing" \
  "IP Addressing,Subnetting Basics"

create_page "$B1_DIR/04-ports-and-services.md" \
  "Ports & Services – พอร์ตและบริการ" \
  40 "B1" "ports-services" \
  "Ports,Services"

###############################################
# 2. B2 – Core Protocols (โปรโตคอลหลัก)
###############################################

B2_DIR="$CONTENT_DIR/b2-core-protocols"
mkdir -p "$B2_DIR"

cat <<EOF > "$B2_DIR/_index.md"
---
title: "B2 – Core Protocols – โปรโตคอลหลักใน TCP/IP"
date: $TODAY
draft: false
weight: 20

categories: ["Networking", "TCP/IP"]
tags: ["tcpip", "b2", "core-protocols"]
topics: ["Core Protocols", "ARP", "ICMP", "DHCP", "DNS"]

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: ระดับ B2 – โปรโตคอลหลักใน TCP/IP

โฟกัสที่:
- ARP / ICMP
- DHCP / DNS
- TCP vs UDP (เชิงลึกขึ้นจาก B1)
- Routing พื้นฐาน และ NAT

## EN: Level B2 – Core TCP/IP Protocols

Focus on:
- ARP / ICMP
- DHCP / DNS
- Deeper TCP vs UDP
- Basic routing and NAT concepts.
EOF

create_page "$B2_DIR/01-arp-icmp.md" \
  "ARP & ICMP – การแก้ที่อยู่และการตรวจสอบเส้นทาง" \
  10 "B2" "arp-icmp" \
  "ARP,ICMP,Diagnostics"

create_page "$B2_DIR/02-dhcp-dns.md" \
  "DHCP & DNS – การแจกที่อยู่และการแปลงชื่อ" \
  20 "B2" "dhcp-dns" \
  "DHCP,DNS,Name Resolution"

create_page "$B2_DIR/03-tcp-vs-udp-deep.md" \
  "TCP vs UDP – เปรียบเทียบเชิงลึก" \
  30 "B2" "tcp-vs-udp" \
  "TCP,UDP,Comparison"

create_page "$B2_DIR/04-routing-nat-basics.md" \
  "Routing & NAT Basics – การส่งต่อและแปลงที่อยู่" \
  40 "B2" "routing-nat" \
  "Routing,NAT"

###############################################
# 3. B3 – Analysis & Labs (วิเคราะห์ทราฟฟิก)
###############################################

B3_DIR="$CONTENT_DIR/b3-analysis-labs"
mkdir -p "$B3_DIR"

cat <<EOF > "$B3_DIR/_index.md"
---
title: "B3 – Traffic Analysis & Labs – การวิเคราะห์ทราฟฟิก"
date: $TODAY
draft: false
weight: 30

categories: ["Networking", "TCP/IP"]
tags: ["tcpip", "b3", "analysis", "labs"]
topics: ["Traffic Analysis", "Wireshark Labs"]

showtoc: true
tocopen: false
comments: false
hideSummary: false
---

## TH: ระดับ B3 – การวิเคราะห์ทราฟฟิกและ Labs

โฟกัสที่:
- การดู Packet Flow จริง (จาก Client ไป Server)
- การใช้ Wireshark / tcpdump / Zeek ในระดับพื้นฐานสำหรับสอนออนไลน์
- สร้างกรณีศึกษา (Case Study) ให้ผู้เรียนวิเคราะห์เอง

## EN: Level B3 – Traffic Analysis & Labs

Focus on:
- Real packet flow from client to server
- Using Wireshark / tcpdump / Zeek for online teaching
- Building case studies for learners to investigate.
EOF

create_page "$B3_DIR/01-packet-flow-case-study.md" \
  "Packet Flow Case Study – กรณีศึกษาการไหลของแพ็กเก็ต" \
  10 "B3" "packet-flow" \
  "Packet Flow,Case Study"

create_page "$B3_DIR/02-wireshark-tcpip-labs.md" \
  "Wireshark TCP/IP Labs – Labs วิเคราะห์ทราฟฟิก" \
  20 "B3" "wireshark-labs" \
  "Wireshark,Labs,TCP/IP"

create_page "$B3_DIR/03-incident-story-tcpip.md" \
  "Incident Story – เหตุการณ์สมมติในเครือข่าย TCP/IP" \
  30 "B3" "incident-story" \
  "Incident,Story,Investigation"

echo "Done. TCP/IP course structure created at: $CONTENT_DIR"

