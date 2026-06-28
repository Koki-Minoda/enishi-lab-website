# ENISHI Brand Design System

Last updated: 2026-06-28
Phase: Brand Design System (pre-implementation)
Scope: ENISHI-LAB 全体（Websiteではなくカンパニーレベル）

---

## Overview

このドキュメントはENISHI-LAB全プロダクトが継承するBrand Design Systemを定義する。
3層構造（ADR-0003）の **Layer 1: Brand Token** を担う。

```
ENISHI Brand Design System (このドキュメント)
  ├── Layer 1: Brand Tokens ← ここ (全プロダクト共通・不変)
  └── → 各プロダクトが Layer 2 (Theme Token) を定義して継承
```

---

## Brand Anchor: MGX

ENISHIブランドのビジュアルアンカーはMGXのブランドカラー **Gold** とする。

**理由:**
- MGXがENISHIのフラッグシッププロダクト
- Gold = 品質・信頼・価値 → ENISHIのプロダクト思想と一致
- Gold × Charcoal = タイムレスな組み合わせ。長期ブランド耐久性が高い
- 「縁」の日本的文脈において、金色は伝統工芸・格調に連なる

**注意:** MGXブランドカラーを共有するが、WebsiteはMGXと同じ視覚体験にはしない。
Brand Tokenを共有しつつ、Website Themeで独自に最適化する（Task 3参照）。

---

## Layer 1: Brand Token — Color Primitives

すべてのプロダクトが参照する絶対値。これ自体は変更しない。
値を変える場合はすべてのプロダクトへ影響することを認識した上で行う。

### Gold Scale（ブランドプライマリ）

```css
/* ENISHI Gold — MGXブランドカラーをアンカーとする暖色ゴールド */

--enishi-gold-50:  #FFFCF0;  /* ほぼ白。ゴールドのヒント */
--enishi-gold-100: #FEF3CC;  /* 薄い金色。背景ハイライト */
--enishi-gold-200: #FDE48A;  /* 明るい金 */
--enishi-gold-300: #F5C842;  /* 鮮明な金 */
--enishi-gold-400: #D4A520;  /* 中明度の金。暗背景で輝く */
--enishi-gold-500: #B8922B;  /* ★ MAIN GOLD — ブランドアンカー */
--enishi-gold-600: #9A7622;  /* ホバー・プレスト */
--enishi-gold-700: #7A5C14;  /* 深い金 */
--enishi-gold-800: #55400A;  /* 非常に深い金 */
--enishi-gold-900: #302505;  /* ほぼ黒の金 */
```

