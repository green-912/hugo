#!/usr/bin/env bash
# Auto-create Page Bundles structure for Linux + Networking
# ใช้กับ Hugo + Obsidian (vault = content/)

set -e

CONTENT_DIR="content"

echo "Creating Page Bundles under: $CONTENT_DIR"

# ========= Helper: create bundle =========
create_bundle() {
  local section="$1"     # linux / networking
  local module="$2"      # 01-foundations, 03-tcp-ip, ...
  local bundle="$3"      # what-is-linux, ipv4-overview, ...
  local title="$4"       # Human readable title

  local DIR="$CONTENT_DIR/$section/$module/$bundle"
  local FILE="$DIR/index.md"

  mkdir -p "$DIR"

  if [ -f "$FILE" ]; then
    echo "SKIP (exists): $FILE"
    return
  fi

  cat > "$FILE" << EOF
---
title: "$title"
draft: false
weight: 1
showtoc: true
tocopen: false
tags:
  - "$section"
  - "$module"
topics:
  - "$title"
---

# $title

## TH – บทเรียน
อธิบายเนื้อหาของ "$title" ในมุมมองภาษาไทย เช่น
- แนวคิดพื้นฐาน
- ตัวอย่างที่ใช้ในชีวิตจริง
- สิ่งที่ผู้เรียนควรเข้าใจหลังอ่านจบ

## EN – Lesson Content
Explain "$title" in English:
- Core ideas
- Real-world examples
- What the learner should be able to do after finishing this lesson.

## ภาพประกอบ (ถ้ามี)
![Example](example.png)

> เก็บรูปภาพไว้ในโฟลเดอร์นี้ เช่น \`example.png\`

EOF

  echo "CREATED: $FILE"
}

# ============================================================
# NETWORKING – Page Bundles per main module
# ============================================================

# 01-foundations
create_bundle "networking" "01-foundations" "introduction" "Networking Foundations – Introduction"

# 02-osi-model
create_bundle "networking" "02-osi-model" "osi-overview" "OSI Model Overview"

# 03-tcp-ip
create_bundle "networking" "03-tcp-ip" "ipv4-overview" "IPv4 Overview"
create_bundle "networking" "03-tcp-ip" "tcp-handshake" "TCP Handshake Basics"

# 04-protocols
create_bundle "networking" "04-protocols" "dns-basics" "DNS Basics"
create_bundle "networking" "04-protocols" "http-overview" "HTTP Overview"

# 05-tools
create_bundle "networking" "05-tools" "ping-traceroute" "ping & traceroute"
create_bundle "networking" "05-tools" "tcpdump-basics" "tcpdump Basics"

# 06-labs
create_bundle "networking" "06-labs" "lab-arp" "Lab – ARP Investigation"
create_bundle "networking" "06-labs" "lab-dns" "Lab – DNS Resolution Analysis"

# 07-case-studies
create_bundle "networking" "07-case-studies" "case-slow-website" "Case Study – Slow Website"
create_bundle "networking" "07-case-studies" "case-dns-failure" "Case Study – DNS Failure"

# 08-protocols-deep
create_bundle "networking" "08-protocols-deep" "tcp-deep-dive" "TCP Deep Dive"
create_bundle "networking" "08-protocols-deep" "dnssec-deep-dive" "DNSSEC Deep Dive"

# ============================================================
# LINUX – Page Bundles per main module
# ============================================================

# 01-foundations
create_bundle "linux" "01-foundations" "what-is-linux" "What Is Linux?"
create_bundle "linux" "01-foundations" "terminal-basics" "Terminal Basics"

# 02-filesystem
create_bundle "linux" "02-filesystem" "filesystem-overview" "Linux Filesystem Overview"
create_bundle "linux" "02-filesystem" "file-operations" "File Operations (cp, mv, rm)"

# 03-users-permissions
create_bundle "linux" "03-users-permissions" "users-and-groups" "Users and Groups"
create_bundle "linux" "03-users-permissions" "file-permissions" "File Permissions (chmod, chown)"

# 04-system-management
create_bundle "linux" "04-system-management" "process-management" "Process Management (ps, top)"
create_bundle "linux" "04-system-management" "services-systemd" "Service Management with systemd"

# 05-networking
create_bundle "linux" "05-networking" "ip-config" "IP Configuration on Linux"
create_bundle "linux" "05-networking" "dns-linux" "DNS on Linux"

# 06-security
create_bundle "linux" "06-security" "ssh-basics" "SSH Basics on Linux"
create_bundle "linux" "06-security" "firewall-basics" "Firewall Basics (ufw/nftables)"

# 07-labs
create_bundle "linux" "07-labs" "lab-users-permissions" "Lab – Users & Permissions"
create_bundle "linux" "07-labs" "lab-logs-troubleshooting" "Lab – Logs & Troubleshooting"

# 08-deep-dive
create_bundle "linux" "08-deep-dive" "process-internals" "Linux Process Internals"
create_bundle "linux" "08-deep-dive" "filesystem-internals" "Filesystem Internals Deep Dive"

echo "Done. Page Bundles for Linux + Networking created (no overwrite on existing index.md)."

