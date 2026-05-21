---
name: git-push
description: 推送当前分支到远程仓库。当用户说"推送"、"push"、"推到远程"、或想要将本地提交推送到远程仓库时使用。会根据分支保护规则决定是否安全推送。
allowed-tools:
  - Bash
  - Skill
---

# git-push

将当前分支推送到远程仓库。

## 工作流程

### 1. 收集信息

- `git branch --show-current` 查看当前分支
- `git remote -v` 查看远程仓库
- 检查当前分支是否有 upstream 分支

### 2. 推送策略

**当前在 main/master 分支时：**
- 使用 `git push origin main` 推送
- 推送成功则完成
- 推送失败（受保护分支不允许直接推送）→ 告知用户无法直接推送，建议创建新分支后使用 commit-push-pr

**当前在非 main 分支时：**
- 使用 `git push -u origin <branch>` 推送（首次推送需要 -u）
- 如果上游已存在，使用 `git push` 即可

### 3. 验证

- 确认推送成功
- 显示推送结果摘要

## 注意事项

- 不执行 force push
- 不修改或删除远程分支
- 推送失败时提供清晰的错误信息和后续建议
