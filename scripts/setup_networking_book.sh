#!/usr/bin/env bash

set -e

BASE="content/networking"

# สร้างโครงโฟลเดอร์หลัก
mkdir -p "$BASE"/{01-foundations,02-osi-model,03-tcp-ip,04-protocols,05-tools,06-labs,07-case-studies,99-glossary}

# หน้าเปิดเล่ม Networking
cat > "$BASE/_index.md" << 'EOT'
---
title: "Networking – Training Book"
weight: 1
---

## TH: ยินดีต้อนรับสู่เล่ม Networking

เล่มนี้ออกแบบมาเพื่อใช้อบรมและสอนน้องๆ ด้านระบบเครือข่าย  
อ่านตามลำดับ Chapter จะทำให้ค่อยๆ มองภาพรวมได้ชัดขึ้น จากพื้นฐาน → โปรโตคอล → เครื่องมือ → Labs

## EN: Welcome to the Networking Training Book

This online book is designed to train juniors in networking.  
Follow the chapters in order to gradually build a solid understanding, from fundamentals to protocols, tools, and hands-on labs.
EOT

# ฟังก์ชันช่วยสร้าง _index.md ของแต่ละ Chapter
make_chapter_index () {
  local dir="$1"
  local title="$2"
  local weight="$3"

  cat > "$BASE/$dir/_index.md" << EOT
---
title: "$title"
weight: $weight
---

## TH: บทนี้เกี่ยวกับอะไร

(ใส่คำอธิบายบทนี้เป็นภาษาไทยสั้นๆ)

## EN: What this chapter covers

(Add a short English description of this chapter here.)
EOT
}

make_chapter_index "01-foundations"      "Chapter 1 – Foundations"      10
make_chapter_index "02-osi-model"        "Chapter 2 – OSI Model"        20
make_chapter_index "03-tcp-ip"           "Chapter 3 – TCP/IP Suite"     30
make_chapter_index "04-protocols"        "Chapter 4 – Key Protocols"    40
make_chapter_index "05-tools"            "Chapter 5 – Tools"            50
make_chapter_index "06-labs"             "Chapter 6 – Labs"             60
make_chapter_index "07-case-studies"     "Chapter 7 – Case Studies"     70

# Glossary index
cat > "$BASE/99-glossary/_index.md" << 'EOT'
---
title: "Glossary – Networking Terms (TH+EN)"
weight: 99
---

รวบรวมคำศัพท์ด้านเครือข่าย ทั้งภาษาไทยและอังกฤษ พร้อมคำอธิบายสั้นๆ  
Use this glossary as a quick reference for students.
EOT

echo "สร้างโครง Networking Book เสร็จแล้วภายใต้ $BASE"
