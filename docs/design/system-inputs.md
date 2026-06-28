# Design System Inputs

Last updated: 2026-06-28
Source: Information Architecture Design Phase + Brand & Messaging Design Phase

---

## Brand & Messaging → Design System（Task 6）

Brand設計から確定した、Design Systemへの入力。

### Brand Personality → Visual Direction

| Brand属性 | Visual Translation |
|----------|-------------------|
| 誠実（Sincere） | 過剰装飾を避ける。シンプルで明快なレイアウト |
| 温かみ（Warmth） | 冷たい白・機械的なグレーより暖色ベース |
| 知的（Intellectual） | 余白を恐れない。タイポグラフィに投資する |
| 簡潔（Brief） | 1要素1メッセージ。コンポーネントに詰め込まない |
| 日本語的（Japanese Sensibility） | 余白（ma/間）の美学。引き算の設計 |

### Core Message → Hero Design

```
H1: 「縁を、深く。」
  → 大きく・力強く・ひとこと
  → タイポグラフィで哲学を体現する

Subhead: 「AI時代に、人間らしさのために。」
  → H1の1/3〜1/4のサイズ
  → 読みやすさ優先

Visual:
  → 人間のつながりを示唆する（写真 or イラスト or アニメーション）
  → 冷たいAIビジュアル（回路・データ）は避ける
  → 温かみ・有機的・人間
```

### Brand Color Direction

ENISHIの「縁」「温かみ」「AI時代における人間らしさ」から:

```
推奨カラー方向:
  Base: 暖かいオフホワイト（#FAFAF7 または類似）— 純白は冷たい
  Brand Primary: 深い暖色（選択肢↓）

  Option A: 弁柄赤系（Bengala / Vermillion）
    → 日本の伝統色。縁・運命・情熱
    → 例: #A0522D (sienna), #8B2500 (deep vermillion)
    → 技術系サイトとの差別化が強い

  Option B: 深い紺系（Indigo / Navy）
    → 静謐・信頼・深さ
    → 例: #1E2B4A, #2D3A5C
    → 知性と温かみを両立できる

  Option C: テラコッタ系
    → 土・自然・有機的
    → 例: #C17B5C, #9B5E45
    → "縁" の有機的なイメージに合う

  避けるべき:
    → 明るい青（コールドテック感）
    → ネオン系（AI startup感）
    → 純粋なグレースケールのみ（無機質）
```

### Brand Animation Direction

「縁の糸」メタファー:
- 動きは**有機的**（機械的なスプリングではなく、息づくような）
- **余韻**を持つ（easeOut、終わりがゆっくり）
- **接続を示唆**（要素がつながっていくような動き）
- **速すぎない**（思慮ある印象を保つ）

```
推奨 easing: cubic-bezier(0.22, 1, 0.36, 1)  — gentle ease out
推奨 duration: 
  300-400ms: hover, 小さい状態変化
  600-800ms: 入場アニメーション
  1000ms+: ページ全体のリビール

避ける:
  → 跳ねるアニメーション（spring with overshoot）
  → 速すぎる（100ms以下の主要アニメーション）
  → ループアニメーション（落ち着きのない印象）
```

### Copy → Typography

```
見出しに求めるもの:
  → 「縁を、深く。」の2語が力強く見える
  → 縦方向の比率（仮名・漢字が美しく見える）
  → 英語との混植でも崩れない

推奨フォント方向（ユーザー最終決定が必要）:
  
  Option A: 明朝体見出し + ゴシック体本文
    見出し: Shippori Mincho / Zen Old Mincho
    本文:   Noto Sans JP / BIZ UDP Gothic
    → 伝統と現代の対比。ENISHIの「縁 × テクノロジー」に合う

  Option B: ゴシック統一
    見出し: Zen Kaku Gothic New (Bold)
    本文:   Noto Sans JP (Regular)
    → モダン・シンプル・可読性高

  英字ペア（どちらのOptionでも）:
    見出し: DM Serif Display または Playfair Display
    本文:   Inter または DM Sans
```

### Message Hierarchy → Component Design

