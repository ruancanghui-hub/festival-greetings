# ADR-002：竞品基线从「祝福短信助手」切换为「大福贺卡」

- 状态：已接受
- 日期：2026-09-03

## 背景

用户将主竞品从文字祝福工具切换为动态贺卡制作工具，导致已 PASS 的 2026-08-31 PRD 与新产品形态冲突。

## 决策

- 主竞品改为 [大福贺卡](https://apps.apple.com/cn/app/%E5%A4%A7%E7%A6%8F%E8%B4%BA%E5%8D%A1-%E6%96%B0%E5%B9%B4%E6%81%8B%E7%88%B1%E7%94%9F%E6%97%A5%E5%9C%A3%E8%AF%9E%E7%AD%89%E7%94%B5%E5%AD%90%E8%B4%BA%E5%8D%A1%E5%88%B6%E4%BD%9C/id1345185172)
- 旧文档归档至 `docs/product/_archive/2026-08-31-节日祝福/`
- 新建 `docs/product/2026-09-03-节日祝福/` 并重置 PRD 门禁后重验
- 产品 slug / 仓库保持 `festival_greetings` / `festival-greetings`

## 后果

Phase 2 品牌 IP 尚未开始，转向成本可控；若已生成旧定位视觉资产，不得沿用。
