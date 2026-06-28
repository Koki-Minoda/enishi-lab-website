# Trust & Conversion Architecture

Last updated: 2026-06-28
Phase: Brand & Messaging Design (pre-Design System)

---

## Trust Architecture

### 信頼の構成要素

スタートアップにとっての信頼は「証拠の積み重ね」ではなく
「哲学の一貫性」と「人間の顔」で構築される。

| 信頼要素 | 説明 | 見せる場所 | 優先度 |
|---------|------|-----------|--------|
| **Design Quality** | サイト自体がプロフェッショナリズムを示す | 全ページ（即時） | 最高 |
| **Copy Depth** | 言葉に哲学がある。バズワードがない | Hero / About | 最高 |
| **Founder Story** | 創業者の人間的な原体験 | /about Origin | 高 |
| **Product Existence** | 実際に動くプロダクトがある | /projects | 高 |
| **Philosophical Consistency** | 全ページのメッセージが一貫している | 全体 | 高 |
| **Transparency** | 開発中・ベータを隠さずStatusバッジで表示 | /projects | 高 |
| **Technical Credibility** | 使用技術・アーキテクチャ | /projects/[slug] | 中 |
| **Systematic Thinking** | Company OS的な組織的深さ（直接言わなくてよい、滲み出る） | /about | 中 |
| **Social Proof** | ユーザー数・レビュー・メディア掲載 | /about または /projects/[slug] | 中（Growth時） |
| **Roadmap** | 将来への計画（嘘をつかない範囲で） | /about または /company | 低（Growth時） |

### 信頼の構築シーケンス

```
即時（0秒）
  └── Design Qualityで「プロフェッショナル」判断

5秒
  └── Heroコピーの深さで「思慮がある」判断

30秒
  └── Projectsの存在で「言葉だけでない」判断
  └── StatusBadgeの誠実さで「透明性がある」判断

2分
  └── About / Visionで「哲学が一貫している」判断

5分
  └── 創業者ストーリーで「この人を信頼できる」判断
  └── Tech stackで「技術的に信頼できる」判断
```

### 信頼シグナルの配置マップ

```
/ (Top)
  ├── Hero: コピーの質 → 哲学的信頼
  ├── Featured Projects: 実在するプロダクト → 実績的信頼
  ├── Vision: 一貫した思想 → 哲学的信頼
  └── About Snippet: 人の顔 → 人間的信頼

/about
  ├── Origin Story: なぜこの会社か → 人間的信頼（最強）
  ├── Values: 一貫した原則 → 哲学的信頼
  └── Team: 具体的な人間 → 人間的信頼

/projects
  ├── ProjectCard Status: 透明性 → 誠実な信頼
  └── Project Detail: 技術スタック・スクリーンショット → 技術的信頼

/contact
  └── Response time明示: 「通常3営業日以内」→ 誠実な信頼
```

### ENISHIに特有の信頼設計

Company OSの存在（体系的な組織設計）は直接Webに記載しない。
ただし「思想から作られた組織」という印象を与えるために:

- About の文体・構造が論理的かつ温かみある
- ADRのような設計判断の重さが製品品質として滲み出る
- プロダクトとMessagingの一貫性（全部「縁」で繋がっている）

---

## Conversion Architecture

### ペルソナ定義

| ペルソナ | 来訪動機 | 期待するもの |
|---------|---------|-----------|
| **A: プロダクトユーザー** | 「Family Questって何？」「アプリ探してた」 | プロダクトの価値を理解してDL/試用 |
| **B: ビジネスパートナー** | 「ENISHIって会社どんな会社？」 | 信頼性・実力・連絡先 |
| **C: 採用候補者** | 「ここで働けるか？」 | 文化・プロダクト・人 |
| **D: メディア/プレス** | 「取材/紹介できる会社か？」 | 会社概要・ストーリー・連絡先 |
| **E: 共感者** | 「SNSで見た」「哲学に共鳴」 | 深く知る / フォロー / いつかコンタクト |

---

### Persona A: プロダクトユーザー

