# Core Tab UI QA

| Asset | PRD coverage | Active Tab | Result |
|---|---|---|---|
| `tab-home.png` | 节日倒计时、六关系入口、模板推荐、AI 创作入口 | 首页 | PASS |
| `tab-create.png` | 关系／场景／风格／补充文字／AI 生成／精选库入口 | 创作 | PASS |
| `tab-profile.png` | 我的文案、收藏、隐私政策、关于、意见反馈 | 我的 | PASS |

## Reference-guided generation

- Reference: `../references/ref-app-wide.png`; used only for app-shell composition, paper material, spacing rhythm, and three-item bottom navigation.
- Design-system profiles: `../design-system-profile-home.json`, `../design-system-profile-create.json`, `../design-system-profile-profile.json`.
- Brand substitution: Cloud Note’s ivory paper cloud-lark, vermilion action color, and PRD-only Chinese content.
- Generation route: built-in image2 with the reference image and selected Cloud Note character anchor.
- Canvas: all final PNGs are 3840 × 2160. Native image generation returned 1672 × 941; finals were resampled to the requested 4K canvas.
- Visual check: no device frames, competitor logos, advertisements, memberships, or non-MVP root tabs observed.
