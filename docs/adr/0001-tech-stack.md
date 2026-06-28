# ADR-0001: Technology Stack Selection

Date: 2026-06-28
Status: Accepted

## Context

ENISHI-LAB Websiteの技術スタックを選定する。
VPS (nginx) へのデプロイを前提とし、パフォーマンスと開発者体験を両立する。

## Decision

- **Framework**: Astro 7.x (static output)
- **Styling**: Tailwind CSS v4 + @tailwindcss/vite
- **Language**: TypeScript (strict)
- **Linter/Formatter**: Biome
- **Package Manager**: pnpm

## Rationale

- Astro: 静的出力がデフォルト。VPS向き。Reactコンポーネントをislandsとして段階導入可能
- Tailwind v4: ビルド速度大幅改善。CSS-first設定。Viteネイティブ統合
- Biome: ESLint + Prettier を単一ツールで代替。高速
- pnpm: ディスク効率とパフォーマンスでnpmを上回る

## Consequences

- GitHub Actions CDは後続フェーズで設定
- 将来のReactコンポーネントはislands architectureで追加
- CMSはAstro Content Collectionsで管理（外部SaaS不要）
