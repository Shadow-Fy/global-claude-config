#!/usr/bin/env bash
# 人工参与的复现循环。
# 复制此文件，编辑下方的步骤，然后运行。
# Agent 运行脚本；用户根据终端提示操作。
#
# 用法：
#   bash hitl-loop.template.sh
#
# 两个辅助函数：
#   step "<指令>"            → 显示指令，等待按 Enter
#   capture VAR "<问题>"      → 显示问题，将答案读入 VAR
#
# 最后，捕获的值以 KEY=VALUE 格式输出，供 agent 解析。

set -euo pipefail

step() {
  printf '\n>>> %s\n' "$1"
  read -r -p "    [完成后按 Enter] " _
}

capture() {
  local var="$1" question="$2" answer
  printf '\n>>> %s\n' "$question"
  read -r -p "    > " answer
  printf -v "$var" '%s' "$answer"
}

# --- 编辑下方内容 ---------------------------------------------------------

step "打开 http://localhost:3000 并登录。"

capture ERRORED "点击'导出'按钮。是否抛出了错误？(y/n)"

capture ERROR_MSG "粘贴错误消息（如果没有则输入 'none'）："

# --- 编辑上方内容 ---------------------------------------------------------

printf '\n--- 捕获结果 ---\n'
printf 'ERRORED=%s\n' "$ERRORED"
printf 'ERROR_MSG=%s\n' "$ERROR_MSG"
