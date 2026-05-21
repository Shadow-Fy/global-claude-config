# CONTEXT.md 格式

## 结构

```md
# {上下文名称}

{一两句描述，说明这个上下文是什么以及为什么存在。}

## 语言

**Order**：
{该术语的简洁描述}
_避免使用_：Purchase, transaction

**Invoice**：
发货后发给客户的付款请求。
_避免使用_：Bill, payment request

**Customer**：
下订单的个人或组织。
_避免使用_：Client, buyer, account

## 关系

- **Order** 产生一个或多个 **Invoice**
- **Invoice** 恰好属于一个 **Customer**

## 示例对话

> **开发者：**"当 **Customer** 下单 **Order** 时，我们是否立即创建 **Invoice**？"
> **领域专家：**"不——**Invoice** 只在 **Fulfillment** 确认后才生成。"

## 标记的歧义

- "account" 曾被用来同时指代 **Customer** 和 **User**——已解决：这是两个不同的概念。
```

## 规则

- **要有主见。** 当同一个概念有多个词时，选最好的一个，将其他列为避免使用的别名。
- **明确标记冲突。** 如果一个术语有歧义，在"标记的歧义"中指出，并给出清晰的分辨。
- **保持定义精炼。** 最多一句话。定义它**是什么**，而不是它做什么。
- **展示关系。** 使用粗体术语名称，在明显的地方标明基数。
- **只包含该项目上下文特有的术语。** 一般的编程概念（超时、错误类型、工具模式）即使项目大量使用也不属于这里。在添加术语之前问：这是此上下文特有的概念，还是一般的编程概念？只有前者才属于这里。
- **在自然聚类出现时**将术语归入子标题下。如果所有术语属于单个连贯领域，平铺列表也可以。
- **写一个示例对话。** 开发者和领域专家之间的对话，展示这些术语如何自然地交互，并厘清相关概念之间的界限。

## 单一 vs 多上下文仓库

**单一上下文（大多数仓库）：** 根目录一个 `CONTEXT.md`。

**多上下文：** 根目录的 `CONTEXT-MAP.md` 列出上下文、它们的位置以及它们之间的关系：

```md
# 上下文映射

## 上下文

- [Ordering](./src/ordering/CONTEXT.md) — 接收并跟踪客户订单
- [Billing](./src/billing/CONTEXT.md) — 生成发票并处理付款
- [Fulfillment](./src/fulfillment/CONTEXT.md) — 管理仓库拣货和发货

## 关系

- **Ordering → Fulfillment**：Ordering 发出 `OrderPlaced` 事件；Fulfillment 消费它们以开始拣货
- **Fulfillment → Billing**：Fulfillment 发出 `ShipmentDispatched` 事件；Billing 消费它们以生成发票
- **Ordering ↔ Billing**：共享 `CustomerId` 和 `Money` 类型
```

该 skill 推断适用哪种结构：

- 如果 `CONTEXT-MAP.md` 存在，读取它来查找上下文
- 如果只有根目录的 `CONTEXT.md` 存在，则为单一上下文
- 如果两者都不存在，在第一个术语确定时懒创建根目录 `CONTEXT.md`

当存在多个上下文时，推断当前主题属于哪个。如果不清楚，询问。