**gold-500 (#B8922B) の選択根拠:**
- 暖色寄りのアンバーゴールド（純黄金より温かい）
- 白背景 (WCAG AA: 約4.5:1 at 24px以上)
- 暗背景では gold-400 (#D4A520) へ切り替えて視認性確保
- 日本の伝統工芸・漆器の金に近い色調 → ENISHIの「縁」思想と調和

---

### Neutral Scale（ウォームグレー）

```css
/* ENISHI Neutral — Gold の暖色と調和するよう青みを抑えたウォームニュートラル */

--enishi-neutral-0:   #FFFFFF;  /* 純白 */
--enishi-neutral-50:  #FAFAF7;  /* ウォームホワイト。Websiteベース背景 */
--enishi-neutral-100: #F4F4EE;  /* 薄いウォームグレー */
--enishi-neutral-200: #E4E4DC;  /* ボーダーライン */
--enishi-neutral-300: #C8C8BC;  /* 薄いテキスト / 分割線 */
--enishi-neutral-400: #9A9A8C;  /* ミュートテキスト */
--enishi-neutral-500: #707065;  /* セカンダリテキスト補助 */
--enishi-neutral-600: #4E4E44;  /* セカンダリテキスト */
--enishi-neutral-700: #343428;  /* ダーク */
--enishi-neutral-800: #1C1C14;  /* ★ CHARCOAL — ブランドセカンダリ */
--enishi-neutral-900: #0C0C08;  /* ほぼ黒 */
```

**設計注記:** Neutral スケールは `R == G > B` の関係を保つ（例: #1C1C14 = R28, G28, B20）。
これにより純粋なグレーより僅かに暖かく、Gold の隣に置いても違和感がない。

---

### Status Colors

```css
/* Status — プロダクトバッジ・フィードバック用 */

--enishi-status-active:      #16A34A;  /* 公開中 — グリーン */
--enishi-status-beta:        #D97706;  /* ベータ — アンバー */
--enishi-status-development: #2563EB;  /* 開発中 — ブルー */
--enishi-status-archived:    #9A9A8C;  /* 終了 — ニュートラル */

/* UI Feedback */
--enishi-success: #16A34A;
--enishi-warning: #D97706;
--enishi-error:   #DC2626;
--enishi-info:    #2563EB;
```

---

## Layer 1: Brand Token — Typography

### Font Stack

**ゴシック統一（基本方針）:**

```css
/* PRIMARY: 本文・UI全般 */
--enishi-font-sans: 'Noto Sans JP', 'Inter', ui-sans-serif, system-ui, sans-serif;

/* DISPLAY: Hero H1 のみ（オプション提案 → 下記参照） */
--enishi-font-serif: 'Shippori Mincho', 'Noto Serif JP', ui-serif, serif;

/* MONO: コード・技術コンテンツ（/blog 等、将来） */
--enishi-font-mono: 'JetBrains Mono', 'Source Code Pro', ui-monospace, monospace;
```

**Hero H1への明朝提案（CT-1への回答含む）:**

「縁を、深く。」を Shippori Mincho で表示することを推奨する。

理由:
1. 「縁」「深」は明朝の筆跡表現において特に美しい字形
2. ゴシック本文との対比が視覚的ヒエラルキーを強化する
3. 「縁」の日本的・伝統的な意味合いを視覚的に体現する
4. Shippori Mincho はWeb Fontsとして軽量・高品質

実装方針:
```css
/* Hero H1のみ serif適用 */
.font-display { font-family: var(--enishi-font-serif); }
/* それ以外は全て sans */
```

---

### Type Scale（プリミティブ）

```css
--enishi-text-xs:   0.75rem;   /* 12px — caption, badge */
--enishi-text-sm:   0.875rem;  /* 14px — label, small */
--enishi-text-base: 1rem;      /* 16px — body */
--enishi-text-lg:   1.125rem;  /* 18px — body large */
--enishi-text-xl:   1.25rem;   /* 20px — card title */
--enishi-text-2xl:  1.5rem;    /* 24px — section sub */
--enishi-text-3xl:  1.875rem;  /* 30px — section title */
--enishi-text-4xl:  2.25rem;   /* 36px — page title */
--enishi-text-5xl:  3rem;      /* 48px — hero (mobile) */
--enishi-text-6xl:  3.75rem;   /* 60px — hero (tablet) */
--enishi-text-7xl:  4.5rem;    /* 72px — hero (desktop) */
```

### Font Weights

```css
--enishi-weight-light:    300;  /* Shippori Mincho (Hero display) */
--enishi-weight-regular:  400;  /* 本文 */
--enishi-weight-medium:   500;  /* 強調 */
--enishi-weight-semibold: 600;  /* 見出し最大 */
/* 700 (bold) は使わない — ブランドの静けさと矛盾 */
```

### Line Heights

```css
--enishi-leading-tight:   1.3;   /* 見出し */
--enishi-leading-normal:  1.6;   /* 英字本文 */
--enishi-leading-relaxed: 1.8;   /* 日本語本文 */
--enishi-leading-loose:   2.0;   /* 詩的な表現・Hero周辺 */
```

---

## Layer 1: Brand Token — Spacing

```css
/* 4px基準。Tailwind v4デフォルトスケールを踏襲 */

--enishi-space-1:  0.25rem;   /*  4px */
--enishi-space-2:  0.5rem;    /*  8px */
--enishi-space-3:  0.75rem;   /* 12px */
--enishi-space-4:  1rem;      /* 16px */
--enishi-space-6:  1.5rem;    /* 24px */
--enishi-space-8:  2rem;      /* 32px */
--enishi-space-10: 2.5rem;    /* 40px */
--enishi-space-12: 3rem;      /* 48px */
--enishi-space-16: 4rem;      /* 64px */
--enishi-space-20: 5rem;      /* 80px */
--enishi-space-24: 6rem;      /* 96px */
--enishi-space-32: 8rem;      /* 128px */
```

### Semantic Spacing

```css
/* セクション・コンポーネントで使う意味的スペーシング */

--enishi-section-padding-y:     6rem;    /* 96px — セクション縦 (mobile) */
--enishi-section-padding-y-lg:  8rem;    /* 128px — セクション縦 (desktop) */
--enishi-container-padding-x:   1.5rem;  /* 24px — コンテナ横 (mobile) */
--enishi-container-padding-x-md: 2.5rem; /* 40px — コンテナ横 (tablet) */
--enishi-container-padding-x-lg: 5rem;   /* 80px — コンテナ横 (desktop) */
--enishi-container-max-width:   75rem;   /* 1200px — コンテナ最大幅 */
--enishi-nav-height:            4rem;    /* 64px — ヘッダー高さ */
--enishi-card-padding:          1.5rem;  /* 24px — カード内パディング */
--enishi-card-gap:              2rem;    /* 32px — カード間隔 */
```

---

## Layer 1: Brand Token — Motion

```css
/* ENISHIの「静けさ・余韻」を反映したモーション定義 */

/* Duration */
--enishi-duration-fast:   150ms;  /* hover, small state change */
--enishi-duration-base:   300ms;  /* button, toggle */
--enishi-duration-slow:   600ms;  /* entrance animation */
--enishi-duration-slower: 800ms;  /* hero reveal */

/* Easing — organic, not mechanical */
--enishi-ease-out:    cubic-bezier(0.22, 1, 0.36, 1);  /* primary — 余韻あり */
--enishi-ease-in-out: cubic-bezier(0.45, 0, 0.55, 1);  /* overlay */
--enishi-ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1); /* subtle bounce (controlled) */

/* Stagger — sequential reveal */
--enishi-stagger-base:  100ms;  /* コンポーネント間のディレイ */
--enishi-stagger-fast:   60ms;
--enishi-stagger-slow:  150ms;
```

---

## Layer 1: Brand Token — Border Radius

```css
--enishi-radius-sm:   0.25rem;  /*  4px — バッジ・タグ */
--enishi-radius-md:   0.5rem;   /*  8px — カード・ボタン */
--enishi-radius-lg:   0.75rem;  /* 12px — 大きいカード */
--enishi-radius-xl:   1rem;     /* 16px — モーダル */
--enishi-radius-full: 9999px;   /* 完全な円 — アバター */
```

---

## Layer 1: Brand Token — Shadow

```css
/* 有機的・温かみのある影。機械的でない */

--enishi-shadow-sm:  0 1px 3px rgba(28, 28, 20, 0.06),
                     0 1px 2px rgba(28, 28, 20, 0.04);

--enishi-shadow-md:  0 4px 6px rgba(28, 28, 20, 0.07),
                     0 2px 4px rgba(28, 28, 20, 0.05);

--enishi-shadow-lg:  0 10px 15px rgba(28, 28, 20, 0.08),
                     0 4px 6px rgba(28, 28, 20, 0.05);

--enishi-shadow-card-hover: 0 16px 24px rgba(28, 28, 20, 0.10),
                            0 6px 8px rgba(28, 28, 20, 0.06);

/* Gold glow — 特別な要素に使用 (控えめに) */
--enishi-shadow-gold: 0 0 20px rgba(184, 146, 43, 0.25);
```

---

## 全プロダクトへの継承マップ

```
ENISHI Brand Design System (Layer 1)
  │
  ├── Website Theme (Layer 2)       → docs/design/website-theme.md
  │     └── Website Components (Layer 3)
  │
  ├── MGX Theme (Layer 2)           → MGXリポジトリで定義
  │     └── MGX Components (Layer 3)
  │
  ├── Family Quest Theme (Layer 2)  → Family Questリポジトリで定義
  │     └── Family Quest Components (Layer 3)
  │
  └── ご縁ノート Theme (Layer 2)     → ご縁ノートリポジトリで定義
        └── ご縁ノート Components (Layer 3)
```
