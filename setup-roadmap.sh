
#!/bin/bash

# --- สคริปต์สร้างโครงสร้าง Roadmap การสืบสวนเครือข่าย (Cyber Investigator) ---

BASE_PATH="content/learning/networking"

# ฟังก์ชันสำหรับสร้าง Page Bundle (Folder + index.md)
create_draft() {
    local dir_path="$1"
    local title="$2"
    local category="$3"

    mkdir -p "$BASE_PATH/$dir_path"
    
    cat <<EOF > "$BASE_PATH/$dir_path/index.md"
---
title: "$title"
date: $(date +%Y-%m-%d)
draft: true
categories: ["$category"]
series: ["Cyber Investigator Roadmap"]
tags: ["draft", "investigation"]
cover:
    image: "cover.jpg"
    relative: true
---

## 🔍 บทนำ
(เนื้อหาเริ่มต้นของบทความ $title)

## 🛠 เครื่องมือที่ใช้ในบทนี้
- 

## 📝 บันทึกการวิเคราะห์
- 

EOF
    echo "✅ Created: $BASE_PATH/$dir_path/index.md"
}

echo "🌿 เริ่มสร้างโครงสร้าง Roadmap..."

# หมวดที่ 1: Network Access (Layer 2)
create_draft "01-network-access/01-arp-deep-dive" "ARP Deep Dive: วิเคราะห์การระบุตัวตนด้วย MAC Address" "Networking"
create_draft "01-network-access/02-mitm-investigation" "Man-in-the-Middle Investigation: ตรวจจับการทำ ARP Spoofing" "Networking"

# หมวดที่ 2: Internet Layer (Layer 3)
create_draft "02-internet-layer/03-icmp-analysis" "ICMP Analysis: อ่านค่าจาก Ping และ Traceroute เพื่อระบุตัวตนเป้าหมาย" "Networking"
create_draft "02-internet-layer/04-nmap-packet-analysis" "Nmap Packet Analysis: แกะรอยการทำงานของ Scanner ระดับโลก" "Networking"
create_draft "02-internet-layer/05-infrastructure-osint" "Infrastructure OSINT: การใช้ Shodan ร่วมกับ Nmap สืบสวนจากภายนอก" "Networking"

# หมวดที่ 3: Transport Layer (Layer 4)
create_draft "03-transport-layer/06-tcp-handshake-investigation" "TCP Handshake Investigation: การตรวจจับความพยายามเชื่อมต่อ" "Networking"
create_draft "03-transport-layer/07-abnormal-flags-analysis" "Abnormal Flags Analysis: สแกนหาจุดพิรุธผ่าน TCP Flags" "Networking"
create_draft "03-transport-layer/08-zeek-for-investigators" "Zeek for Investigators: เปลี่ยน Log มหาศาลให้กลายเป็นเบาะแส" "Networking"
create_draft "03-transport-layer/09-flow-vs-packet" "Flow vs Packet: เมื่อไหร่ควรใช้ Wireshark และเมื่อไหร่ควรใช้ Zeek" "Networking"

# หมวดที่ 4: Application Layer (Layer 7)
create_draft "04-application-layer/10-dns-forensics" "DNS Forensics: แกะรอยเส้นทางดิจิทัลจาก Domain สู่เจ้าของจริง" "Networking"
create_draft "04-application-layer/11-spiderfoot-automation" "Spiderfoot Automation: การเก็บข้อมูล OSINT แบบอัตโนมัติ" "Networking"
create_draft "04-application-layer/12-maltego-relationship-mapping" "Maltego Relationship Mapping: วาดแผนผังความสัมพันธ์จากข้อมูลเครือข่าย" "Networking"
create_draft "04-application-layer/13-tls-fingerprinting" "TLS Fingerprinting: การระบุมัลแวร์ใน Traffic ที่เข้ารหัส" "Networking"

echo "------------------------------------------------"
echo "🌿 สร้างโครงสร้างทั้งหมดเรียบร้อยแล้ว!"
echo "📍 คุณสามารถดูไฟล์ทั้งหมดได้ที่ content/learning/networking/"
