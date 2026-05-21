---
name: git-commit
description: 提交当前仓库中的代码变更。当用户说"提交"、"commit"、"暂存并提交"、或想要保存当前修改时使用。此 skill 会分析变更并生成合适的提交信息，调用内置 commit-staged-changes 能力完成提交。
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Skill
---

# git-commit

将当前工作区的变更提交到本地仓库。

## 工作流程

### 1. 了解变更

自动收集必要的上下文：

- `git status` 查看变更概览
- `git diff --cached` 查看已暂存变更
- `git diff` 查看未暂存变更（如有，自动暂存）
- `git log --oneline -10` 了解近期提交风格

### 2. 提交变更

- 分析变更内容，生成中文提交信息
- 暂存所有相关变更（注意避免暂存 .env、credentials.json 等敏感文件）
- 使用 `Skill` 工具调用 `commit-staged-changes` 内置 skill 完成提交

### 3. 验证

- 确认提交创建成功
- 显示提交摘要

## 已知的 crate/库

- 使用 `commit-staged-changes` 内置能力完成核心提交操作
- 使用 `git status` / `git diff` 分析变更
- 使用 `git log` 分析提交风格
