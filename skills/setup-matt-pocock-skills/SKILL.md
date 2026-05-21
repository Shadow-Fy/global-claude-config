---
name: setup-matt-pocock-skills
description: 在 AGENTS.md/CLAUDE.md 中设置 `## Agent skills` 区块以及 `docs/agents/` 目录，使工程技能了解该仓库的问题跟踪器（GitHub 或本地 markdown）、分类标签词汇表和领域文档布局。在首次使用 to-issues、to-prd、triage、diagnose、tdd、improve-codebase-architecture 或 zoom-out 之前运行——或者当这些技能似乎缺少关于问题跟踪器、分类标签或领域文档的上下文时。
disable-model-invocation: true
---

# 设置 Matt Pocock 的技能

搭建工程技能所期望的每个仓库的配置：

- **问题跟踪器**——问题存放的位置（默认 GitHub；本地 markdown 也原生支持）
- **分类标签**——用于五个标准分类角色的字符串
- **领域文档**——CONTEXT.md 和 ADR 所在位置，以及读取它们的消费规则

这是一个提示驱动的技能，不是确定性的脚本。探索、呈现你发现的内容、与用户确认，然后写入。

## 流程

### 1. 探索

查看当前仓库以了解其起始状态。读取已存在的内容；不要假设：

- `git remote -v` 和 `.git/config`——这是 GitHub 仓库吗？是哪个？
- 仓库根目录的 `AGENTS.md` 和 `CLAUDE.md`——存在吗？其中是否已有 `## Agent skills` 区块？
- 仓库根目录的 `CONTEXT.md` 和 `CONTEXT-MAP.md`
- `docs/adr/` 和任何 `src/*/docs/adr/` 目录
- `docs/agents/`——此技能之前的输出是否已存在？
- `.scratch/`——表明本地 markdown 问题跟踪器约定已在使用的标志

### 2. 呈现发现并询问

总结哪些存在、哪些缺失。然后**逐一**引导用户完成三个决策——呈现一个章节，获得用户的回答，然后进入下一个。不要一次性抛出所有三个。

假设用户不知道这些术语的含义。每个章节以简短的解释开始（它是什么，为什么这些技能需要它，不同选择会有什么变化）。然后展示选项和默认值。

**章节 A — 问题跟踪器。**

> 解释："问题跟踪器"是本仓库的问题存放位置。像 to-issues、triage、to-prd 和 qa 这样的技能从中读取和写入——它们需要知道是调用 `gh issue create`、在 `.scratch/` 下写 markdown 文件，还是遵循你描述的其他工作流。选择你实际跟踪此仓库工作的位置。

默认姿态：这些技能是为 GitHub 设计的。如果 `git remote` 指向 GitHub，建议 GitHub。如果 `git remote` 指向 GitLab（`gitlab.com` 或自托管主机），建议 GitLab。否则（或者如果用户偏好），提供：

- **GitHub**——问题存在于仓库的 GitHub Issues 中（使用 `gh` CLI）
- **GitLab**——问题存在于仓库的 GitLab Issues 中（使用 [`glab`](https://gitlab.com/gitlab-org/cli) CLI）
- **本地 markdown**——问题作为文件存在于本仓库的 `.scratch/<feature>/` 下（适合个人项目或没有远程仓库的项目）
- **其他**（Jira、Linear 等）——让用户用一段话描述工作流；技能将记录为自由格式的散文

**章节 B — 分类标签词汇表。**

> 解释：当 triage 技能处理传入的问题时，它通过一个状态机移动——需要评估、等待报告者、准备好给 AFK agent、准备好给人工、或不会修复。为此，它需要应用与你*实际配置*的字符串匹配的标签（或问题跟踪器中的等价物）。如果你的仓库已经使用了不同的标签名称（例如 `bug:triage` 而不是 `needs-triage`），在这里映射它们，以便技能应用正确的标签而不是创建重复。

五个标准角色：

- `needs-triage`——维护者需要评估
- `needs-info`——等待报告者提供信息
- `ready-for-agent`——完全指定，AFK 就绪（agent 可以在没有人类上下文的情况下接手）
- `ready-for-human`——需要人类实现
- `wontfix`——不会处理

默认：每个角色的字符串等于其名称。询问用户是否要覆盖任何角色。如果问题跟踪器没有现有标签，默认值即可。

**章节 C — 领域文档。**

> 解释：一些技能（improve-codebase-architecture、diagnose、tdd）读取 `CONTEXT.md` 文件来学习项目的领域语言，以及 `docs/adr/` 来了解过去的架构决策。它们需要知道仓库是有一个全局上下文还是多个（例如具有独立前端/后端上下文的单体仓库），以便查找正确的位置。

确认布局：

- **单上下文**——仓库根目录一个 `CONTEXT.md` + `docs/adr/`。大多数仓库如此。
- **多上下文**——根目录的 `CONTEXT-MAP.md` 指向每个上下文的 `CONTEXT.md` 文件（通常是单体仓库）。

### 3. 确认并编辑

向用户展示草稿：

- 要添加到正在编辑的 `CLAUDE.md` / `AGENTS.md` 中的 `## Agent skills` 区块（见第 4 步的选择规则）
- `docs/agents/issue-tracker.md`、`docs/agents/triage-labels.md`、`docs/agents/domain.md` 的内容

让他们在写入之前编辑。

### 4. 写入

**选择要编辑的文件：**

- 如果 `CLAUDE.md` 存在，编辑它。
- 否则如果 `AGENTS.md` 存在，编辑它。
- 如果两者都不存在，询问用户要创建哪一个——不要替他们选择。

当 `CLAUDE.md` 已存在时，永远不要创建 `AGENTS.md`（反之亦然）——始终编辑已存在的那个。

如果所选文件中已存在 `## Agent skills` 区块，原地更新其内容，而不是追加重复。不要覆盖用户对周围章节的编辑。

区块格式：

```markdown
## Agent skills

### Issue tracker

[问题跟踪位置的概要说明]。参见 `docs/agents/issue-tracker.md`。

### Triage labels

[标签词汇表的概要说明]。参见 `docs/agents/triage-labels.md`。

### Domain docs

[布局的概要说明——"single-context" 或 "multi-context"]。参见 `docs/agents/domain.md`。
```

然后使用此技能文件夹中的种子模板作为起点编写三个文档文件：

- [issue-tracker-github.md](./issue-tracker-github.md) — GitHub 问题跟踪器
- [issue-tracker-gitlab.md](./issue-tracker-gitlab.md) — GitLab 问题跟踪器
- [issue-tracker-local.md](./issue-tracker-local.md) — 本地 markdown 问题跟踪器
- [triage-labels.md](./triage-labels.md) — 标签映射
- [domain.md](./domain.md) — 领域文档消费规则 + 布局

对于"其他"问题跟踪器，使用用户的描述从头编写 `docs/agents/issue-tracker.md`。

### 5. 完成

告诉用户设置已完成，以及哪些工程技能现在将从这些文件中读取。提到他们之后可以直接编辑 `docs/agents/*.md`——只有在他们想切换问题跟踪器或从头重新开始时才需要重新运行此技能。
