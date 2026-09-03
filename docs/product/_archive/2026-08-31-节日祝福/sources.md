# 节日祝福 来源

- 访问日期：2026-08-31
- 调研范围：竞品 App Store 页面、Apple 平台文档、产品决策访谈

## 1. 来源表

| 页面标题 | URL | 来源类型 | 访问日期 | 支持的结论 |
|---|---|---|---|---|
| 祝福短信助手 - App Store | https://apps.apple.com/cn/app/%E7%A5%9D%E7%A6%8F%E7%9F%AD%E4%BF%A1%E5%8A%A9%E6%89%8B/id6760574145 | APP_STORE | 2026-08-31 | 竞品核心功能：祝福库、AI 生成、节日推荐、搜索、收藏/模板、贺卡、提醒、会员订阅 |
| 祝福短信助手 - 隐私 | App Store 隐私标签 | APP_STORE | 2026-08-31 | 竞品声明不收集数据 |
| 祝福短信助手 - 兼容性 | App Store 技术信息 | APP_STORE | 2026-08-31 | 需 iOS 16.6+，类别工具，大小约 4.8MB |
| 祝福短信助手 - 内购 | App Store 内购项 | APP_STORE | 2026-08-31 | 存在月/年/永久会员 IAP（标价 ¥8/¥22/¥28，与描述文案 ¥3/¥12/¥25 不一致） |
| festival-greetings 仓库 | https://github.com/ruancanghui-hub/festival-greetings | OFFICIAL_SITE | 2026-08-31 | 目标代码仓库，当前为空，描述「节日祝福」 |
| Apple Human Interface Guidelines | https://developer.apple.com/design/human-interface-guidelines/ | PLATFORM_DOC | 2026-08-31 | iOS 分享面板、权限申请最佳实践 |
| App Store Review Guidelines | https://developer.apple.com/app-store/review/guidelines/ | PLATFORM_DOC | 2026-08-31 | AI 生成内容需有审核机制；隐私标签准确性要求 |

## 2. 竞品自述与独立事实边界

以下仅来自竞品 App Store 描述，**未独立验证**：

- 「海量原创祝福库」的具体规模与原创性
- 「语音祝福」功能的实际体验与使用率
- 描述中的订阅价格（¥3/¥12/¥25）与 App Store 标价（¥8/¥22/¥28）不一致，以 IAP 标价为准
- 「AI 智能祝福生成」使用的具体模型与质量

## 3. 未核实信息

| 信息 | 影响 | 处理方式 |
|---|---|---|
| 竞品日活/下载量 | 无法量化市场规模 | 不写入目标指标，用 TestFlight 验证 |
| 竞品 AI 供应商 | 无法对标成本 | MVP 选用可替换 API，监控 token 成本 |
| 竞品内容更新频率 | 不影响 MVP 范围 | 本地 JSON 首发 80 条 |
| 中国区 AI 服务合规细则 | 可能影响上架 | 选用国内合规 API，法务 review |

## 4. 检索停止条件

以下来源已足以支持 MVP 决策，停止扩展调研：

- 竞品主功能模块基线（App Store 页面）
- iOS 16.6+ 平台边界
- 隐私「不收集数据」可行性（本地存储方案）
- 目标仓库与 monorepo 布局（用户确认 + GitHub）

未决事项记入 `assumptions.md` 待验证队列，不阻塞 PRD 生成。
