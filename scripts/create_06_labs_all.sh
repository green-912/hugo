#!/usr/bin/env bash
set -e

BASE="content/networking/06-labs"

echo ">>> Creating LABS (OSI / TCPIP / Protocol / Tools) in: $BASE"

mkdir -p "$BASE/osi"
mkdir -p "$BASE/tcpip"
mkdir -p "$BASE/protocols"
mkdir -p "$BASE/tools"

########################################
# OSI LABS
########################################

cat > "$BASE/osi/lab1-arp-analysis.md" << 'EOF'
---
title: "Lab 1 – ARP Analysis (OSI Layer 2)"
weight: 1
categories: ["Labs"]
topics: ["ARP", "OSI-L2"]
---

# TH: Lab 1 – วิเคราะห์ ARP (OSI Layer 2)

## วัตถุประสงค์
- ดู Flow ของ ARP Request / Reply
- ระบุ MAC–IP mapping
- ตรวจความผิดปกติใน ARP ให้ได้

## ขั้นตอน
1. เปิดไฟล์: `lab1_arp.pcap`
2. ใช้ filter:
   arp
3. ดูว่า IP ไหนถามหา MAC ไหน
4. ตรวจว่ามี ARP reply ที่ผิดปกติหรือไม่

## คำถาม
- IP 192.168.1.10 ถามหาใคร?
- MAC Address ที่แท้จริงคืออะไร?
- มี ARP duplicate หรือไม่?

## Expected Answer
(พี่เติมภายหลังตาม PCAP ที่ใช้)

# EN: Lab 1 – ARP Analysis

Object:
- Observe ARP Request/Reply flow
- Validate MAC–IP mapping
- Identify anomalies (duplicates, spoofing)
EOF

########################################

cat > "$BASE/osi/lab2-dhcp-flow.md" << 'EOF'
---
title: "Lab 2 – DHCP Flow Analysis"
weight: 2
topics: ["DHCP", "OSI-L7"]
---

# TH: Lab 2 – วิเคราะห์ DHCP (DORA)

## ขั้นตอน
1. เปิด `lab2_dhcp.pcap`
2. Filter:
bootp or dhcp

3. ตรวจจับ DORA flow:
- Discover
- Offer
- Request
- ACK

## คำถาม
- Server แจก IP อะไร?
- DNS ที่แจกคืออะไร?

# EN: DHCP Flow Lab

Analyze DHCP DORA process and confirm assigned parameters.
EOF

########################################

cat > "$BASE/osi/lab3-dns.md" << 'EOF'
---
title: "Lab 3 – DNS Query/Response Analysis"
weight: 3
topics: ["DNS"]
---

# TH: Lab 3 – วิเคราะห์ DNS

## ขั้นตอน
1. เปิด `lab3_dns.pcap`
2. Filter:
 dns
3. ดู Query → Response
4. ตรวจ NXDOMAIN / response time

## คำถาม
- Query อะไรถูกยิงบ่อยที่สุด?
- Server ตอบว่าอะไร?

# EN: DNS Analysis Lab
EOF

########################################
# TCP-IP LABS
########################################

cat > "$BASE/tcpip/lab4-tcp-flags.md" << 'EOF'
---
title: "Lab 4 – TCP Flags & Handshake Analysis"
weight: 4
topics: ["TCP"]
---

# TH: วิเคราะห์ TCP Flags และ Handshake

## ขั้นตอน
1. เปิด `lab4_tcp_flags.pcap`
2. Filter:
tcp
3. วิเคราะห์:
- SYN, SYN/ACK, ACK
- Retransmission
- Reset (RST)

## คำถาม
- มี SYN retry หรือไม่?
- ใครเป็นคนส่ง RST?

# EN: TCP Flags Lab
EOF

########################################

cat > "$BASE/tcpip/lab5-routing-loop.md" << 'EOF'
---
title: "Lab 5 – Routing Loop Investigation"
weight: 5
topics: ["Routing"]
---

# TH: Lab 5 – Routing Loop

## แนวคิด
Routing loop อาจทำให้ TTL ลดลงจนแพ็กเก็ตตายกลางทาง

## Filter
ip.ttl <= 3

## คำถาม
- TTL ต่ำผิดปกติหรือไม่?
- เส้นทางที่วนอยู่ที่ Router ใด?

# EN: Routing Loop Lab
EOF

########################################
# PROTOCOL LABS
########################################

cat > "$BASE/protocols/lab6-dns-tunnel.md" << 'EOF'
---
title: "Lab 6 – DNS Tunneling Detection"
weight: 6
topics: ["DNS", "Tunneling"]
---

# TH: Lab 6 – ตรวจจับ DNS Tunneling

## ขั้นตอน
1. เปิด `lab6_dns_tunnel.pcap`
2. Filter:
dns 

3. มองหา:
- โดเมนยาวผิดปกติ
- entropy สูง
- subdomain random

## คำถาม
- มีโดเมนที่เข้าข่าย tunnel หรือไม่?

# EN: DNS Tunneling Lab
EOF

########################################

cat > "$BASE/protocols/lab7-http-header-analysis.md" << 'EOF'
---
title: "Lab 7 – HTTP Header Deep Analysis"
weight: 7
topics: ["HTTP"]
---

# TH: วิเคราะห์ HTTP Headers

## ขั้นตอน
1. Filter:
http
2. ตรวจสอบ:
- User-Agent
- Cookie
- Host
- Request path

## คำถาม
- User-Agent ดูผิดปกติหรือไม่?
- มี request ที่ไม่น่าเกิดขึ้นหรือไม่?

# EN: HTTP Header Lab
EOF

########################################
# TOOLS LABS
########################################

cat > "$BASE/tools/lab8-wireshark-advanced.md" << 'EOF'
---
title: "Lab 8 – Wireshark Advanced Investigation"
weight: 8
topics: ["Wireshark"]
---

# TH: Lab 8 – การสืบสวนเชิงลึกด้วย Wireshark

โฟกัส:
- TCP analysis
- DNS anomaly
- Packet timing pattern

Filter รวม:
tcp.analysis.retransmission or dns

# EN: Wireshark Advanced Lab
EOF

########################################

cat > "$BASE/tools/lab9-zeek-log-analysis.md" << 'EOF'
---
title: "Lab 9 – Zeek Log Forensics"
weight: 9
topics: ["Zeek"]
---

# TH: Lab 9 – วิเคราะห์ log ของ Zeek

ดูไฟล์:
- conn.log
- dns.log
- http.log

คำถาม:
- IP ไหน active ผิดปกติ?
- มี DNS request ที่น่าสงสัยหรือไม่?

# EN: Zeek Log Lab
EOF

########################################

cat > "$BASE/tools/lab10-suricata-alerts.md" << 'EOF'
---
title: "Lab 10 – Suricata Alert Analysis"
weight: 10
topics: ["Suricata"]
---

# TH: Lab 10 – วิเคราะห์ Alert ของ Suricata

## ขั้นตอน
1. เปิดไฟล์ alert.json
2. ดู signature ที่ alert
3. เข้าใจความหมาย rule

## คำถาม
- Alert ไหนรุนแรงที่สุด?
- เป็น False Positive หรือไม่?

# EN: Suricata Alerts Lab
EOF

echo ">>> LABS created successfully at: $BASE"

