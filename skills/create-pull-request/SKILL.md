---
name: create-pull-request
description: 从当前分支创建 Pull Request。当用户说"创建 PR"、"提 PR"、"发起合并请求"、"create pull request"、"open PR"时使用。分析分支上的所有提交记录，生成简洁的 PR 描述。
allowed-tools:
  - Bash
---

# create-pull-request

从当前分支创建 Pull Request。

## 工作流程

### 1. 收集信息

- `git branch --show-current` 查看当前分支（不能是 main/master）
- `git log main..HEAD --oneline` 查看分支上所有提交
- `git diff main...HEAD` 查看与 main 的差异
- `git remote -v` 确认远程仓库

### 2. 创建 PR

使用 `gh pr create` 创建 PR，附带简洁描述：

```
## 变更摘要

- [基于提交记录生成 1-3 条要点]

## 测试计划

- [ ] 本地验证通过
- [ ] 相关测试通过
```

### 3. 验证

- 确认 PR 创建成功
- 显示 PR 链接

## 注意事项

- 确保不在 main/master 分支上创建 PR
- 需要 `gh` CLI 已安装并认证
- PR 描述基于提交历史自动生成，保持简洁
