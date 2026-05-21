# global-claude-config

[Claude Code](https://claude.ai/code) 全局配置，覆盖所有项目的行为指令、自定义命令和技能。

## 内容

| 路径 | 说明 |
|---|---|
| `CLAUDE.md` | 全局行为指令：编码规范、沟通方式、执行安全规则 |
| `commands/` | 自定义 slash 命令 |
| `skills/` | 自定义技能 |
| `plugins.json` | 推荐插件清单（marketplace: `anthropics/claude-plugins-official`） |
| `settings.json` | 全局设置（API 代理端点、模型映射） |

## CLAUDE.md 要点

- **沟通**：中文交流，代码/文件名用英文，文档/注释用中文
- **先思考再编码**：明确假设，暴露权衡，不确定就问
- **简洁至上**：不搞投机性扩展，如无必要勿增实体
- **精准修改**：只动必须动的，不顺手清理无关代码
- **目标驱动**：将任务转化为可验证的标准，Bug 修复采用 TDD
- **执行安全**：git 操作需用户明确授权

## 自定义命令

| 命令 | 功能 |
|---|---|
| `/create-issue` | 将研究结果整理为 Issue |
| `/issue-rewrite` | 完善已有 Issue 描述 |

## 自定义技能

| 技能 | 说明 |
|---|---|
| `diagnose` | Bug 与性能回退的规范化诊断流程 |
| `execute` | 按计划逐项执行 |
| `grill-me` | 对方案进行压力测试 |
| `grill-with-docs` | 对照领域模型和 ADR 进行方案盘问 |
| `improve-codebase-architecture` | 基于领域语言和 ADR 的架构深化 |
| `tdd` | 红-绿-重构测试驱动开发 |
| `to-issues` | 将计划/PRD 分解为可领取的 Issue |
| `to-prd` | 将对话上下文转为 PRD |

## 推荐插件

见 `plugins.json`。在 Claude Code 中执行：

```
/plugin install <name>@github:anthropics/claude-plugins-official
```

已配置插件：`claude-md-management`, `code-review`, `code-simplifier`, `frontend-design`, `github`, `ralph-wiggum`, `skill-creator`

## 全局设置

`settings.json` 配置了 API 代理端点及模型映射，通过代理将 Claude 模型路由到兼容 API。

## .gitignore

对话历史、会话数据、记忆、缓存、遥测等运行时数据均不纳入版本控制。
