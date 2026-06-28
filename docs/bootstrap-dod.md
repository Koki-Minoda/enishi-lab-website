# Bootstrap Definition of Done

Project: enishi-lab-website
Date: 2026-06-28

## Completion Criteria

すべての項目が ✅ であることがBootstrap完了の条件。

### Repository

- [x] Project Repositoryディレクトリ作成 (`C:\projects\enishi-lab-website`)
- [x] `git init` 実行済み
- [x] デフォルトブランチ `main` に設定済み
- [x] `.gitignore` 配置済み（node_modules, dist, .env 等を除外）
- [x] `.env.example` 配置済み

### Build

- [x] `pnpm install` 成功
- [x] `pnpm build` 成功（静的出力 `dist/index.html` 生成確認）
- [x] ビルド出力が `.gitignore` 対象であることを確認

### Documentation

- [x] `README.md` — Stack / Development / Deploy / Structure を記載
- [x] `docs/adr/0001-tech-stack.md` — 技術選定の根拠 (Why)
- [x] `docs/architecture/overview.md` — 現在の構造 (What)
- [x] `docs/design/system.md` — Design System定義（未着手 → Level 1が次フェーズ）
- [x] `docs/bootstrap-dod.md` — このファイル

### AI Collaboration

- [x] `CLAUDE.md` — Project固有の技術的文脈のみ。Company OSを参照
- [x] `AGENTS.md` — CLAUDE.mdへのポインタ。Company OSを参照

### Directory Structure

- [x] `src/pages/` — エントリポイント
- [x] `src/components/common/`, `home/`, `works/`
- [x] `src/layouts/`
- [x] `src/content/works/`
- [x] `src/styles/global.css` — Tailwind v4 `@import "tailwindcss"` 確認
- [x] `.github/ISSUE_TEMPLATE/`
- [x] `.github/workflows/`

### Quality

- [x] `biome.json` 配置済み
- [x] `pnpm lint` 実行可能
- [x] `pnpm check` 実行可能

## Not In Scope (Bootstrap)

以下はBootstrapスコープ外。後続フェーズで対応:

- Design System Level 1 (トークン定義) → Design Systemフェーズ
- GitHub remote / push → 明示承認後
- CI/CD (GitHub Actions) → Infrastructure フェーズ
- VPS / nginx / SSL → Infrastructure フェーズ
- 実コンテンツ入稿 → Content フェーズ
