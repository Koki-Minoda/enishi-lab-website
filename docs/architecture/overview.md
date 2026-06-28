# Architecture Overview

Last updated: 2026-06-28

## Repository Structure

```
enishi-lab-website/
├── src/
│   ├── pages/          # ルーティング。ファイル名 = URL
│   ├── components/     # 再利用コンポーネント
│   │   ├── common/     # Header, Footer, SEO
│   │   ├── home/       # Top page 専用
│   │   └── works/      # Works 専用
│   ├── layouts/        # ページレイアウト (Base.astro 等)
│   ├── content/        # Content Collections (works/ 等)
│   └── styles/
│       └── global.css  # Tailwind v4 @import + @theme
├── public/             # 静的アセット (favicon 等)
├── docs/
│   ├── adr/            # Architecture Decision Records (なぜ)
│   ├── architecture/   # 現在の構造 (このドキュメント)
│   └── design/         # UI / Design System
└── dist/               # ビルド出力 (gitignore)
```

## Build Flow

```
src/ → astro build → dist/ (静的HTML/CSS/JS)
                          ↓
                      nginx (VPS)
                          ↓
                       ブラウザ
```

## Output Mode

`output: 'static'` — SSRなし。全ページをビルド時に生成。

## Content Management

Works等のコンテンツは `src/content/works/*.mdx` で管理。
Astro Content Collections によりスキーマ保証。外部CMS不使用。

## Future Islands

インタラクティブコンポーネントが必要になった場合は
Astro Islands (React) として追加。現時点では純Astroコンポーネント。

## Key Decisions

詳細は `docs/adr/` を参照:
- [ADR-0001](../adr/0001-tech-stack.md) — Technology Stack Selection
- [ADR-0002](../adr/0002-projects-over-works.md) — works → projects 命名統一

## Architecture Documents

- [ia.md](ia.md) — Information Architecture (サイトマップ / URL / Navigation)
- [page-blueprint.md](page-blueprint.md) — ページ別セクション設計
- [content-model.md](content-model.md) — Content Collections スキーマ
