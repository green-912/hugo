#!/usr/bin/env bash
# สคริปต์สร้างโครง Linux Learning Path (01–08 + 99-glossary) สำหรับ Hugo

set -e

BASE="content/linux"

echo "Creating Linux Learning Path under: $BASE"

mkdir -p "$BASE"

# ============================================================
# ROOT SECTION: /linux/_index.md
# ============================================================

cat > "$BASE/_index.md" << 'EOF'
---
title: "Linux Learning Path"
weight: 10
categories:
  - "Linux"
topics:
  - "Learning Path"
summary: "เส้นทางการเรียนรู้ Linux ตั้งแต่พื้นฐาน Terminal จนถึงระดับ System, Networking และ Security."
showtoc: true
tocopen: false
---

# Linux Learning Path

> TH: เส้นทางการเรียนรู้ Linux จากศูนย์สำหรับผู้เริ่มต้น จนถึงระดับผู้ดูแลระบบและสาย Security  
> EN: A structured learning path for Linux, from absolute beginner to system and security practitioners.

## โครงสร้าง 01–08

1. **01 – Foundations** – พื้นฐาน Linux, Terminal, แนวคิดระบบ  
2. **02 – Filesystem** – โครงสร้างไฟล์, path, การจัดการไฟล์  
3. **03 – Users & Permissions** – ผู้ใช้, กลุ่ม, สิทธิ์, sudo  
4. **04 – System Management** – process, services, logs  
5. **05 – Linux Networking** – IP, DNS, tools พื้นฐาน  
6. **06 – Security & Hardening** – การทำให้ระบบปลอดภัยยิ่งขึ้น  
7. **07 – Labs** – แบบฝึกหัดและ Lab ปฏิบัติจริง  
8. **08 – Deep Dive** – เชิงลึกด้านระบบและความปลอดภัย  
9. **99 – Glossary** – คำศัพท์ Linux สำหรับอ้างอิง
EOF

# ============================================================
# HELPERS
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
  - "Linux"
topics:
  - "Linux"
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
  DIR="$BASE/$1"
  FILE="$DIR/$2.md"
  TITLE="$3"

  mkdir -p "$DIR"

  cat > "$FILE" << EOF
---
title: "$TITLE"
draft: false
weight: 1
tags:
  - "linux"
topics:
  - "$TITLE"
showtoc: true
tocopen: false
---

# $TITLE

## TH – Overview
เนื้อหา placeholder สำหรับบท "$TITLE" (เติมเนื้อหาเพิ่มเติมได้ตามรูปแบบที่ต้องการ)

## EN – Overview
Placeholder content for lesson "$TITLE".
EOF
}

# ============================================================
# 01 – FOUNDATIONS
# ============================================================

create_module "01-foundations" \
  "01 – Linux Foundations" \
  "พื้นฐาน Linux สำหรับผู้เริ่มต้น: แนวคิดระบบปฏิบัติการ, Desktop vs Server, Terminal, Shell." \
  1

create_lesson "01-foundations" "01-what-is-linux" "What Is Linux?"
create_lesson "01-foundations" "02-desktop-vs-server" "Desktop vs Server"
create_lesson "01-foundations" "03-terminal-basics" "Terminal Basics"

# ============================================================
# 02 – FILESYSTEM
# ============================================================

create_module "02-filesystem" \
  "02 – Linux Filesystem" \
  "โครงสร้างระบบไฟล์ Linux: root '/', โฟลเดอร์สำคัญ และการเดินทางผ่าน path." \
  2

create_lesson "02-filesystem" "01-filesystem-overview" "Linux Filesystem Overview"
create_lesson "02-filesystem" "02-navigating-paths" "Navigating Paths (cd, ls, pwd)"
create_lesson "02-filesystem" "03-managing-files" "Managing Files (cp, mv, rm)"

# ============================================================
# 03 – USERS & PERMISSIONS
# ============================================================

