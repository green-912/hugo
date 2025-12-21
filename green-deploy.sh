#!/bin/bash

# --- สวนแห่งความคิดของนายเขียว: Deployment & Backup Tool ---

# ตั้งค่าตัวแปร (แก้ไขตรงนี้ให้ตรงกับข้อมูลของคุณ)
REMOTE_USER="root"       # เปลี่ยนเป็นชื่อ User ที่คุณใช้
REMOTE_HOST="knupan.com"
REMOTE_DEST="/var/www/blog"

echo "================================================"
echo "    🌿 เริ่มกระบวนการส่งความรู้ขึ้นระบบ...         "
echo "================================================"

# 1. ล้างข้อมูลเก่า
echo "🧹 1. Cleaning up old build..."
rm -rf public/

# 2. สร้างหน้าเว็บใหม่ (Build)
echo "🏗️ 2. Building the site with Hugo..."
if ! hugo --minify; then
    echo "❌ Hugo build failed! Deployment aborted."
    exit 1
fi

# 3. ส่งขึ้น Server (rsync)
echo "🚚 3. Deploying to $REMOTE_HOST via rsync..."
# ใช้ -e "ssh" เพื่อให้ rsync เรียกใช้ Private Key ที่อยู่ในระบบอัตโนมัติ
if rsync -avz --delete public/ ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DEST}; then
    echo "✅ Web Deployment Successful!"
else
    echo "❌ Deployment failed! Please check your SSH connection."
    exit 1
fi

# 4. สำรองข้อมูลขึ้น GitHub (Backup)
echo "💾 4. Backing up source code to GitHub..."
git add .
read -p "📝 ระบุคำอธิบายการอัปเดต (Commit Message): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="Update: $(date '+%Y-%m-%d %H:%M')"
fi

git commit -m "$commit_msg"
git push origin main

echo "------------------------------------------------"
echo "🌿 ทุกอย่างเรียบร้อย! ข้อมูลออนไลน์และสำรองเรียบร้อย"
echo "🌐 URL: https://www.knupan.com/blog"
