# ADR-0002: URL・ディレクトリ命名を "projects" に統一

Date: 2026-06-28
Status: Accepted

## Context

Bootstrap段階では `src/content/works/` と `src/components/works/` として設計していた。
IAフェーズで「Works（作品）」より「Projects（プロジェクト）」の方が実態に合うと判明した。

ENISHIが作るものはクライアントワーク（受注作品）ではなく、
自社プロダクト（Family Quest, MGX, ご縁ノートなど）である。

## Decision

- URL: `/projects` / `/projects/[slug]`
- Content Collections: `src/content/projects/`
- Components: `src/components/projects/`
- 型名: `Project` (not `Work`)

## Rationale

- "Projects" の方がプロダクト開発の文脈に合致
- URLの意味がより明確（将来のクライアントワーク追加時も混同しない）
- Content Collectionsのディレクトリ名 = URL = 型名で一貫

## Consequences

- 実装フェーズで `works/` → `projects/` へ変更が必要
- Bootstrap段階のディレクトリ骨格（`src/components/works/`）も変更対象
- 該当変更は実装フェーズ開始時に一括実施