create_module "03-users-permissions" \
  "03 – Users & Permissions" \
  "จัดการผู้ใช้ กลุ่ม และสิทธิ์การเข้าถึงไฟล์ รวมถึงการใช้ sudo." \
  3

create_lesson "03-users-permissions" "01-users-and-groups" "Users and Groups"
create_lesson "03-users-permissions" "02-file-permissions" "File Permissions (rwx, chmod)"
create_lesson "03-users-permissions" "03-sudo-basics" "sudo Basics"

# ============================================================
# 04 – SYSTEM MANAGEMENT
# ============================================================

create_module "04-system-management" \
  "04 – System & Process Management" \
  "จัดการ process, service และ log พื้นฐานบน Linux." \
  4

create_lesson "04-system-management" "01-process-management" "Process Management (ps, top)"
create_lesson "04-system-management" "02-services-systemd" "Services with systemd"
create_lesson "04-system-management" "03-log-basics" "Log Basics (journalctl, /var/log)"

# ============================================================
# 05 – LINUX NETWORKING
# ============================================================

create_module "05-networking" \
  "05 – Linux Networking" \
  "พื้นฐานการใช้งาน network บน Linux: IP, DNS, ตรวจสอบการเชื่อมต่อ." \
  5

create_lesson "05-networking" "01-ip-configuration" "IP Configuration (ip addr, ip route)"
create_lesson "05-networking" "02-dns-basics" "DNS Basics on Linux"
create_lesson "05-networking" "03-basic-troubleshooting" "Basic Network Troubleshooting"

# ============================================================
# 06 – SECURITY & HARDENING
# ============================================================

create_module "06-security" \
  "06 – Security & Hardening" \
  "ปูพื้นด้านความปลอดภัยบน Linux: SSH, firewall, แนวคิด hardening." \
  6

create_lesson "06-security" "01-ssh-basics" "SSH Basics"
create_lesson "06-security" "02-firewall-basics" "Firewall Basics (ufw / nftables)"
create_lesson "06-security" "03-hardening-intro" "Introduction to Hardening"

# ============================================================
# 07 – LABS
# ============================================================

create_module "07-labs" \
  "07 – Linux Labs" \
  "ชุด Lab สำหรับฝึกใช้งาน Linux จากสิ่งที่เรียนในหมวด 01–06." \
  7

create_lesson "07-labs" "01-lab-navigation-files" "Lab – Navigation & Files"
create_lesson "07-labs" "02-lab-users-permissions" "Lab – Users & Permissions"
create_lesson "07-labs" "03-lab-logs" "Lab – Logs & Troubleshooting"

# ============================================================
# 08 – DEEP DIVE
# ============================================================

create_module "08-deep-dive" \
  "08 – Linux Deep Dive" \
  "เนื้อหาลึกสำหรับผู้ต้องการเข้าใจ internals เช่น process, filesystem, security เชิงลึก." \
  8

create_lesson "08-deep-dive" "01-process-internals" "Process Internals (Signals, States)"
create_lesson "08-deep-dive" "02-filesystem-internals" "Filesystem Internals"
create_lesson "08-deep-dive" "03-security-internals" "Linux Security Internals"

# ============================================================
# 99 – GLOSSARY
# ============================================================

GLOSS="$BASE/99-glossary"
mkdir -p "$GLOSS"

cat > "$GLOSS/_index.md" << 'EOF'
---
title: "99 – Linux Glossary"
weight: 99
categories:
  - "Linux"
topics:
  - "Glossary"
summary: "คำศัพท์และคำอธิบายที่ใช้บ่อยในโลกของ Linux."
showtoc: true
tocopen: false
---

# Linux Glossary

> รวบรวมคำศัพท์ Linux ที่สำคัญ เช่น kernel, process, service, filesystem, permission ฯลฯ

(เพิ่มคำศัพท์ได้เรื่อย ๆ แบบอิสระ)
EOF

echo "Linux Learning Path structure created successfully."

