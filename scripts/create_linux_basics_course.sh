#!/usr/bin/env bash
# สคริปต์สร้างโครงหลักสูตร Linux Basics สำหรับมือใหม่ (พร้อม Front Matter)

set -e

BASE_DIR="content/linux-basics"

echo "Creating Linux Basics course structure under: $BASE_DIR"

# ==========
# SECTION ROOT
# ==========
mkdir -p "$BASE_DIR"

cat > "$BASE_DIR/_index.md" << 'EOF'
---
title: "Linux Basics – Beginner Course"
weight: 20
categories:
  - "Linux"
  - "Training"
topics:
  - "Linux Basics"
summary: "พื้นฐาน Linux สำหรับผู้ไม่เคยใช้งานมาก่อน ตั้งแต่แนวคิดของ Linux ไปจนถึงการใช้งานคำสั่งพื้นฐานในงานจริง."
showtoc: true
tocopen: false
---

# Linux Basics – Beginner Course

> TH: หลักสูตรนี้ออกแบบมาเพื่อผู้ที่ไม่เคยใช้ Linux มาก่อนเลย ค่อย ๆ ปูพื้นจากแนวคิด ไปจนถึงการใช้คำสั่งพื้นฐานที่จำเป็นต่อการทำงานจริง  
> EN: This course introduces Linux to absolute beginners, from basic concepts to essential terminal commands used in real-world environments.
EOF

# ==========
# MODULE 0 – ORIENTATION
# ==========
MOD0_DIR="$BASE_DIR/module-0-orientation"
mkdir -p "$MOD0_DIR"

cat > "$MOD0_DIR/_index.md" << 'EOF'
---
title: "Module 0 – Orientation"
weight: 0
categories:
  - "Linux"
topics:
  - "Orientation"
  - "Linux Basics"
summary: "เข้าใจภาพรวมของ Linux ความแตกต่างจาก Windows และโครงสร้างระบบไฟล์."
showtoc: true
tocopen: false
---

# Module 0 – Orientation

> TH: ทำความรู้จัก Linux และภาพรวมของระบบ เพื่อให้ผู้เรียนไม่กลัว Linux  
> EN: High-level orientation to Linux so that new users can gain confidence before touching the terminal.
EOF

# 0.1 What is Linux
cat > "$MOD0_DIR/01-what-is-linux.md" << 'EOF'
---
title: "What Is Linux"
date: 2025-12-10T00:00:00+07:00
draft: false
weight: 1
tags:
  - "linux"
  - "beginner"
  - "orientation"
topics:
  - "Orientation"
  - "Linux Basics"
showtoc: true
tocopen: false
---

# What Is Linux

## TH – บทนำ
อธิบายว่า Linux คืออะไร ใช้ที่ไหนบ้าง และเหตุผลที่องค์กรนิยมใช้:
- Linux เป็นระบบปฏิบัติการที่ใช้งานอย่างแพร่หลายใน server, cloud, security, network device
- เปรียบเทียบภาพรวมระหว่าง Windows และ Linux แบบง่าย
- แนวคิดเรื่อง distribution เช่น Ubuntu, Debian, Arch, CentOS

## EN – Introduction
Explain what Linux is:
- Linux as an operating system used in servers, cloud, networking, and security
- High-level comparison: Linux vs Windows
- Linux distributions: Ubuntu, Debian, Arch, etc.

## TH – หัวข้อสำคัญที่ต้องสอน
1. Linux ในมุมมองผู้ใช้ทั่วไป (desktop, server, mobile)
2. แนวคิดที่ว่า Linux มีหลาย distro แต่ใช้พื้นฐานใกล้เคียงกัน
3. ทำไมสาย network / security / DFIR ต้องใช้ Linux

## EN – Key Teaching Points
1. Where Linux appears in daily life and IT infrastructure
2. Same core, different distributions
3. Why Linux is important for networking, security, and DFIR work

## Vocabulary (TH + EN)
- Distribution – ดิสทริบิวชัน – A variant of Linux with its own packaging and tools  
- Kernel – เคอร์เนล – The core part of the operating system  

## Exercises
- ให้ผู้เรียนลองค้นหาใน internet: “Which companies use Linux” และสรุปสั้น ๆ
EOF

# 0.2 Filesystem Overview
cat > "$MOD0_DIR/02-filesystem-overview.md" << 'EOF'
---
title: "Linux Filesystem Overview"
date: 2025-12-10T00:05:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "filesystem"
topics:
  - "Orientation"
  - "Linux Basics"
