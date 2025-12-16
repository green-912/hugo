#!/usr/bin/env bash
# Auto-generate Networking Learning Path (0 → Expert)
# For Hugo content structure

set -e

BASE="content/networking"

echo "Creating full Networking Learning Path 0 → Expert under: $BASE"

# ============================================================
# ROOT SECTION
# ============================================================

mkdir -p "$BASE"

cat > "$BASE/_index.md" << 'EOF'
---
title: "Networking Learning Path (0 → Expert)"
weight: 20
categories:
  - "Networking"
topics:
  - "Learning Path"
summary: "เส้นทางการเรียนรู้ระบบเครือข่าย ตั้งแต่พื้นฐานศูนย์จนถึงระดับผู้เชี่ยวชาญ."
showtoc: true
tocopen: false
---

# Networking Learning Path (0 → Expert)

> TH: เส้นทางเรียนรู้ขั้นบันได ตั้งแต่พื้นฐาน OSI/TCP-IP ไปจนถึงระดับวิเคราะห์ packet และ network forensics  
> EN: A fully structured learning path from basic OSI/TCP-IP to deep packet analysis and network forensics.
EOF

# ============================================================
# MODULE STRUCTURE FUNCTION
# ============================================================

create_module () {
  DIR="$BASE/$1"
  TITLE="$2"
  SUMMARY="$3"
  WEIGHT="$4"

  mkdir -p "$DIR"

  cat > "$DIR/_index.md" << EOF
---
title: "$TITLE"
weight: $WEIGHT
categories:
  - "Networking"
topics:
  - "Networking"
summary: "$SUMMARY"
showtoc: true
tocopen: false
---

# $TITLE

> TH: $SUMMARY  
> EN: $SUMMARY
EOF
}

create_lesson () {
  FILE="$BASE/$1/$2.md"
  TITLE="$3"

  cat > "$FILE" << EOF
---
title: "$TITLE"
draft: false
weight: 1
tags:
  - "networking"
topics:
  - "$TITLE"
showtoc: true
tocopen: false
---

# $TITLE

## TH – Overview
เนื้อหา placeholder สำหรับบท "$TITLE" (ปรับแต่งเพิ่มได้)

## EN – Overview
Placeholder content for lesson "$TITLE".
EOF
}

# ============================================================
# MODULE 0 – BASICS (0 → Beginner)
# ============================================================

create_module "module-0-basics" \
  "Module 0 – Networking Basics" \
  "พื้นฐาน network สำหรับผู้เริ่มต้น" \
  0

create_lesson "module-0-basics" "01-what-is-networking" "What Is Networking"
create_lesson "module-0-basics" "02-osi-tcpip-overview" "OSI vs TCP/IP Overview"
create_lesson "module-0-basics" "03-basic-ip-subnet" "Basic IP and Subnet"

# ============================================================
# MODULE 1 – PROTOCOLS (Beginner → Practitioner)
# ============================================================

create_module "module-1-protocols" \
  "Module 1 – Core Protocols (L2–L7)" \
  "โปรโตคอลหลัก L2–L7 สำหรับการเข้าใจโครงสร้าง packet" \
  1

create_lesson "module-1-protocols" "01-ethernet-mac" "Ethernet & MAC"
create_lesson "module-1-protocols" "02-ipv4-basics" "IPv4 Basics"
create_lesson "module-1-protocols" "03-tcp-udp-basics" "TCP vs UDP"
create_lesson "module-1-protocols" "04-dns-basics" "DNS Basics"
create_lesson "module-1-protocols" "05-http-overview" "HTTP Overview"

# ============================================================
# MODULE 2 – TOOLS (Practitioner → Professional)
# ============================================================

create_module "module-2-tools" \
  "Module 2 – Networking Tools" \
  "เครื่องมือสำคัญ เช่น ping, traceroute, ss, tcpdump, Wireshark, nmap" \
  2

create_lesson "module-2-tools" "01-ping-traceroute" "ping & traceroute"
create_lesson "module-2-tools" "02-ss-netstat" "ss / netstat"
create_lesson "module-2-tools" "03-tcpdump-basics" "tcpdump Basics"
create_lesson "module-2-tools" "04-wireshark-basics" "Wireshark Basics"
create_lesson "module-2-tools" "05-nmap-intro" "Nmap Introduction"

# ============================================================
# MODULE 3 – TROUBLESHOOTING (Practitioner → Advanced)
# ============================================================

create_module "module-3-troubleshooting" \
  "Module 3 – Network Troubleshooting" \
  "ขั้นตอนการแก้ปัญหาแบบ workflow และกรณีที่พบบ่อย" \
  3

create_lesson "module-3-troubleshooting" "01-methodology" "Troubleshooting Methodology"
create_lesson "module-3-troubleshooting" "02-connectivity-issues" "Common Connectivity Issues"
create_lesson "module-3-troubleshooting" "03-dns-troubleshooting" "DNS Troubleshooting"
create_lesson "module-3-troubleshooting" "04-routing-issues" "Routing Issues"

