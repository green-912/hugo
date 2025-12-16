---
title: "How the Internet Works"
draft: false
weight: 2
categories: ["Networking"]
topics: ["Foundations"]
showtoc: true
---

# How the Internet Works
อินเทอร์เน็ต = เครือข่ายขนาดใหญ่ที่ประกอบด้วยหลายล้านเครือข่ายย่อย  
อุปกรณ์ทุกตัวสื่อสารกันผ่าน “packet” และ “routing”

---

## TH – การทำงานของอินเทอร์เน็ต (แบบคนไม่เคยเรียนก็เข้าใจ)

อินเทอร์เน็ตทำงานตามลำดับนี้:

1. **คุณขอข้อมูล** (เช่น พิมพ์ google.com)
2. **DNS แปลชื่อ → IP Address**
3. **คอมพิวเตอร์สร้าง packet → ส่งออกทางค่า gateway**
4. **Router หลายตัวช่วยส่ง packet ไปยังปลายทาง**
5. **Server ตอบกลับ**
6. **packet วิ่งย้อนกลับมา → browser แปลผล → แสดงหน้าเว็บ**

ลักษณะสำคัญ:

- ทุกอย่างเป็น “packet”  
- ทุก packet มี “ที่อยู่ผู้ส่ง–ผู้รับ”  
- Router ไม่สนใจข้อมูลภายใน สนใจแค่เส้นทาง  

---

## EN – How the Internet works (simple version)

The Internet works through these 6 steps:

1. You request a resource (e.g. google.com)
2. DNS translates the domain → IP
3. Your device creates packets and sends them to the gateway
4. Routers forward packets across networks
5. The server responds with return packets
6. Your browser reconstructs the response → shows the webpage

Key ideas:

- Everything is a **packet**  
- Every packet has **source & destination**  
- Routers only choose the path, not interpret content  

---

## ภาพประกอบ 

- dns-to-ip.png  
- packet-travel.png  
- router-forwarding.png

