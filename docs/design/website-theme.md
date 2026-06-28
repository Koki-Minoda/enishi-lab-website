# Website Theme

Last updated: 2026-06-28
Phase: Brand Design System (pre-implementation)
Scope: enishi-lab-website のみ（ENISHI Brand Design System Layer 2）

Source: `docs/design/brand-tokens.md` (Layer 1)

---

## Layer 2: Website Theme Token

Brand Tokenを継承し、Websiteの文脈に最適化したセマンティックエイリアス。
Tailwind v4 の `@theme` ブロックで実装する（`src/styles/global.css`）。

```css
/* Layer 1 (Brand Primitives) を参照 */
/* 実装時は :root に定義し、@theme から参照 */

@theme {
  /* === COLOR: Brand === */
  --color-brand:         #B8922B;  /* enishi-gold-500 */
  --color-brand-hover:   #9A7622;  /* enishi-gold-600 */
  --color-brand-light:   #FEF3CC;  /* enishi-gold-100 */
  --color-brand-dark:    #7A5C14;  /* enishi-gold-700 */

  /* === COLOR: Surface === */
  --color-bg-page:       #FAFAF7;  /* neutral-50 — ウォームホワイト（メイン背景） */
  --color-bg-card:       #FFFFFF;  /* neutral-0  — カード背景 */
  --color-bg-muted:      #F4F4EE;  /* neutral-100 — ミュートエリア */
  --color-bg-inverse:    #1C1C14;  /* neutral-800 — ダークセクション背景 */

  /* === COLOR: Text === */
  --color-text-primary:  #1C1C14;  /* neutral-800 */
  --color-text-secondary:#4E4E44;  /* neutral-600 */
  --color-text-muted:    #9A9A8C;  /* neutral-400 */
  --color-text-on-brand: #FFFFFF;  /* gold背景上のテキスト */
  --color-text-on-dark:  #FAFAF7;  /* dark背景上のテキスト（neutral-50） */
  --color-text-brand:    #B8922B;  /* goldテキスト（アクセント） */

  /* === COLOR: Border === */
  --color-border:        #E4E4DC;  /* neutral-200 */
  --color-border-muted:  #F4F4EE;  /* neutral-100 */
  --color-border-brand:  #B8922B;  /* brand border */

  /* === COLOR: Status === */
  --color-status-active:      #16A34A;
  --color-status-beta:        #D97706;
  --color-status-development: #2563EB;
  --color-status-archived:    #9A9A8C;

  /* === TYPOGRAPHY: Font Family === */
  --font-sans:    'Noto Sans JP', 'Inter', ui-sans-serif, system-ui, sans-serif;
  --font-serif:   'Shippori Mincho', 'Noto Serif JP', ui-serif, serif;
  --font-mono:    'JetBrains Mono', 'Source Code Pro', ui-monospace, monospace;

  /* === TYPOGRAPHY: Scale === */
  --text-xs:   0.75rem;
  --text-sm:   0.875rem;
  --text-base: 1rem;
  --text-lg:   1.125rem;
  --text-xl:   1.25rem;
  --text-2xl:  1.5rem;
  --text-3xl:  1.875rem;
  --text-4xl:  2.25rem;
  --text-5xl:  3rem;
  --text-6xl:  3.75rem;
  --text-7xl:  4.5rem;

  /* === TYPOGRAPHY: Line Height === */
  --leading-tight:   1.3;
  --leading-normal:  1.6;
  --leading-relaxed: 1.8;
  --leading-loose:   2.0;

  /* === SPACING === */
  --spacing-section-y:    6rem;    /* 96px — セクション縦 (mobile) */
  --spacing-section-y-lg: 8rem;    /* 128px — セクション縦 (desktop) */
  --spacing-container-x:  1.5rem;  /* 24px — コンテナ横 (mobile) */

  /* === BORDER RADIUS === */
  --radius-sm:   0.25rem;
  --radius-md:   0.5rem;
  --radius-lg:   0.75rem;
  --radius-xl:   1rem;
  --radius-full: 9999px;

  /* === MOTION === */
  --duration-fast:   150ms;
  --duration-base:   300ms;
  --duration-slow:   600ms;
  --duration-slower: 800ms;
  --ease-out:        cubic-bezier(0.22, 1, 0.36, 1);
  --ease-in-out:     cubic-bezier(0.45, 0, 0.55, 1);
}
```