```
H1 (Hero): Core Message「縁を、深く。」
  → 圧倒的なサイズ。ページの「魂」
  → コンポーネント: HeroHeading (独立したスタイル)

H2 (Section Title): ページ・セクションのメッセージ
  → 落ち着いた大きさ。H1の1/2〜2/3
  → コンポーネント: SectionHeading

H3 (Card Title): プロダクト名・コンテンツタイトル
  → 実用的。読みやすさ優先

Body: 説明・哲学の言語化
  → 行間広め（日本語: 1.8 / 英語: 1.6）
  → 長文読みやすさ最優先（/about, /projects/[slug]）

Caption/Tag: StatusBadge, tech tag
  → 小さく、意味を持つ
```

### Narrative Flow → Component Sequence

Top page の Narrative Flow（HOOK → PROOF → STANCE → PERSONA → VISION → CTA）が
コンポーネントの積み方を決定する:

```
1. Hero           (HOOK: Core Message)
2. ProjectGrid    (PROOF: Featured Projects)
3. PhilosophyBlock (STANCE: Mission/Vision text)
4. AboutSnippet   (PERSONA: Founder face)
5. VisionBlock    (VISION: Invitation)
6. CTABlock       (CONVERSION)
```

このシーケンスは実装フェーズで `/pages/index.astro` に反映する。

---

IAが確定したことで、Design Systemが受け取るべき入力情報を定義する。
このドキュメントはDesign Systemフェーズの入力仕様書として機能する。

---

## Component Inventory（IA由来）

IAから同定されたコンポーネント一覧。Design Systemが定義すべきもの。

| Component | 使用ページ | Priority |
|-----------|---------|---------|
| `ProjectCard` | /projects, / (Featured) | 必須 |
| `Header` | 全ページ | 必須 |
| `Footer` | 全ページ | 必須 |
| `MobileNav` | 全ページ（モバイル） | 必須 |
| `Hero` | 全ページ | 必須 |
| `Section` | 全ページ | 必須 |
| `CTABlock` | 全ページ末尾 | 必須 |
| `StatusBadge` | ProjectCard, /projects/[slug] | 必須 |
| `Breadcrumb` | /projects/[slug], /blog/[slug] | 必須 |
| `ContactForm` | /contact | 必須 |
| `TeamCard` | /about | 推奨 |
| `FeatureItem` | /projects/[slug] | 推奨 |
| `Tag` | Projects (tech stack) | 推奨 |
| `RelatedProjects` | /projects/[slug] | 推奨 |

---

## Color Requirements

### セマンティックカラー（必須定義）

```css
/* 実装先: src/styles/global.css の @theme ブロック */

/* Brand */
--color-brand-primary:    /* ENISHIのメインブランドカラー */
--color-brand-secondary:  /* アクセント / 補色 */

/* Surface */
--color-surface-page:     /* ページ背景 */
--color-surface-card:     /* カード背景 */
--color-surface-overlay:  /* モーダル/オーバーレイ背景 */
--color-surface-muted:    /* 薄いセクション背景 */

/* Text */
--color-text-primary:     /* 本文・見出し */
--color-text-secondary:   /* サブテキスト */
--color-text-muted:       /* caption, placeholder */
--color-text-on-brand:    /* brand背景上のテキスト（通常 white） */

/* Interactive */
--color-interactive:      /* リンク・ボタン */
--color-interactive-hover:
--color-border:           /* ボーダー・区切り線 */

/* Status（ProjectCardのバッジ）*/
--color-status-active:      /* 公開中 → 緑系 */
--color-status-beta:        /* β版 → 琥珀系 */
--color-status-development: /* 開発中 → 青系 */
--color-status-archived:    /* 終了 → グレー */
```

### ダークモード

- MVP: ライトモードのみ
- Growth: prefers-color-scheme 対応

### ブランドカラー決定のためのInput（ユーザー提供が必要）

```
□ ENISHIを表現するキーワード（色の感情）
□ 競合・参照サイト（避けたいもの・目指すもの）
□ 既存のブランドアセット（ロゴ・名刺等）があれば共有
□ 明/暗のどちらをベースにするか
```

---

## Typography Requirements

### フォントロール（必須定義）

```css
@theme {
  --font-sans:  /* 本文・UIテキスト。日英両対応 */
  --font-serif: /* 見出し（オプション。ブランドに応じて） */
  --font-mono:  /* コード（/blog 等で使用予定） */
}
```

### タイポグラフィスケール（IAで必要と判明）

| Role | 使用場所 | 推奨サイズ帯 |
|------|---------|------------|
| Hero H1 | Top Hero, 各ページHero | 48px〜80px |
| Section H2 | セクションタイトル | 32px〜40px |
| Card H3 | ProjectCard タイトル | 20px〜24px |
| Body | 本文段落 | 16px〜18px |
| Caption | バッジ, tag, フッター | 12px〜14px |
| Label | フォームラベル | 14px |

