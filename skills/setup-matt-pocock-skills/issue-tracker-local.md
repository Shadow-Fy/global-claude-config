# 问题跟踪器：本地 Markdown

本仓库的问题和 PRD 作为 markdown 文件存在于 `.scratch/` 目录中。

## 约定

- 每个特性一个目录：`.scratch/<feature-slug>/`
- PRD 是 `.scratch/<feature-slug>/PRD.md`
- 实施问题是 `.scratch/<feature-slug>/issues/<NN>-<slug>.md`，从 `01` 开始编号
- 分类状态记录在每个问题文件顶部的 `Status:` 行中（角色字符串见 `triage-labels.md`）
- 评论和对话历史追加到文件底部 `## Comments` 标题下

## 当技能说"发布到问题跟踪器"

在 `.scratch/<feature-slug>/` 下创建一个新文件（如果需要则创建目录）。

## 当技能说"获取相关工单"

读取引用路径处的文件。用户通常直接传递路径或问题编号。
