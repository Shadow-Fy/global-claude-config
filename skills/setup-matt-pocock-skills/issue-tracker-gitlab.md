# 问题跟踪器：GitLab

本仓库的问题和 PRD 作为 GitLab Issues 存在。所有操作使用 [`glab`](https://gitlab.com/gitlab-org/cli) CLI。

## 约定

- **创建问题**：`glab issue create --title "..." --description "..."`。多行描述使用 heredoc。传递 `--description -` 以打开编辑器。
- **读取问题**：`glab issue view <number> --comments`。使用 `-F json` 获取机器可读的输出。
- **列出问题**：使用适当的 `--label` 过滤器运行 `glab issue list -F json`。
- **评论问题**：`glab issue note <number> --message "..."`。GitLab 将评论称为"notes"。
- **添加/移除标签**：`glab issue update <number> --label "..."` / `--unlabel "..."`。多个标签可以用逗号分隔或重复标志。
- **关闭**：`glab issue close <number>`。`glab issue close` 不接受关闭评论，因此先用 `glab issue note <number> --message "..."` 发布解释，然后关闭。
- **合并请求**：GitLab 将 PR 称为"merge requests"。使用 `glab mr create`、`glab mr view`、`glab mr note` 等——与 `gh pr ...` 相同的模式，用 `mr` 替代 `pr`，用 `note`/`--message` 替代 `comment`/`--body`。

从 `git remote -v` 推断仓库——`glab` 在克隆目录内运行时自动执行此操作。

## 当技能说"发布到问题跟踪器"

创建一个 GitLab Issue。

## 当技能说"获取相关工单"

运行 `glab issue view <number> --comments`。
