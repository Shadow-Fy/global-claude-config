---
name: commit-push-pr
description: 完整 Git 工作流：提交变更 → 推送到远程 → 创建 PR 或直接推送到 main。当用户说"提交流推送并创建 PR"、"完整提交"、"commit and push"、"一条龙提交"、"全部搞定"、或想要一次性完成从提交到 PR 的完整流程时使用。自动判断分支保护和推送策略。
allowed-tools:
  - Bash
  - Skill
---

# commit-push-pr

完整的 Git 工作流：提交变更、推送远程、创建 PR 或直接推送到 main。

此 skill 会按顺序调用子 skill 完成各个步骤。

## 工作流程

### 步骤 1：分析当前状态

- `git status` 查看变更
- `git branch --show-current` 查看当前分支
- 如果没有任何变更（工作区干净），直接退出并告知用户

### 步骤 2：判断分支策略

**情况 A：当前在 main/master 分支**
1. 尝试直接推送检查：`git push origin main --dry-run` 测试是否可推送
2. 如果可以推送：提交 → `git-push` → 完成
3. 如果受保护无法推送：
   - 创建新分支（基于变更类型生成分支名：`fix/描述` 或 `feat/描述`）
   - 切换到新分支
   - 使用 `git-commit` 提交
   - 使用 `git-push` 推送
   - 使用 `create-pull-request` 创建 PR

**情况 B：当前在非 main 分支**
1. 使用 `git-commit` 提交变更
2. 使用 `git-push` 推送到远程
3. 使用 `create-pull-request` 创建 PR

### 逐步执行说明

使用 `Skill` 工具调用子 skill：

1. 调用 `git-commit` 技能完成提交
2. 调用 `git-push` 技能推送代码
3. 如需创建 PR，调用 `create-pull-request` 技能
4. 如需创建新分支（从 main 切出），先创建分支再调用子技能

每次调用子技能后，等待其完成再进入下一步。

### 完成

执行成功后，输出工作流摘要：
- 提交的变更摘要
- 推送的分支
- PR 链接（如已创建）
