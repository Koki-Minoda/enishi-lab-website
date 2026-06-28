# ENISHI-LAB Website

ENISHIの公式Webサイト。

## Stack

- [Astro](https://astro.build/) 7.x — static output
- [Tailwind CSS](https://tailwindcss.com/) v4
- TypeScript (strict)
- [Biome](https://biomejs.dev/) — linter / formatter
- pnpm

## Development

```bash
pnpm install
pnpm dev        # http://localhost:4321
pnpm build      # dist/ に静的ファイル生成
pnpm preview    # ビルド結果をローカルでプレビュー
```

## Quality

```bash
pnpm lint       # lint チェック
pnpm lint:fix   # lint 自動修正
pnpm format     # フォーマット
pnpm check      # astro check + biome check
```

## Branch Strategy

| Branch | 役割 |
|--------|------|
| `main` | production (VPS自動デプロイ対象) |
| `dev` | 統合ブランチ |
| `feature/*` | 機能開発 |

## Structure

```
src/
├── pages/          # ルーティング (index.astro, works/, about, contact)
├── components/
│   ├── common/     # Header, Footer, SEO
│   ├── home/       # Top page
│   └── works/      # Works
├── layouts/        # ページレイアウト
├── content/        # MDX コンテンツ (works/ 等)
└── styles/
    └── global.css  # Tailwind v4 @import + @theme (Design System)
docs/
├── adr/            # Architecture Decision Records (なぜ)
├── architecture/   # 現在の構造 (何が)
└── design/         # UI / Design System
```

## Deploy

- Target: VPS (nginx + Let's Encrypt)
- CI/CD: GitHub Actions (設定予定)
- Branch: `main` → production

## Docs

- [Architecture](docs/architecture/overview.md)
- [Design System](docs/design/system.md)
- [ADR一覧](docs/adr/)
- [Bootstrap DoD](docs/bootstrap-dod.md)