---

## Layer 3: Component Token（Website固有）

```css
/* Navigation */
--nav-bg:              var(--color-bg-page);
--nav-border:          var(--color-border);
--nav-text:            var(--color-text-primary);
--nav-text-active:     var(--color-text-brand);
--nav-height:          4rem;

/* Button — Primary */
--btn-primary-bg:      var(--color-brand);
--btn-primary-text:    var(--color-text-on-brand);
--btn-primary-hover:   var(--color-brand-hover);
--btn-primary-radius:  var(--radius-md);

/* Button — Secondary */
--btn-secondary-bg:    transparent;
--btn-secondary-text:  var(--color-text-primary);
--btn-secondary-border:var(--color-border);
--btn-secondary-hover-bg: var(--color-bg-muted);

/* Card */
--card-bg:             var(--color-bg-card);
--card-border:         var(--color-border);
--card-radius:         var(--radius-lg);
--card-shadow:         0 1px 3px rgba(28, 28, 20, 0.06);
--card-shadow-hover:   0 16px 24px rgba(28, 28, 20, 0.10);
--card-padding:        1.5rem;

/* Hero */
--hero-bg:             var(--color-bg-page);
--hero-h1-font:        var(--font-serif);          /* Shippori Mincho */
--hero-h1-weight:      300;
--hero-h2-font:        var(--font-sans);
--hero-h2-weight:      400;
--hero-body-font:      var(--font-sans);
--hero-accent:         var(--color-text-brand);

/* Section */
--section-padding-y:   var(--spacing-section-y);
--section-gap:         3rem;

/* Status Badge */
--badge-active-bg:     rgba(22, 163, 74, 0.1);
--badge-active-text:   #16A34A;
--badge-beta-bg:       rgba(217, 119, 6, 0.1);
--badge-beta-text:     #D97706;
--badge-dev-bg:        rgba(37, 99, 235, 0.1);
--badge-dev-text:      #2563EB;
--badge-archived-bg:   rgba(154, 154, 140, 0.1);
--badge-archived-text: #9A9A8C;

/* Form */
--form-label-font:     var(--font-sans);
--form-input-border:   var(--color-border);
--form-input-focus:    var(--color-brand);
--form-error-color:    #DC2626;

/* Footer */
--footer-bg:           var(--color-bg-inverse);
--footer-text:         var(--color-text-on-dark);
--footer-border:       rgba(250, 250, 247, 0.1);
```

---

## Google Fonts 読み込み方針

```html
<!-- 実装時に <head> に追加 -->
<!-- Priority: Noto Sans JP 優先（日本語本文）, Shippori Mincho は Hero H1 用のみ -->

<!-- Noto Sans JP — subset: 必要なウェイトのみ -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;600&family=Shippori+Mincho:wght@300;400&display=swap" rel="stylesheet">

<!-- Inter (英字) — Noto Sans JPに含まれるLatinで代替可能。必要に応じて追加 -->
```

**パフォーマンス注記:**
- Noto Sans JP は weight=400,500,600 のみロード（700は使わない）
- Shippori Mincho は weight=300 のみ（Hero H1 専用）
- `display=swap` で CLS を防止
- 将来: selfhost を検討（`/public/fonts/`）

---

## Website Theme 設計方針（MGXとの対比）

### なぜWebsiteとMGXの体験は異なるのか

Brand Tokenは同一（Gold #B8922B）でも、Theme設計が異なるため体験が変わる。

