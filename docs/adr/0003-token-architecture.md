# ADR-0003: 3-Layer Design Token Architecture

Date: 2026-06-28
Status: Accepted

## Context

ENISHI-LABは複数プロダクト（Family Quest / MGX / ご縁ノート / 将来追加）を運営する。
各プロダクトはそれぞれ固有の体験を持ちながら、同一ブランドとして認識される必要がある。
単一のフラットなトークン設計では、プロダクト間の差異化とブランド一貫性が両立できない。

## Decision

**Brand Token → Theme Token → Component Token** の3層構造を採用する。

```
Layer 1: Brand Token（プリミティブスケール）
  ENISHI全体で不変の絶対値
  例: --enishi-gold-500: #B8922B

    ↓ 参照

Layer 2: Theme Token（セマンティックエイリアス）
  プロダクト/コンテキストごとに Brand Token を文脈化
  例（Website）: --color-brand: #B8922B (= gold-500)
  例（MGX）:     --color-brand: #D4A520 (= gold-400, darker bg向け)

    ↓ 参照

Layer 3: Component Token（コンポーネント固有）
  UI部品が参照する具体的な値
  例: --button-bg: var(--color-brand)
```

## Rationale

- **Brand一貫性**: すべてのプロダクトが同じ gold スケールを参照する
- **差異化可能**: Theme層でプロダクト体験を独立して定義できる
- **変更局所化**: Brand colorを変えるとき、Layer 1のみ変更で全体に伝播
- **Tailwind v4対応**: `@theme` ブロックはこの構造と自然に対応する
- **業界標準**: Salesforce Lightning / Shopify Polaris / Figma Tokens と同一パターン

## Consequences

- 各プロダクトのリポジトリは Layer 1 を共有し、Layer 2/3 を独自実装
- Website の `src/styles/global.css` は Layer 1 + Layer 2 (Website Theme) + Layer 3 を持つ
- MGX・Family Quest 等は同じ Layer 1 を参照しつつ独自の Layer 2 を定義
- Brand Token の変更は全プロダクトへ影響するため慎重に行う
- Layer 1 は Company Asset として管理（Company OS Feedback候補）
