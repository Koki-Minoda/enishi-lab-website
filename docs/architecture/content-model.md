# Content Model

Last updated: 2026-06-28
Phase: IA Design (pre-implementation)

---

## Overview

ENISHIのコンテンツはAstro Content Collectionsで管理する。
外部CMSは使用しない（One Source of Truth: リポジトリ）。

---

## Collection: projects

### 命名ノート

- リポジトリ内ディレクトリ: `src/content/projects/`
- URL: `/projects/[slug]`
- 現在 `src/content/works/` と定義されているが、IA確定に伴い `projects` に変更する
  → 実装フェーズでADR-0002に従い変更すること

### スキーマ定義（TypeScript型）

```typescript
// src/content/config.ts (実装フェーズで作成)
import { defineCollection, z } from 'astro:content';

const projects = defineCollection({
  type: 'content', // MDX body あり
  schema: z.object({
    // ── Identity ──────────────────────────────
    title: z.string(),
    // "Family Quest"

    tagline: z.string(),
    // "家族を冒険でつなぐ" — カード・ヒーローで使用

    description: z.string(),
    // 2〜3文。SEO meta description / OGPに使用

    // ── Status & Category ─────────────────────
    status: z.enum(['active', 'beta', 'development', 'archived']),
    // active=公開中, beta=β, development=開発中, archived=終了

    category: z.enum(['app', 'platform', 'tool', 'service']),
    // 将来フィルタリング用

    // ── Visuals ───────────────────────────────
    thumbnail: z.string(),
    // "/projects/family-quest/thumbnail.webp"
    // ProjectCard で使用。推奨サイズ: 800x450 (16:9)

    ogImage: z.string().optional(),
    // OGP画像。未指定時はthumbnailを使用
    // 推奨サイズ: 1200x630

    // ── Links ─────────────────────────────────
    websiteUrl: z.string().url().optional(),
    appStoreUrl: z.string().url().optional(),
    playStoreUrl: z.string().url().optional(),
    githubUrl: z.string().url().optional(),

    // ── Tech & Meta ───────────────────────────
    technologies: z.array(z.string()),
    // ["React Native", "Expo", "Supabase", "TypeScript"]

    // ── Display Control ───────────────────────
    featured: z.boolean().default(false),
    // true: Top pageのFeatured Projectsに表示

    order: z.number(),
    // Projects一覧の表示順。小さいほど先頭

    publishedAt: z.date(),
    // プロジェクトページの公開日
  }),
});

export const collections = { projects };
```

### 各プロジェクト フロントマター例

#### family-quest.mdx
```yaml
---
title: "Family Quest"
tagline: "家族を冒険でつなぐ"
description: "家族みんなで楽しめるタスク・クエスト管理アプリ。子育てをゲームに変え、家族の絆を深める。"
status: "active"
category: "app"
thumbnail: "/projects/family-quest/thumbnail.webp"
appStoreUrl: "https://apps.apple.com/..."
playStoreUrl: "https://play.google.com/..."
technologies: ["React Native", "Expo", "Supabase", "TypeScript"]
featured: true
order: 1
publishedAt: 2024-01-01
---
```

#### mgx.mdx
```yaml
---
title: "MGX"
tagline: "..."
description: "..."
status: "development"
category: "platform"
thumbnail: "/projects/mgx/thumbnail.webp"
technologies: ["..."]
featured: false
order: 2
publishedAt: 2025-01-01
---
```

#### goen-note.mdx
```yaml
---
title: "ご縁ノート"
tagline: "縁をつなぐ、記録する"
description: "大切な縁を記録し、関係を育てるためのノートアプリ。ENISHIの原点となるプロダクト。"
status: "development"
category: "app"
thumbnail: "/projects/goen-note/thumbnail.webp"
technologies: ["..."]
featured: false
order: 3
publishedAt: 2025-06-01
---
```

### MDX Body 構造（各プロジェクト）

```markdown
## Overview
このプロダクトは何か。誰のために作ったか。

## Problem
どんな課題を解決するか。

## Solution
どう解決するか。何が独自か。

## Key Features
- 機能1: 説明
- 機能2: 説明
- 機能3: 説明

## Current Status
現在のフェーズ・ロードマップ。

## Links
（フロントマターのURLをコンポーネントで表示するため、ここには書かない）
```

---

## Collection: blog (Growth)

```typescript
const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    publishedAt: z.date(),
    updatedAt: z.date().optional(),
    author: z.string().default('ENISHI-LAB'),
    tags: z.array(z.string()),
    ogImage: z.string().optional(),
    draft: z.boolean().default(false),
  }),
});
```

---

## Content: Static Pages

以下は Content Collectionsではなく `.astro` ファイルでハードコードする:

| ページ | 理由 |
|--------|------|
| `/` (Top) | 動的更新なし。デザイン固定 |
| `/about` | 更新頻度低。Astroで直接記述 |
| `/company` | 法的情報。変更時はコードレビューを通す |
| `/contact` | フォームロジック込み |
| `/privacy` | 法的文書。更新時コードレビュー必須 |

---

## File Naming Convention

```
src/content/projects/
├── family-quest.mdx    ← slug = "family-quest"
├── mgx.mdx             ← slug = "mgx"
└── goen-note.mdx       ← slug = "goen-note"
```

- ファイル名 = URLスラッグ（Astroが自動的に使用）
- 小文字ハイフン区切り
- 日本語ファイル名不可

---

## Asset Organization

```
public/
└── projects/
    ├── family-quest/
    │   ├── thumbnail.webp    (800x450, <100KB)
    │   ├── og.webp           (1200x630, <200KB)
    │   └── screenshots/
    │       ├── 01.webp
    │       └── 02.webp
    ├── mgx/
    │   └── thumbnail.webp
    └── goen-note/
        └── thumbnail.webp
```