showtoc: true
tocopen: false
---

# Linux Filesystem Overview

## TH – บทนำ
เป้าหมายคือทำให้ผู้เรียนเข้าใจว่า Linux ไม่มี C: D: เหมือน Windows แต่มีโครงสร้าง `/` เป็น root:
- `/` คือจุดเริ่มต้นของทุกอย่าง
- โฟลเดอร์สำคัญ เช่น `/home`, `/etc`, `/var`, `/usr`, `/bin`
- แนวคิด path แบบ absolute และ relative

## EN – Introduction
Explain the Linux filesystem:
- Root directory `/`
- Key directories: `/home`, `/etc`, `/var`, `/usr`, `/bin`
- Absolute vs relative paths

## TH – หัวข้อหลักที่ต้องสอน
1. เปรียบเทียบ Windows drive letter vs Linux root `/`
2. โฟลเดอร์สำคัญและหน้าที่คร่าว ๆ
3. การมอง path เช่น `/home/user/Documents`

## EN – Key Teaching Points
1. No drive letters, only one root
2. Explain main directories in simple, practical terms
3. Reading and understanding paths

## Vocabulary (TH + EN)
- Root directory – โฟลเดอร์ราก – The top-level directory `/`  
- Path – พาธ – The full location of a file or directory  

## Exercises
- ให้ผู้เรียนวาดแผนผังโฟลเดอร์คร่าว ๆ ของ Linux จากที่เรียน
EOF

# ==========
# MODULE 1 – TERMINAL BASICS
# ==========
MOD1_DIR="$BASE_DIR/module-1-terminal"
mkdir -p "$MOD1_DIR"

cat > "$MOD1_DIR/_index.md" << 'EOF'
---
title: "Module 1 – Terminal Basics"
weight: 1
categories:
  - "Linux"
topics:
  - "Terminal Basics"
  - "Linux Basics"
summary: "ฝึกใช้งานเทอร์มินัล เรียนรู้คำสั่งพื้นฐานในการดูตำแหน่ง ย้ายโฟลเดอร์ และดูไฟล์."
showtoc: true
tocopen: false
---

# Module 1 – Terminal Basics

> TH: โมดูลนี้เน้นให้ผู้เรียนใช้เทอร์มินัลได้อย่างไม่กลัว เรียนรู้คำสั่งพื้นฐานที่ใช้ทุกวัน  
> EN: This module focuses on essential terminal commands used in daily Linux work.
EOF

# 1.1 Terminal Basics
cat > "$MOD1_DIR/01-terminal-basics.md" << 'EOF'
---
title: "Terminal Basics"
date: 2025-12-10T00:10:00+07:00
draft: false
weight: 1
tags:
  - "linux"
  - "terminal"
  - "beginner"
topics:
  - "Terminal Basics"
  - "Linux Basics"
showtoc: true
tocopen: false
---

# Terminal Basics

## TH – บทนำ
เป้าหมายคือให้ผู้เรียน:
- เปิดเทอร์มินัลเป็น
- รู้ว่าพื้นที่ทำงานปัจจุบันอยู่ที่ไหน
- ใช้คำสั่งพื้นฐานได้ เช่น `pwd`, `ls`, `cd`, `clear`

## EN – Introduction
Goals:
- Open the terminal
- Understand current working directory
- Run basic commands: `pwd`, `ls`, `cd`, `clear`

## TH – เนื้อหาหลัก
1. วิธีเปิดเทอร์มินัลจาก desktop
2. คำสั่ง `pwd` เพื่อดูตำแหน่งปัจจุบัน
3. คำสั่ง `ls` เพื่อดูไฟล์และโฟลเดอร์
4. คำสั่ง `cd` เพื่อเปลี่ยนโฟลเดอร์
5. คำสั่ง `clear` เคลียร์หน้าจอ

## EN – Main Content
1. How to launch the terminal
2. `pwd` to print working directory
3. `ls` to list files
4. `cd` to change directories
5. `clear` to clear the screen

## Vocabulary (TH + EN)
- Terminal – เทอร์มินัล – A text-based interface to the system  
- Shell – เชลล์ – Program that interprets commands  

## Exercises
- ให้ผู้เรียนลองใช้ `pwd`, `ls`, `cd`, `clear` หลาย ๆ รอบในโฟลเดอร์ต่าง ๆ
EOF