```
Entry: / または /projects または /projects/[slug]
（SNS・口コミ・App Storeからの逆引き訪問が多い）

Journey:
/ (Featured Projects を見る)
  ↓
/projects (一覧から興味のプロダクトへ)
  ↓
/projects/family-quest (詳細・スクリーンショット・レビュー)
  ↓
CTA: 「App Storeでダウンロード」 → 外部

Key Moments:
  - ProjectCardのthumbnailとtaglineが「自分向けか」を判断
  - StatusBadge (active/beta)で「今使えるか」を確認
  - Screenshots/Demoで「実際どんな感じか」を体験

Friction Points:
  - DL先へのリンクが見つからない → Hero/CTA に明示
  - プロダクトが開発中で試せない → 「通知を受け取る」CTA (Growth)
```

---

### Persona B: ビジネスパートナー / 企業

```
Entry: / または /about
（検索・紹介からが多い）

Journey:
/ (会社の全体像を把握)
  ↓
/about (思想・創業者・実績)
  ↓
/projects (実力の確認)
  ↓
/contact (問い合わせ)
  ↓
CTA: 「お問い合わせ」→ /contact (inquiry type: ビジネス)

Key Moments:
  - Heroで「どんな会社か」が即座に伝わる
  - /about の Origin Story で「信頼できる人か」を判断
  - /projects で「実力があるか」を確認

Friction Points:
  - 会社の正式情報（法人情報）がない → /company (Growth) で対応予定
  - プロダクトと受託開発の区別がわかりにくい → /contact フォームで補完
```

---

### Persona C: 採用候補者

```
Entry: / または /about
（SNS・技術ブログ・友人の紹介から）

Journey (MVP):
/ (会社の思想と雰囲気を把握)
  ↓
/about (創業者・チーム・価値観)
  ↓
/contact (問い合わせ: 採用)
  ↓
CTA: 「お問い合わせ（採用について）」

Journey (Growth):
/ → /about → /careers → /careers/[slug] → 応募フォーム

Key Moments:
  - ENISHIの価値観への共感（About Values）
  - 使っている技術スタックの確認（/projects/[slug] Tech Stack）
  - 創業者の人間性（/about Team）

Friction Points (MVP):
  - 採用ページがない → /contact の inquiry type「採用」で代替
  - ポジション詳細がわからない → Growth で /careers を設ける
```

---

### Persona D: メディア / プレス

```
Entry: / または検索
（リリース・イベント・SNS話題から）

Journey (MVP):
/ → /about → /contact (inquiry type: プレス)

Journey (Growth):
/ → /about → /company → /contact

Key Moments:
  - ストーリーの独自性（AI時代 × 人間らしさという切り口）
  - 創業者インタビューへのアクセス
  - プレスキット（ロゴ・画像）← Growth で /press or /company に設置

Friction Points:
  - プレスキットがない → MVP は /contact で対応
  - 会社の基本情報が見当たらない → /company (Growth) で解決
```

---

### Persona E: 共感者 / 将来の協業者

```
Entry: SNS・ブログ・紹介 → /
（ENISHIの思想に共鳴して来訪）

Journey:
/ (全体を感じ取る)
  ↓
/about (深く読む)
  ↓
/projects (プロダクトに触れる)
  ↓
[選択] フォロー / メール登録(Growth) / /contact

Key Moments:
  - Visionセクションでの「これは自分も信じている」感覚
  - プロダクトが哲学を実装していることへの感動

CTA:
  MVP: SNSフォロー / /contact
  Growth: ニュースレター登録 / コミュニティ参加
```

---

## ペルソナ別 Navigation Optimization

各ペルソナが最初に見るべきページへの動線:

```
Header Nav（全員向け）:
  Projects | About | Contact

Footerで補完（ペルソナ分岐）:
  「プロダクトを試す」 → /projects  (Persona A向け)
  「採用情報」 → /contact or /careers  (Persona C向け, Growth)
  「プレス」 → /contact  (Persona D向け)

Top ページ CTA Block（将来 - Growth）:
  「使いたい方」→ /projects
  「働きたい方」→ /careers  
  「協業したい方」→ /contact
```

---

## Conversion Funnel まとめ

```
認知
  ↓  SNS / 検索 / 口コミ
訪問 (/)
  ↓  Narrative Flow で信頼形成
関心 (/about / /projects)
  ↓  Trust Architecture で確信
検討 (/projects/[slug] / /contact)
  ↓  ペルソナ別 CTA
行動
  ├── DL (Persona A)
  ├── お問い合わせ (Persona B, D)
  ├── 採用応募 (Persona C)
  └── フォロー / ブックマーク (Persona E)
```
