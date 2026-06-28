# Design System

Status: **Implementation Ready** (Brand Design System 設計完了)
Last updated: 2026-06-28

---

## Overview

ENISHI Design Systemは3層トークン構造で成り立つ（ADR-0003）。
Websiteは全層を実装する。他プロダクトはLayer 1を継承しLayer 2/3を独自定義する。

```
Layer 1: Brand Token (ENISHI全体)  → docs/design/brand-tokens.md
Layer 2: Theme Token (Website固有) → docs/design/website-theme.md
Layer 3: Component Token           → docs/design/website-theme.md (Component Token セクション)

実装: src/styles/global.css の @theme ブロック
```

---

## 設計済みドキュメント

| ドキュメント | 内容 | 状態 |
|------------|------|------|
| `docs/design/brand-tokens.md` | Layer 1: Gold/Neutral/Status色、Typography、Spacing、Motion、Shadow | ✅ 完了 |
| `docs/design/website-theme.md` | Layer 2: Website Theme Token / Layer 3: Component Token / フォント読み込み / MGX比較 | ✅ 完了 |
| `docs/design/system-inputs.md` | IA・Brand・Voice Guide からのDesignへの入力情報 | ✅ 完了 |

---

## Brand Decisions（確定）

| 決定事項 | 内容 |
|---------|------|
| Brand Anchor | MGX Gold → ENISHI全体のブランドカラー |
| Primary Color | Gold #B8922B（enishi-gold-500）暖色アンバーゴールド |
| Secondary Color | Charcoal #1C1C14（enishi-neutral-800）|
| Surface | Warm White #FAFAF7（enishi-neutral-50）|
| Font (本文) | Noto Sans JP（ゴシック統一）|
| Font (Hero H1) | Shippori Mincho weight:300（「縁を、深く。」のみ）|
| Logo | Wordmark前提。後から差し替え可能な構成 |

---

## 実装フェーズ: 次のステップ

```
Phase: Design System Implementation

Step 1: src/styles/global.css 更新
  - @import "tailwindcss" に続けて @theme ブロックを実装
  - brand-tokens.md + website-theme.md の値をそのまま転記

Step 2: Google Fonts 追加
  - src/layouts/BaseLayout.astro (未作成) または index.astro の <head>
  - Noto Sans JP (400,500,600) + Shippori Mincho (300)

Step 3: BaseLayout.astro 作成
  - <html lang="ja"> / <head> / font / meta / <slot />

Step 4: コンポーネント実装（IA/page-blueprint.md 参照）
  優先: NavHeader, Hero, ProjectCard, CTAButton, Footer
  次: SectionWrapper, AboutSnippet, ContactForm

Step 5: Top Page 実装
  - src/pages/index.astro に Narrative Flow 適用
  - HOOK → PROOF → STANCE → PERSONA → VISION → CTA
```

---

## ADR 一覧

| ADR | 決定 |
|-----|------|
| 0001 | Tech Stack (Astro/Tailwind v4/Biome/pnpm) |
| 0002 | works → projects リネーム |
| 0003 | 3-Layer Design Token Architecture |