# 1.2 Working With Files
cat > "$MOD1_DIR/02-working-with-files.md" << 'EOF'
---
title: "Working With Files"
date: 2025-12-10T00:15:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "files"
topics:
  - "Terminal Basics"
  - "Linux Basics"
showtoc: true
tocopen: false
---

# Working With Files

## TH – บทนำ
สอนให้ผู้เรียนจัดการไฟล์พื้นฐานจากเทอร์มินัล:
- สร้างไฟล์
- คัดลอก
- ย้าย
- ลบ
- เปิดอ่านไฟล์แบบง่าย

## EN – Introduction
Teach basic file operations:
- Create, copy, move, delete files
- View file contents

## TH – เนื้อหาหลัก
1. สร้างไฟล์ด้วย `touch`
2. ดูเนื้อไฟล์ด้วย `cat`, `less`, `head`, `tail`
3. คัดลอกไฟล์ด้วย `cp`
4. ย้ายหรือเปลี่ยนชื่อไฟล์ด้วย `mv`
5. ลบไฟล์ด้วย `rm` และคำเตือนเรื่องการลบ

## EN – Main Content
1. `touch` to create empty files
2. `cat`, `less`, `head`, `tail` to view contents
3. `cp` to copy files
4. `mv` to move or rename files
5. `rm` to delete files (and why to be careful)

## Vocabulary (TH + EN)
- Copy – คัดลอก – Make a duplicate of a file  
- Move – ย้าย – Move file to a different location or rename it  

## Exercises
- ให้ผู้เรียนสร้างไฟล์ตัวอย่าง คัดลอก ย้าย และลบด้วยตัวเอง
EOF

# 1.3 Permissions
cat > "$MOD1_DIR/03-permissions.md" << 'EOF'
---
title: "Linux Permissions Basics"
date: 2025-12-10T00:20:00+07:00
draft: false
weight: 3
tags:
  - "linux"
  - "permissions"
topics:
  - "Terminal Basics"
  - "Linux Basics"
showtoc: true
tocopen: false
---

# Linux Permissions Basics

## TH – บทนำ
สอนแนวคิดพื้นฐานเรื่องสิทธิ์:
- owner / group / others
- read / write / execute
- การดู permission ด้วย `ls -l`

## EN – Introduction
Teach Linux permission model:
- owner / group / others
- r / w / x
- `ls -l` overview

## TH – เนื้อหาหลัก
1. อ่านผล `ls -l` จาก permission string เช่น `-rwxr-xr--`
2. ความหมายของ r, w, x
3. ใช้ `chmod` แบบง่าย ๆ
4. แนวคิดเรื่องการใช้สิทธิ์ให้ปลอดภัย

## EN – Main Content
1. Read permission strings from `ls -l`
2. Meaning of r, w, x
3. Simple `chmod` usage
4. High-level security considerations

## Vocabulary (TH + EN)
- Permission – สิทธิ์ – What a user is allowed to do with a file  
- Owner – เจ้าของไฟล์ – The user who owns the file  

## Exercises
- ให้ผู้เรียนลองใช้ `ls -l` ดูสิทธิ์ของไฟล์ต่าง ๆ และอธิบายความหมาย
EOF

# ==========
# MODULE 2 – SYSTEM (PROCESS, SERVICES, LOGS)
# ==========
MOD2_DIR="$BASE_DIR/module-2-system"
mkdir -p "$MOD2_DIR"

cat > "$MOD2_DIR/_index.md" << 'EOF'
---
title: "Module 2 – System and Services"
weight: 2
categories:
  - "Linux"
topics:
  - "System Basics"
  - "Processes and Logs"
summary: "เรียนรู้การดู process, บริการ (service) และ log พื้นฐาน สำหรับการแก้ปัญหาเบื้องต้น."
showtoc: true
tocopen: false
---

# Module 2 – System and Services

> TH: โมดูลนี้ช่วยให้ผู้เรียนเริ่มมองระบบ Linux ในมุมของ process, service และ log  
> EN: This module introduces processes, services, and basic logs for troubleshooting.
EOF

# 2.1 Process Management
cat > "$MOD2_DIR/01-process-management.md" << 'EOF'
---
title: "Process Management"
date: 2025-12-10T00:25:00+07:00
draft: false
weight: 1
tags:
  - "linux"
  - "process"
topics:
  - "System Basics"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Process Management