# ============================================================
# MODULE 4 – SECURITY (Advanced)
# ============================================================

create_module "module-4-security" \
  "Module 4 – Network Security" \
  "พื้นฐานด้านความปลอดภัย เช่น firewall, NAT, VPN, segmentation" \
  4

create_lesson "module-4-security" "01-firewall-concepts" "Firewall Concepts"
create_lesson "module-4-security" "02-nat-basics" "NAT Basics"
create_lesson "module-4-security" "03-vpn-basics" "VPN Basics"
create_lesson "module-4-security" "04-network-segmentation" "Network Segmentation"

# ============================================================
# MODULE 5 – FORENSICS (Advanced → Expert)
# ============================================================

create_module "module-5-forensics" \
  "Module 5 – Network Forensics" \
  "วิเคราะห์ทราฟฟิก, PCAP workflow, Zeek logs, incident investigation" \
  5

create_lesson "module-5-forensics" "01-pcap-workflow" "PCAP Analysis Workflow"
create_lesson "module-5-forensics" "02-zeek-intro" "Zeek Introduction"
create_lesson "module-5-forensics" "03-traffic-anomaly" "Traffic Anomaly Detection"

# ============================================================
# EXPERT DEEP-DIVE (Expert Level)
# ============================================================

EXPERT="$BASE/expert-deep-dive"
mkdir -p "$EXPERT"

cat > "$EXPERT/_index.md" << 'EOF'
---
title: "Expert Deep-Dive"
weight: 6
categories:
  - "Networking"
topics:
  - "Expert"
summary: "เนื้อหาระดับผู้เชี่ยวชาญ เช่น TCP Internals, DNS Internals, HTTP/3, QUIC, Packet Timing."
showtoc: true
tocopen: false
---

# Expert Deep-Dive

> TH: เนื้อหาระดับลึกสุด สำหรับนักวิเคราะห์ทราฟฟิกและสถาปนิกเครือข่าย  
> EN: Deep-level materials for traffic analysts and network architects.
EOF

# ----------------
# TCP Internals
# ----------------
mkdir -p "$EXPERT/tcp-internals"

cat > "$EXPERT/tcp-internals/_index.md" << 'EOF'
---
title: "TCP Internals"
weight: 1
categories:
  - "Networking"
topics:
  - "Expert"
summary: "เชิงลึก TCP: handshake variations, retransmission, congestion control."
showtoc: true
tocopen: false
---
EOF

create_lesson "expert-deep-dive/tcp-internals" "01-tcp-handshake-deep" "Deep TCP Handshake"
create_lesson "expert-deep-dive/tcp-internals" "02-tcp-retransmission" "TCP Retransmission Deep"
create_lesson "expert-deep-dive/tcp-internals" "03-tcp-congestion" "TCP Congestion Control"

# ----------------
# DNS Internals
# ----------------
mkdir -p "$EXPERT/dns-internals"

cat > "$EXPERT/dns-internals/_index.md" << 'EOF'
---
title: "DNS Internals"
weight: 2
summary: "โครงสร้าง message format, DNSSEC, resolver workflow."
showtoc: true
tocopen: false
---
EOF

create_lesson "expert-deep-dive/dns-internals" "01-dns-message-format" "DNS Message Format Deep"
create_lesson "expert-deep-dive/dns-internals" "02-dnssec-deep" "DNSSEC Deep Dive"

# ----------------
# HTTP/2 & HTTP/3
# ----------------
mkdir -p "$EXPERT/http2-h3"

cat > "$EXPERT/http2-h3/_index.md" << 'EOF'
---
title: "HTTP/2 & HTTP/3 Internals"
weight: 3
summary: "โครงสร้าง Frame, QUIC handshake, Multiplexing & Prioritization."
showtoc: true
tocopen: false
---
EOF

create_lesson "expert-deep-dive/http2-h3" "01-http2-frame-deep" "HTTP/2 Frame Internals"
create_lesson "expert-deep-dive/http2-h3" "02-http3-quic-deep" "HTTP/3 QUIC Deep Dive"

# ----------------
# Packet Timing / Latency
# ----------------
mkdir -p "$EXPERT/packet-timing"

cat > "$EXPERT/packet-timing/_index.md" << 'EOF'
---
title: "Packet Timing & Latency Analysis"
weight: 4
summary: "RTT, jitter, delay variation, packet pacing."
showtoc: true
tocopen: false
---
EOF

create_lesson "expert-deep-dive/packet-timing" "01-rtt-analysis" "RTT Analysis Deep"
create_lesson "expert-deep-dive/packet-timing" "02-jitter-delay" "Jitter & Delay Deep"

echo "Networking 0 → Expert structure created successfully!"

