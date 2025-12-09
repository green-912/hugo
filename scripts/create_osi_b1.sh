#!/usr/bin/env bash
set -e

BASE="content/networking/02-osi-model"

echo ">>> Creating OSI Model (B1 Level) structure in: $BASE"
mkdir -p "$BASE"

########################################
# _index.md
########################################
cat > "$BASE/_index.md" << 'EOF'
---
title: "Chapter 2 – OSI Model"
weight: 20
categories: ["OSI"]
---

## TH: บทที่ 2 – OSI Model (ระดับ B1: พื้นฐานเชิงลึก)

บทนี้อธิบายหลักการของ OSI Model แบบที่ใช้สอนได้จริงกับบุคลากรภาครัฐ/องค์กร  
เน้นเข้าใจ “หน้าที่ของแต่ละชั้น”, “โปรโตคอลสำคัญ”, “จุดที่พบบ่อยเวลาแก้ปัญหา”

## EN: Chapter Overview (B1 – Intermediate Level)

This chapter explains the OSI Model in a practical and structured way.  
Focus: responsibilities of each layer, common protocols, and basic troubleshooting perspective.
EOF

########################################
# 01-osi-overview.md
########################################
cat > "$BASE/01-osi-overview.md" << 'EOF'
---
title: "OSI Model Overview"
weight: 1
categories: ["OSI"]
topics: ["Introduction"]
---

## TH: ภาพรวม OSI Model

OSI Model แบ่งการสื่อสารข้อมูลออกเป็น 7 ชั้น  
ประโยชน์ที่ใช้จริง:
- ระบุได้ว่าปัญหาเกิดในชั้นไหน  
- ทำ troubleshooting ง่ายขึ้นมาก  
- เป็นภาษากลางของงานเครือข่าย  

## EN: OSI Model Overview

The OSI Model divides communication into 7 layers.  
Its purpose is to standardize communication, simplify troubleshooting, and organize network design.
EOF

########################################
# 02-layer1-physical.md
########################################
cat > "$BASE/02-layer1-physical.md" << 'EOF'
---
title: "Layer 1 – Physical"
weight: 2
categories: ["OSI"]
topics: ["Layer1"]
---

## TH: Layer 1 คืออะไร?

เกี่ยวข้องกับ:
- สาย LAN, Fiber, คลื่นวิทยุ  
- ระดับสัญญาณไฟฟ้า  
- ความเร็วและมาตรฐานสื่อสาร  

ปัญหาที่พบบ่อย:
- สายหัก  
- สัญญาณรบกวน  
- ความเร็ว negotiation ผิด  

## EN: Layer 1 – Physical

Handles physical transmission: cables, fiber, radio signals.  
Common issues include signal loss, cable damage, and speed mismatches.
EOF

########################################
# 03-layer2-datalink.md
########################################
cat > "$BASE/03-layer2-datalink.md" << 'EOF'
---
title: "Layer 2 – Data Link"
weight: 3
categories: ["OSI"]
topics: ["Layer2"]
---

## TH: Layer 2 ทำหน้าที่อะไร?

จัดการ:
- MAC Address  
- Switching  
- VLAN Tag (802.1Q)  
- ตรวจ Error เบื้องต้นผ่าน FCS  

โปรโตคอลสำคัญ:
- Ethernet  
- ARP  
- VLAN  

ปัญหาจริง:
- STP loop  
- MAC flapping  

## EN: Layer 2 – Data Link

Handles MAC addressing, switching, VLAN tagging, and basic error detection.  
Issues include loops, ARP anomalies, and MAC flooding.
EOF

########################################
# 04-layer3-network.md
########################################
cat > "$BASE/04-layer3-network.md" << 'EOF'
---
title: "Layer 3 – Network"
weight: 4
categories: ["OSI"]
topics: ["Layer3"]
---

## TH: Layer 3 คืออะไร?