### 日本語フォント要件

- 本文可読性重視（長文あり: /about, /projects/[slug]）
- 見出しは個性（ENISHIの世界観を表現）
- Latin文字との共存（URLなど英語混じり）

### フォント候補（未確定 — ユーザー決定が必要）

```
日本語候補:
  - Noto Sans JP (無難・可読性高)
  - BIZ UDPGothic (モダン・公式感)
  - 游ゴシック体 (macOS標準・高品質)
  - M PLUS Rounded 1c (フレンドリー)

英字候補:
  - Inter (モダン・可読性)
  - DM Sans (スタートアップ感)
  - Geist (Vercel謹製・技術的)
```

---

## Spacing Requirements

### スケール

Tailwind v4 デフォルト (4px基準) を基本とする。

| Token | 値 | 使用場所 |
|-------|---|---------|
| `section-y` | 80px〜120px | セクション縦パディング |
| `container-x` | 24px / 40px / 80px | コンテナ横パディング（モバイル/タブレット/デスクトップ） |
| `card-gap` | 24px〜32px | Projectカード間隔 |
| `card-p` | 24px | カード内パディング |
| `nav-h` | 64px | ヘッダー高さ |
| `hero-h` | 100vh or 80vh | Hero セクション高さ |

---

## Layout Requirements

### Container

```
max-width: 1200px  (推奨)
margin: 0 auto
padding-x: 24px (mobile) / 40px (tablet) / 80px (desktop)
```

### Grid System

| 用途 | Mobile | Tablet | Desktop |
|------|--------|--------|---------|
| ProjectCard Grid | 1列 | 2列 | 3列 |
| Hero 2-col | 1列（stacked） | 1列 | 2列 |
| Footer columns | 1列 | 2列 | 4列 |

### Breakpoints（Tailwind v4 デフォルト活用）

```
sm: 640px   (大きめスマートフォン)
md: 768px   (タブレット)
lg: 1024px  (ラップトップ)
xl: 1280px  (デスクトップ)
```

---

## Animation Requirements

| Animation | 対象 | 挙動 | Priority |
|-----------|------|------|---------|
| Hero Entrance | Hero H1, Sub, CTA | フェードイン + 上から下へ微移動 | 必須 |
| Scroll Reveal | 各セクション | 스クロール時フェードイン（subtle） | 推奨 |
| Card Hover | ProjectCard | 上に微浮き + 影強調 | 必須 |
| Nav Overlay | MobileNav | フェードイン or スライドイン | 必須 |
| Page Transition | ページ遷移 | フェード（Astro View Transitions API） | 推奨 |
| CTA Hover | Button | 色変化 + 微スケール | 必須 |

**方針:** Subtle が原則。ENISHIの「縁」「つながり」テーマに合わせ、動きは丁寧・余韻あり。
**実装:** Motion（formerly Framer Motion web版）または CSS Transition のみ

---

## Icon Requirements

| Icon | 用途 | 優先度 |
|------|------|-------|
| `hamburger` (☰) | MobileNav open | 必須 |
| `close` (✕) | MobileNav close | 必須 |
| `arrow-right` (→) | CTA リンク | 必須 |
| `external-link` (↗) | 外部リンク | 必須 |
| `chevron-right` (›) | Breadcrumb区切り | 必須 |
| `circle-dot` (●) | StatusBadge | 必須 |
| Apple logo | App Store CTA | 推奨 |
| Google Play logo | Play Store CTA | 推奨 |
| X (Twitter) | Social link | 推奨 |
| GitHub | Social link | 推奨 |

**ライブラリ:** Lucide（Bootstrapで選定済み）
**ロゴアイコン（Apple/Google/X）:** SVGを`public/icons/`に個別配置

---

---

## Brand Voice Guide → Design System（Brand Voice Phaseより）

Source: `docs/brand/voice-guide.md`

### Typography への影響

**Tone: 静けさ・知的**

```
font-weight:
  見出し: 600 (semibold) が最大。700 (bold) は最小限に
  → 静けさのToneに反するため、太すぎる見出しは避ける

line-height:
  本文（日本語）: 1.8 以上
  本文（英語）:   1.6
  → 「余白を恐れない」原則を文字組に反映

line-length:
  本文: max 65〜70字/行 (= ~30rem at 18px)
  → 長すぎる行は読みにくく、「短く深く」原則に反する

letter-spacing:
  見出し: わずかに広め (0.02em〜0.05em)
  → 静けさと格調を演出

H1（Hero）:
  font-weight: 400〜500（細すぎず、太すぎず）
  → 「縁を、深く。」は力強さより繊細さで表現する
```