| 次元 | Website | MGX |
|------|---------|-----|
| **目的** | ENISHIを知ってもらう（narrative） | MGXを使ってもらう（function） |
| **訪問者心理** | 初見・探索中 | ユーザー・タスク志向 |
| **Background** | #FAFAF7（温かいオフホワイト） | 未定（おそらく白または暗色） |
| **Gold使用量** | 少量・アクセントのみ | より顕著（MGXのアイデンティティ） |
| **Hero font** | H1のみ Shippori Mincho（詩的） | ゴシック統一（機能的） |
| **Section spacing** | 96〜128px（呼吸する余白） | コンパクト（App-like） |
| **Animation** | Sequential reveal, organic, 600〜800ms | Purpose-driven, fast, 150〜300ms |
| **Copy register** | 哲学的・感情的（「縁を、深く。」） | 機能的・明快（「〇〇する」） |
| **Gold on dark** | 少用（Footerのみ） | 積極利用（dark bg × gold accent） |

### 「同じBrandなのに異なる体験」の仕組み

```
Brand Token (同一)
  --enishi-gold-500: #B8922B

    ↓ Website Theme
    --color-brand: #B8922B
    --color-bg-page: #FAFAF7 (warm white)
    Gold = "品格あるアクセント"
    → 体験: 静的・物語的・暖かい

    ↓ MGX Theme (別リポジトリで定義)
    --color-brand: #D4A520  (gold-400: より明るくdark bg向け)
    --color-bg-page: #0F0F0A (near black)
    Gold = "UIの核心・識別色"
    → 体験: ダイナミック・機能的・鮮明
```

**結論:** Brand Tokenが「ENISHIの遺伝子」を共有し、Theme TokenがそのDNAをプロダクト文脈で発現させる。同じ親から生まれた、異なる個性を持つ兄弟。

---

## MGX Theme（参照用 — tentative）

MGXは独自リポジトリで正式定義するが、Website との差異化を示すため仮定義を記録する。

```css
/* MGX Theme (仮。MGXリポジトリで正式化) */

@theme {
  /* MGXのBrand Goldは明るめ（暗背景上で輝く） */
  --color-brand:         #D4A520;  /* enishi-gold-400 */
  --color-brand-hover:   #B8922B;  /* enishi-gold-500 */

  /* 暗い背景でドラマティックな体験 */
  --color-bg-page:       #0F0F0A;  /* near black */
  --color-bg-card:       #1C1C14;  /* neutral-800 */
  --color-bg-muted:      #343428;  /* neutral-700 */

  /* 明るいテキスト */
  --color-text-primary:  #FAFAF7;  /* neutral-50 */
  --color-text-secondary:#9A9A8C;  /* neutral-400 */

  /* フォント: ゴシック統一（明朝なし） */
  --font-sans:    'Noto Sans JP', 'Inter', ui-sans-serif, system-ui, sans-serif;
  /* --font-serif は不使用 */
}
```

---

## Family Quest Theme（参照用 — tentative）

```css
/* Family Quest Theme (仮。Family Questリポジトリで正式化) */

@theme {
  /* Goldは明るめ・遊び心 */
  --color-brand:         #D4A520;  /* enishi-gold-400 */

  /* 明るく開放的 */
  --color-bg-page:       #FFFFFF;  /* pure white */
  --color-bg-card:       #FAFAF7;

  /* テキストはWebsiteと同様 */
  --color-text-primary:  #1C1C14;

  /* アニメーション: もう少し軽快 */
  --duration-base:       250ms;
  --ease-out:            cubic-bezier(0.34, 1.56, 0.64, 1);  /* spring */
}
```

---

## ご縁ノート Theme（参照用 — tentative）

```css
/* ご縁ノート Theme (仮。ご縁ノートリポジトリで正式化) */

@theme {
  /* Websiteとほぼ同じ。より intimate */
  --color-brand:         #B8922B;  /* enishi-gold-500 */
  --color-bg-page:       #FAFAF7;  /* warm white */

  /* やや暖色よりの背景 */
  --color-bg-card:       #FFFCF0;  /* gold-50 — 紙の質感 */

  /* 明朝使用: H1と記録・引用部分に */
  --font-serif: 'Shippori Mincho', 'Noto Serif JP', ui-serif, serif;
}
```
