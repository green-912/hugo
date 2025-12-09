#!/usr/bin/env bash
set -e

BASE="content/networking"

mkdir -p $BASE
mkdir -p $BASE/01-foundations

# Main index
cat > "$BASE/_index.md" << 'EOT'
---
title: "Networking – Training Book"
weight: 1
---

## TH: หนังสือสอน Networking สำหรับน้องๆ

เล่มนี้ออกแบบให้เข้าใจง่าย เรียงลำดับจากพื้นฐานไปถึงการวิเคราะห์แพ็กเก็ตจริง  
เหมาะกับสอนออนไลน์และห้องเรียน

## EN: Networking Training Book

This online book is designed for beginners and analysts.
EOT

# Chapter index
cat > "$BASE/01-foundations/_index.md" << 'EOT'
---
title: "Chapter 1 – Foundations"
weight: 10
---

## TH: บทนี้เกี่ยวกับอะไร

พื้นฐานสำคัญก่อนเข้าสู่ระบบเน็ตเวิร์ค

## EN: What this chapter covers

Basic concepts before deeper networking topics.
EOT

# Lesson 1
cat > "$BASE/01-foundations/intro-networking.md" << 'EOT'
---
title: "What is a Network?"
weight: 1
categories: ["Foundations"]
topics: ["Basics"]
---

## TH: Network คืออะไร?

Network = ระบบเชื่อมอุปกรณ์เพื่อแลกข้อมูล  
ใช้งานในบ้าน องค์กร ทุกที่ที่มีอุปกรณ์สื่อสาร

## EN: What is a Network?

A network connects devices to exchange data.
EOT

# Lesson 2
cat > "$BASE/01-foundations/how-internet-works.md" << 'EOT'
---
title: "How the Internet Works (Simple Explanation)"
weight: 2
categories: ["Foundations"]
topics: ["Internet"]
---

## TH: อินเทอร์เน็ตทำงานอย่างไร

อินเทอร์เน็ตคือเครือข่ายของเครือข่าย  
Router ส่งแพ็กเก็ตตามเส้นทางจนถึงปลายทาง

## EN: How the Internet Works

The Internet is a network of networks.  
Routers forward packets hop-by-hop to destinations.
EOT

# Lesson 3
cat > "$BASE/01-foundations/network-components.md" << 'EOT'
---
title: "Basic Network Components"
weight: 3
categories: ["Foundations"]
topics: ["Devices"]
---

## TH: อุปกรณ์สำคัญ

- Switch  
- Router  
- Access Point  
- Firewall  
- Server  

## EN: Key Devices

- Switch  
- Router  
- Access Point  
- Firewall  
- Server  
EOT

echo "สร้างโครงสร้าง Networking Book เรียบร้อย!"
