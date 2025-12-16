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