## TH – บทนำ
สอนผู้เรียนให้ดู process ที่รันอยู่ และหยุด process ที่มีปัญหา:
- ใช้ `ps aux` ดู process ทั้งระบบ
- ใช้ `top` หรือ `htop` ดูการใช้ทรัพยากร
- ใช้ `kill` หรือ `pkill` หยุด process

## EN – Introduction
Teach how to inspect and control processes:
- `ps aux`, `top` / `htop`
- `kill`, `pkill`

## Vocabulary (TH + EN)
- Process – โพรเซส – A running program instance  
- PID – หมายเลขโพรเซส – Process ID  

## Exercises
- ให้ผู้เรียนลองหา process ที่ใช้ CPU สูงสุดจาก `top` แล้วอธิบาย
EOF

# 2.2 Services
cat > "$MOD2_DIR/02-services.md" << 'EOF'
---
title: "Services and systemctl"
date: 2025-12-10T00:30:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "systemd"
  - "services"
topics:
  - "System Basics"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Services and systemctl

## TH – บทนำ
แนะนำแนวคิด service ใน Linux:
- service ต่างจาก process ปกติอย่างไร
- systemd และ systemctl

## EN – Introduction
Explain:
- What services are
- The role of systemd
- Basic `systemctl` usage

## TH – เนื้อหาหลัก
1. ใช้ `systemctl status` ดูสถานะ service
2. สั่ง start / stop / restart service
3. ดู log สั้น ๆ ผ่าน `journalctl -u servicename`

## EN – Main Content
1. `systemctl status`
2. Start / stop / restart
3. Short logs with `journalctl -u`

## Exercises
- ให้ผู้เรียนลอง restart service ตัวหนึ่งและเช็ค log
EOF

# 2.3 Log Basics
cat > "$MOD2_DIR/03-log-basics.md" << 'EOF'
---
title: "Basic Log Analysis"
date: 2025-12-10T00:35:00+07:00
draft: false
weight: 3
tags:
  - "linux"
  - "logs"
topics:
  - "System Basics"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Basic Log Analysis

## TH – บทนำ
เน้นให้ผู้เรียนรู้ว่า:
- log อยู่ที่ไหน
- ดู log ยังไง
- ใช้ log ในการแก้ปัญหาพื้นฐานได้อย่างไร

## EN – Introduction
Focus on:
- Where logs are stored
- How to view logs
- Using logs in basic troubleshooting

## TH – เนื้อหาหลัก
1. แนะนำโฟลเดอร์ `/var/log`
2. แนะนำเครื่องมือ `journalctl`
3. ใช้ `grep` เพื่อค้นหาคำสำคัญใน log

## EN – Main Content
1. Log directories like `/var/log`
2. `journalctl` basics
3. Using `grep` to search in logs

## Exercises
- ให้ผู้เรียนลองค้นคำว่า "error" ใน log หนึ่งไฟล์
EOF

# ==========
# MODULE 3 – NETWORKING
# ==========
MOD3_DIR="$BASE_DIR/module-3-networking"
mkdir -p "$MOD3_DIR"

cat > "$MOD3_DIR/_index.md" << 'EOF'
---
title: "Module 3 – Networking Basics"
weight: 3
categories:
  - "Linux"
  - "Networking"
topics:
  - "Networking Basics"
summary: "พื้นฐานคำสั่ง network บน Linux เพื่อใช้ตรวจสอบและแก้ปัญหาเบื้องต้น."
showtoc: true
tocopen: false
---

# Module 3 – Networking Basics

> TH: โมดูลนี้ปูพื้นคำสั่ง network พื้นฐานที่ใช้บ่อยในงานจริง  
> EN: This module covers essential networking commands for basic troubleshooting.
EOF

# 3.1 Network Commands
cat > "$MOD3_DIR/01-network-commands.md" << 'EOF'
---
title: "Network Commands"
date: 2025-12-10T00:40:00+07:00
draft: false
weight: 1
tags:
  - "linux"
  - "network"
topics:
  - "Networking Basics"
showtoc: true
tocopen: false
---

# Network Commands

## TH – บทนำ
สอนคำสั่ง network พื้นฐาน:
- ดู IP address
- ping
- traceroute หรือ tracepath
- ss หรือ netstat เพื่อดู port ที่เปิด

## EN – Introduction
Teach basic network commands:
- Show IP address
- `ping`
- `traceroute` / `tracepath`
- `ss` / `netstat` for listening ports

