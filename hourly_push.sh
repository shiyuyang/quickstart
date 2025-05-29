#!/bin/bash

# 切换到你的项目目录 (如果 cron 从其他地方执行此脚本)
cd "$(dirname "$0")" || exit

# 添加所有更改到暂存区
git add .

# 提交更改，使用当前日期和时间作为提交信息
# 你可以根据需要修改提交信息
COMMIT_MESSAGE="Automated hourly push: $(date +'%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MESSAGE"

# 推送到远端
# 假设你的远端名为 origin，分支为主分支 (e.g., main or master)
# 如果你的分支名不同，请修改下面的 'main'
git push origin main

# (可选) 记录日志
echo "Pushed to remote at $(date)" >> /tmp/hourly_push.log