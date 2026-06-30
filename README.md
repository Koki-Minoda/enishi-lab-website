# ENISHI-LAB Website

ENISHI-LABの公式Webサイト。

- **URL:** https://enishi-lab.com
- **Stack:** Astro 7 / Tailwind v4 / TypeScript / Biome / pnpm

## Stack

- [Astro](https://astro.build/) 7.x — static output
- [Tailwind CSS](https://tailwindcss.com/) v4
- TypeScript (strict)
- [Biome](https://biomejs.dev/) — linter / formatter
- pnpm 11.x

## Development

```bash
pnpm install
pnpm dev        # http://localhost:4321
pnpm build      # dist/ に静的ファイル生成
pnpm preview    # ビルド結果をローカルでプレビュー
```

## Quality

```bash
pnpm check      # astro check + biome check (CI 必須)
pnpm lint:fix   # lint 自動修正
pnpm format     # フォーマット
```

## Pages

| URL | ページ |
|-----|--------|
| `/` | Top (Hero + CTA) |
| `/about` | ENISHI-LABについて |
| `/projects` | プロダクト一覧 |
| `/projects/mgx` | MGX 詳細 |
| `/projects/family-quest` | Family Quest 詳細 |
| `/projects/goen-note` | ご縁ノート 詳細 |

## Deploy

- **VPS:** mgx-prod-01 (Ubuntu 22.04 / nginx 1.18)
- **Web root:** `/var/www/enishi-lab`
- **CI/CD:** GitHub Actions (`.github/workflows/deploy.yml`)
- **Trigger:** `workflow_dispatch` → Secrets 登録後に `push: main` へ変更予定
- **Secrets 必要:** `VPS_HOST` / `VPS_USER` / `SSH_PRIVATE_KEY`

詳細: [docs/operation/README.md](docs/operation/README.md)

## SEO

- **sitemap:** https://enishi-lab.com/sitemap-index.xml
- **robots.txt:** https://enishi-lab.com/robots.txt
- **canonical:** BaseLayout.astro で全ページ自動生成
- **Search Console:** Human Sprint A-2 で登録予定

## Structure

```
src/
├── pages/          # ルーティング
├── components/
│   ├── common/     # NavHeader 等
│   ├── home/       # Top page
│   └── projects/   # ProjectCard 等
├── layouts/        # BaseLayout.astro
├── content/        # MDX コンテンツ (projects/)
└── styles/
    └── global.css  # Tailwind v4 @theme (Design System)
docs/
├── adr/            # Architecture Decision Records
├── architecture/   # 構造定義
├── brand/          # Brand Voice / Messaging
├── design/         # Design System
└── operation/      # 運用手順書
scripts/
├── nginx-enishi-lab.conf   # VPS nginx Virtual Host (HTTP-only)
└── vps-readiness-check.sh  # VPS 事前確認スクリプト
```

## Docs

- [運用手順書](docs/operation/README.md)
- [Architecture](docs/architecture/overview.md)
- [Design System](docs/design/system.md)
- [ADR一覧](docs/adr/)