## Exercises
- ให้ผู้เรียนลอง ping gateway และ ping เว็บไซต์หนึ่ง
EOF

# 3.2 Network Troubleshooting
cat > "$MOD3_DIR/02-network-troubleshooting.md" << 'EOF'
---
title: "Network Troubleshooting Basics"
date: 2025-12-10T00:45:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "network"
  - "troubleshooting"
topics:
  - "Networking Basics"
showtoc: true
tocopen: false
---

# Network Troubleshooting Basics

## TH – บทนำ
สรุป workflow การแก้ปัญหา network พื้นฐาน:
1. ดูว่าเครื่องมี IP หรือไม่
2. ping gateway
3. ping internet
4. ตรวจ DNS

## EN – Introduction
Basic troubleshooting workflow:
1. Check if the host has an IP
2. Ping gateway
3. Ping external site
4. Check DNS

## Exercises
- ให้ผู้เรียนจำลองกรณี network ใช้งานไม่ได้ แล้วลองไล่เช็คทีละขั้น
EOF

# ==========
# MODULE 4 – LABS
# ==========
MOD4_DIR="$BASE_DIR/module-4-labs"
mkdir -p "$MOD4_DIR"

cat > "$MOD4_DIR/_index.md" << 'EOF'
---
title: "Module 4 – Labs"
weight: 4
categories:
  - "Linux"
topics:
  - "Hands-on Labs"
summary: "แบบฝึกหัดและ Lab สำหรับทบทวนเนื้อหาทั้งหมด."
showtoc: true
tocopen: false
---

# Module 4 – Labs

> TH: รวบรวม Lab เพื่อให้ผู้เรียนได้ลงมือทำจริงจากสิ่งที่เรียนมาแล้ว  
> EN: Collection of hands-on labs to practice what has been learned.
EOF

# 4.1 Lab Navigation
cat > "$MOD4_DIR/01-lab-navigation.md" << 'EOF'
---
title: "Lab – Navigation and Files"
date: 2025-12-10T00:50:00+07:00
draft: false
weight: 1
tags:
  - "linux"
  - "lab"
topics:
  - "Hands-on Labs"
  - "Linux Basics"
showtoc: true
tocopen: false
---

# Lab – Navigation and Files

## TH – เป้าหมาย
- ผู้เรียนสามารถใช้ `pwd`, `ls`, `cd`, `cp`, `mv`, `rm` ได้อย่างถูกต้อง
- ผู้เรียนเข้าใจโครงสร้างโฟลเดอร์ในระบบจริง

## EN – Goals
- Use `pwd`, `ls`, `cd`, `cp`, `mv`, `rm` confidently
- Understand real directory layout

## TH – โจทย์ตัวอย่าง
1. สร้างโฟลเดอร์สำหรับงานของตัวเองใน home และสร้างไฟล์ตัวอย่างภายใน
2. คัดลอกไฟล์ไปอีกโฟลเดอร์หนึ่ง
3. ย้ายไฟล์และลบไฟล์ที่ไม่ต้องการ

## EN – Tasks
1. Create a working directory in your home and create some files
2. Copy files to another directory
3. Move and remove files as required
EOF

# 4.2 Lab Log Analysis
cat > "$MOD4_DIR/02-lab-log-analysis.md" << 'EOF'
---
title: "Lab – Basic Log Analysis"
date: 2025-12-10T00:55:00+07:00
draft: false
weight: 2
tags:
  - "linux"
  - "lab"
  - "logs"
topics:
  - "Hands-on Labs"
  - "Processes and Logs"
showtoc: true
tocopen: false
---

# Lab – Basic Log Analysis

## TH – เป้าหมาย
- ผู้เรียนสามารถเปิดดู log พื้นฐาน
- สามารถค้นหา error หรือข้อความที่น่าสนใจใน log ได้

## EN – Goals
- Open and read basic logs
- Search for errors or interesting events in logs

## TH – โจทย์ตัวอย่าง
1. ใช้ `journalctl` ดู log ล่าสุด
2. ใช้ `grep` ค้นหาคำว่า "error" หรือ "fail" ใน log หนึ่งไฟล์
3. ให้ผู้เรียนอธิบายว่าข้อความที่พบอาจสื่อถึงปัญหาอะไร

## EN – Tasks
1. Use `journalctl` to view recent logs
2. Use `grep` to find "error" or "fail" in a log file
3. Ask learners to interpret what the messages might indicate
EOF

echo "Linux Basics course structure created successfully."

