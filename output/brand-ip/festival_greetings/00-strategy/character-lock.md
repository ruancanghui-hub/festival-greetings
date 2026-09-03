# 云笺 / Cloud Note — 角色锁

## 身份定义

云笺是一只小云雀信使：用得体、安静的陪伴感帮助用户把祝福写成贺卡。

## 不可变特征

- **物种与轮廓**：小云雀；身体是圆润水滴形，并有清晰的纸张折角轮廓。
- **比例**：头约占整体高度的 45%，身体约占 55%；短喙，非长嘴鸟。
- **耳 / 翼 / 肢体**：没有耳朵；左右各一片短翼；两只短脚完整可见，不能多出或融合。
- **眼睛**：两只深墨蓝圆眼，位置对称；不画睫毛。
- **身份标记**：头顶正中仅一枚朱砂红圆形印记；不可改成星、心或多枚点。
- **信笺结构**：胸前固定一个米白折角信笺面；折角在观看者右上方。
- **道具**：仅一枚小朱砂红圆印章，通常由一只翼托住或位于信笺角；不得增加书、花束、手机或信封替代物。
- **主色角色**：米白 `#F6F0E4` 为身体/信笺；朱砂红 `#C84B3A` 为头顶印记与印章；松石绿 `#4E9B92` 为极少量折角内衬；深墨蓝 `#20354A` 为眼和正文。
- **材质**：哑光棉纸、细微压纹；绝不使用塑料高光、金属、毛绒或写实羽毛。
- **默认表情**：微笑、平和、眼睛睁开。

## 允许变化

姿势、背景纸纹、一个节日相关的非角色装饰，以及棉纸压纹强度可变化；所有不可变特征保持不变。

## 禁止漂移

不得变成人类、猫、兔、企鹅、普通小鸟；不得增加耳朵/翅膀/腿/红点；不得改动折角位置；不得用角色替代祝福文本；不得使用第三方角色、品牌、文字水印。

## Invariant matrix

| Field | Exact requirement | Allowed variable | Forbidden drift | Result |
|---|---|---|---|---|
| Countable anatomy | 2 eyes, 2 wings, 2 feet, 0 ears | pose | extra/missing/fused limbs | PASS — concept-03 |
| Identity marks | 1 centered red circle on crown | none | extra/repositioned/re-shaped mark | PASS — concept-03 |
| Silhouette | waterdrop cloud-lark + right-upper paper fold | pose within 10% proportion | ordinary bird or other species | PASS — concept-03 |
| Palette | ivory body, vermilion mark/seal, tiny teal fold, ink-blue eyes | lighting value only | role swap | PASS — concept-03 |
| Limbs and props | both feet visible; only one red round seal | pose | hidden/fused legs or extra prop | PASS — concept-03 |

## Anchor selection

Six concepts vary only material/render emphasis. Concept 03 passes every invariant and is the selected unique anchor (`01-character-concepts/character-anchor.png`, SHA-256 `8da1f360ebc5442675eb97d4a8c16f0816c679d6b882c93a0a6092e05119adb0`); every downstream image must reference it.