**Copy Length → Component Design**

| コピーの原則 | コンポーネントへの影響 |
|------------|------------------|
| 「短く深く」 | Hero: H1 + H2 + Body の3層構造で十分。それ以上は入れない |
| 「1セクション = 1メッセージ」 | Section コンポーネント: title + description + content slot のみ |
| 「余白を恐れない」 | 全コンポーネント: padding を削らない |
| 「日本語主」 | フォントローディング: 日本語フォントを優先読み込み |

### Spacing への影響

**Tone: 静けさ・余白**

```
section-y: 100px〜140px (当初案より広め)
  → 「余白を恐れない」は section padding に直接影響

paragraph-gap: 1.5em 以上
  → 段落間の余白を広く（詰め込まない）

hero-whitespace: 意図的な空白エリアを設ける
  → Hero は詰め込まず、H1が「呼吸」できる空間を作る
```

### Component への影響（Voice Guide由来）

**StatusBadge（誠実さの体現）:**
```
文言:
  active      → 「公開中」（シンプルな事実）
  beta        → 「ベータ版」
  development → 「開発中」
  archived    → 「終了」

スタイル:
  小さく・控えめに。誠実に「今の状態」を伝えるだけ
  強調しすぎない（誠実さは目立たなくていい）
```

**CTAButton:**
```
文言パターン:
  Primary: 「プロジェクトを見る」「試してみる」「送信する」
  Secondary: 「詳しく知る」「お問い合わせ」

避ける文言:
  「今すぐ」「無料で」「限定」（煽り感）
  「Submit」「Click Here」（英語 / 非人間的）

スタイル:
  アイコン: → (arrow-right) を文言の後に添える
  サイズ: 控えめ。叫ばない
```

**Form:**
```
ラベル: 「お名前」「メールアドレス」「メッセージ」（日本語・人間的）
エラー: 「入力内容を確認してください」（責めない・温かく）
Submit: 「送信する」（not Submit）
```

**404ページ:**
```
H1: 「その縁は、まだつながっていないようです。」
Body: 「お探しのページが見つかりませんでした。」
CTA: 「トップページへ戻る」
→ ブランドの声を404でも保つ（エラーページこそVoiceが出る）
```

### Animation への影響

**Tone: 静けさ・余韻**

```
追加指針（Voice Guide由来）:

Sequential Reveal（段階的表示）:
  Heroの3層（H1 → H2 → Body → CTA）は一度に表示しない
  各要素を150ms〜200ms遅らせて順番に表示
  → 「静けさ」と「余韻」を体現

Delay for reading rhythm:
  コンテンツが多すぎる→速く流す は悪手
  読む時間を与えるdelayを意図的に設ける

hover effect:
  強すぎるhoverは叫んでいる印象
  subtle scale (1.02) + shadow が限界
```

---

## Summary: Design Systemフェーズへの引き渡しチェックリスト（更新版）

```
IA + Brand & Messaging から Design System へ引き渡す情報:

[✅] Component Inventory 確定 (14コンポーネント同定)
[✅] Color — セマンティック構造確定 (方向: 暖色ベース)
[✅] Typography — スケール・ロール・Weight指針確定
[✅] Spacing — スケール確定 (section-y: 100-140px)
[✅] Layout — Container / Grid / Breakpoints 確定
[✅] Animation — 方針・Easing・Sequential Reveal確定
[✅] Icons — 一覧確定 (Lucide使用)
[✅] Hero Copy Structure — H1 + H2 + Body の3層確定
[✅] Component Copy — StatusBadge / CTA / Form / 404の文言確定
[✅] Project Categories — 「〇〇の縁」フレームワーク確定
[✅] Voice Tone — 5属性確定 (誠実/温かみ/静けさ/知的/人間中心)

[⬜] ブランドカラー値 → ユーザー決定が必要（弁柄赤/深紺/テラコッタの3案から）
[⬜] フォント選定 → ユーザー決定が必要（明朝+ゴシック/ゴシック統一の2案から）
[⬜] ロゴ/wordmark → ユーザー提供が必要
```
