# Information Architecture

Last updated: 2026-06-28
Phase: IA Design (pre-implementation)

---

## CT-1: Today vs Future

### 判断軸

| 観点 | 今必要 | 将来追加 |
|------|--------|---------|
| プロダクト紹介 | ✅ Family Quest / MGX / ご縁ノート | 新規プロダクト (slug追加のみ) |
| 会社案内 | ✅ About (ストーリー) | Company (法的情報) はGrowthで十分 |
| 採用 | ❌ まだ不要 | /careers (Growth) |
| ブログ | ❌ まだ不要 | /blog (Growth) |
| ニュース | ❌ まだ不要 | /news (Future) |
| 多言語 | ❌ まだ不要 | /en/* (Future) |
| パートナー/IR | ❌ まだ不要 | /partners, /investors (Future) |

### 拡張戦略

- **URL変更なしに拡張できる構造を今作る**
- `/projects/[slug]` はスラッグ追加のみで新プロダクト対応
- Navigationは今3項目 → Growth時に5項目まで拡張
- Footer の「プロダクト」列は Content Collections から自動生成

---

## CT-2: ページ存在理由

| ページ | Purpose | Primary User | CTA | Success Criteria |
|--------|---------|-------------|-----|-----------------|
| / (Top) | ENISHIとは何か・何を作っているかを5秒で伝える | 初訪問者（潜在顧客・投資家・候補者・プレス） | プロジェクトを見る / お問い合わせ | 「どんな会社か」が即座に理解される |
| /about | ENISHIが存在する理由・創業者のストーリーで信頼を築く | 潜在顧客・投資家・候補者 | お問い合わせ / 採用（将来） | ENISHIへの共感・信頼が生まれる |
| /projects | プロダクトポートフォリオで実力と方向性を示す | 潜在顧客・投資家・プレス | 個別プロダクトへ / お問い合わせ | プロダクトの質と幅が伝わる |
| /projects/[slug] | 1プロダクトの詳細を伝え、次のアクションに導く | そのプロダクトの潜在ユーザー・関心者 | ダウンロード / 詳細サイト / お問い合わせ | ユーザーが価値を理解し次のアクションを起こす |
| /company | 法的・正式な会社情報（Growth） | ビジネスパートナー・プレス・法務 | お問い合わせ | 必要情報が全て見つかる |
| /blog | ENISHIの思考・知見を発信し長期的関係を構築（Growth） | 開発者・デザイナー・同業者 | 購読 / シェア | 記事が読まれ、ブランド認知が高まる |
| /careers | 採用（Growth） | 候補者 | 応募 | 候補者が文化・ポジションを理解し応募する |
| /contact | 関心ある訪問者を具体的なつながりに変換する | 潜在顧客・候補者・プレス・全般 | 送信 | フォームが送信される |

---

## Site Map

### MVP（今すぐ実装）

```
/ .................. Top
├── /about ......... About ENISHI-LAB
├── /projects ...... Projects 一覧
│   ├── /projects/family-quest
│   ├── /projects/mgx
│   └── /projects/goen-note
└── /contact ....... Contact

その他（MVP必須）:
├── /privacy ....... プライバシーポリシー
└── /404 ........... Not Found
```

### Growth（6ヶ月〜2年）

```
├── /company ....... 会社概要（法的情報）
├── /blog .......... ブログ/インサイト
│   └── /blog/[slug]
└── /careers ....... 採用情報
    └── /careers/[slug]
```

### Future（2年以後）

```
├── /en ............ 英語版（または i18n切り替え）
├── /news .......... ニュース/プレスリリース
│   └── /news/[slug]
├── /partners ...... パートナー
└── /services ...... サービス（コンサルティング等）
```

---

## URL Structure

### 設計原則

1. **小文字ハイフン区切り** — `goen-note`（アンダースコア不可）
2. **英語スラッグ** — 日本語コンテンツでもURLはASCII（URLエンコード回避・SEO）
3. **末尾スラッシュなし** — `/projects` not `/projects/`
4. **日付なし** — URL変更なしに記事を移動できる
5. **最大2階層** — MVP期間は `/category/slug` まで
6. **セマンティック** — URLを見て内容が推測できる

### URL 一覧

```
/                               ← Top
/about                          ← About ENISHI-LAB
/projects                       ← Projects 一覧
/projects/family-quest          ← Family Quest
/projects/mgx                   ← MGX
/projects/goen-note             ← ご縁ノート
/contact                        ← Contact
/privacy                        ← プライバシーポリシー
/404                            ← Not Found

--- Growth ---
/company                        ← 会社概要
/blog                           ← ブログ一覧
/blog/[slug]                    ← ブログ記事
/careers                        ← 採用一覧
/careers/[slug]                 ← 採用ポジション詳細

--- Future ---
/en                             ← 英語Top（または /[lang]/...）
/news                           ← ニュース一覧
/news/[slug]                    ← ニュース記事
```

### 命名ルール

| 日本語名 | URL slug | 根拠 |
|---------|---------|------|
| ファミリークエスト | `family-quest` | プロダクト正式英語名 |
| MGX | `mgx` | ブランド名そのまま |
| ご縁ノート | `goen-note` | 読み ("goen") + "note" 英訳 |
| ブログ記事 | `[descriptive-english-slug]` | 内容を表す英語 |

---

## Navigation Design

### Header（全ページ共通）

```
[ENISHI-LAB]              Projects  About  Contact
 └── logo/wordmark         └── 3 items              └── primary CTA button style
```

- Logo: 左端固定
- Primary nav: 右側、3項目（MVP）
- Contact: ボタンスタイル（視覚的に強調）
- sticky: スクロール時も常に表示
- 背景: ページtopは透明 → スクロールで白/ダーク背景にフェード

**Growth時の拡張:**
```
[ENISHI-LAB]    Projects  About  Blog  Company  Contact
```

### Footer（全ページ共通）

```
┌─────────────────────────────────────────────────────┐
│  ENISHI-LAB                                         │
│  "縁で世界をつなぐ"（tagline）                       │
│                                                      │
│  サイト          プロダクト        フォロー           │
│  Projects        Family Quest     X (Twitter)        │
│  About           MGX              GitHub             │
│  Contact         ご縁ノート       Note               │
│  Company*                                            │
│  Blog*                                               │
│                                                      │
│  ─────────────────────────────────────────────────  │
│  © 2025 ENISHI-LAB  ·  プライバシーポリシー          │
└─────────────────────────────────────────────────────┘
```
*Growth時に追加

### Mobile Navigation

```
Header時: [ENISHI-LAB]                    [☰]

☰ タップ → フルスクリーンオーバーレイ

[────────────────────────]
  ENISHI-LAB          [✕]
[────────────────────────]

  Projects
  About
  Contact
  ─────────────────────
  Family Quest  ↗
  MGX           ↗
  ご縁ノート    ↗
  ─────────────────────
  [X]  [GitHub]  [Note]
[────────────────────────]
```

- オーバーレイ: 全画面、ブランド背景色
- アニメーション: 右からスライドイン または フェード
- タッチターゲット: 最低48px高さ

### Breadcrumb

Top-level ページ（/, /about, /projects, /contact）: **不要**

Depth-2以降: 表示

```
/projects/family-quest:
  ホーム  >  Projects  >  Family Quest

/blog/slug (Growth):
  ホーム  >  ブログ  >  [記事タイトル]
```

- JSON-LD BreadcrumbList としてSEO構造化データも出力
- モバイル: 表示を省略しない（SEO + ユーザビリティ）
```