จัดการ:
- IP Address  
- Routing  
- การส่งต่อแพ็กเก็ต  

โปรโตคอลหลัก:
- IPv4 / IPv6  
- ICMP  
- OSPF, BGP  

ปัญหาที่พบบ่อย:
- Routing ผิดเส้นทาง  
- IP ซ้ำกัน  
- Subnet overlap  

## EN: Layer 3 – Network

Handles routing, forwarding, IP addressing.  
Common issues: wrong routes, duplicate IPs, ICMP unreachable.
EOF

########################################
# 05-layer4-transport.md
########################################
cat > "$BASE/05-layer4-transport.md" << 'EOF'
---
title: "Layer 4 – Transport"
weight: 5
categories: ["OSI"]
topics: ["Layer4"]
---

## TH: Layer 4 ทำอะไร?

จัดการ end-to-end communication  
โปรโตคอล:
- TCP (reliable)  
- UDP (fast)  

ประเด็นสำคัญ:
- TCP handshake (SYN, SYN/ACK, ACK)  
- Port number  

## EN: Layer 4 – Transport

Provides end-to-end connections using TCP/UDP.  
TCP ensures reliability, UDP is fast and connectionless.
EOF

########################################
# 06-layer5-session.md
########################################
cat > "$BASE/06-layer5-session.md" << 'EOF'
---
title: "Layer 5 – Session"
weight: 6
categories: ["OSI"]
topics: ["Layer5"]
---

## TH: Layer 5 คืออะไร?

ควบคุม:
- การเปิด session  
- การปิด session  
- การจัดลำดับบทสนทนา  

ตัวอย่าง:
- Authentication session  
- Remote Procedure Call (RPC)  

## EN: Layer 5 – Session

Manages dialog control, session creation and teardown, authentication context.
EOF

########################################
# 07-layer6-presentation.md
########################################
cat > "$BASE/07-layer6-presentation.md" << 'EOF'
---
title: "Layer 6 – Presentation"
weight: 7
categories: ["OSI"]
topics: ["Layer6"]
---

## TH: Layer 6 ทำหน้าที่อะไร?

แปลงข้อมูลให้เข้าใจกันได้ เช่น:
- Encryption (TLS/SSL)  
- Compression  
- Encoding (UTF-8)  

## EN: Layer 6 – Presentation

Handles encoding, compression, and encryption.
EOF

########################################
# 08-layer7-application.md
########################################
cat > "$BASE/08-layer7-application.md" << 'EOF'
---
title: "Layer 7 – Application"
weight: 8
categories: ["OSI"]
topics: ["Layer7"]
---

## TH: Layer 7 คืออะไร?

เป็นชั้นที่ผู้ใช้สัมผัส เช่น:
- HTTP / HTTPS  
- DNS  
- SMTP  
- FTP  

Layer ที่ถูกโจมตีบ่อยที่สุดเพราะมีช่องโหว่เยอะที่สุด

## EN: Layer 7 – Application

Provides services to users: HTTP, DNS, SMTP.  
Most attacked layer due to complexity and exposure.
EOF

########################################
# 09-osi-vs-tcpip.md
########################################
cat > "$BASE/09-osi-vs-tcpip.md" << 'EOF'
---
title: "OSI vs TCP/IP"
weight: 9
categories: ["OSI"]
topics: ["Comparison"]
---

## TH: OSI ต่างจาก TCP/IP อย่างไร?

- OSI = โมเดลเพื่ออธิบาย/สอน  
- TCP/IP = โมเดลที่ใช้งานจริง  

Mapping:
- OSI 1–2 → TCP/IP Network Access  
- OSI 3 → Internet  
- OSI 4 → Transport  
- OSI 5–7 → Application  

## EN: OSI vs TCP/IP

OSI is conceptual; TCP/IP is practical and implemented.  
Use OSI for teaching and TCP/IP for real-world networking.
EOF

echo ">>> OSI Model (B1 Level) created successfully."

