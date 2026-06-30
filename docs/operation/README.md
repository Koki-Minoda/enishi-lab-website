# ENISHI-LAB Website — 運用手順書

## 1. コンテンツ更新フロー

```
[ローカル編集] → [pnpm check] → [git push] → [GitHub Actions] → [VPS 反映]
```

### 通常更新手順

```bash
# 1. ローカルで編集
#    プロダクト追加: src/content/projects/<slug>.mdx を作成
#    ページ編集:    src/pages/*.astro を編集

# 2. 品質チェック (必須)
pnpm check      # 0 errors であること

# 3. ビルド確認 (任意・本番前に推奨)
pnpm build

# 4. commit & push
git add <files>
git commit -m "feat: <変更内容>"
git push origin main

# 5. GitHub Actions で自動デプロイ (push トリガー有効化後)
#    https://github.com/Koki-Minoda/enishi-lab-website/actions
```

### GitHub Actions 手動デプロイ (現在の手順)

```
GitHub → Actions → Deploy → Run workflow → branch: main → Run workflow
```

push トリガーへの切り替え条件:
- `VPS_HOST` / `VPS_USER` / `SSH_PRIVATE_KEY` が Secrets に登録済み
- workflow_dispatch での手動デプロイが 1 回成功済み

---

## 2. ロールバック手順

### コード変更のロールバック

```bash
# 直前の commit に戻す
git revert HEAD
git push origin main
# → GitHub Actions が旧バージョンを再デプロイ
```

### VPS での緊急ロールバック (GitHub Actions 使用不可の場合)

```bash
# VPS にログインして旧ファイルを手動復元
ssh <VPS_USER>@<VPS_HOST>
cd /var/www/enishi-lab
# dist/ を手動 rsync で上書き
```

### nginx ロールバック

```bash
# enishi-lab の nginx 設定を無効化 (MGX への影響なし)
sudo rm /etc/nginx/sites-enabled/enishi-lab.com
sudo nginx -s reload
```

---

## 3. GitHub Actions Secrets 管理

| Secret 名 | 内容 | 登録場所 |
|-----------|------|---------|
| `VPS_HOST` | mgx-prod-01 の IP またはホスト名 | GitHub → Settings → Secrets |
| `VPS_USER` | SSH ユーザー名 | 同上 |
| `SSH_PRIVATE_KEY` | deploy 専用 ed25519 秘密鍵 | 同上 |

**SSH キー生成 (ローカル PC で実行):**

```bash
ssh-keygen -t ed25519 -C "github-actions-deploy" \
           -f ./enishi_deploy_key -N ""

# 公開鍵だけを VPS に追加
ssh-copy-id -i ./enishi_deploy_key.pub <VPS_USER>@<VPS_HOST>

# 秘密鍵を GitHub Secrets に登録後、ローカルから削除
rm ./enishi_deploy_key ./enishi_deploy_key.pub
```

---

## 4. SEO 監視

### Engineering KPI チェック (2 週間ごと)

```bash
# robots.txt 応答確認
curl -I https://enishi-lab.com/robots.txt
# → HTTP/2 200

# sitemap 確認
curl https://enishi-lab.com/sitemap-0.xml
# → 全6URL が含まれること

# canonical 確認
curl -s https://enishi-lab.com/ | grep 'canonical'
# → <link rel="canonical" href="https://enishi-lab.com/"> が出力されること
```

**PageSpeed Insights:** https://pagespeed.web.dev/?url=https://enishi-lab.com

| 指標 | 目標 |
|------|------|
| LCP | < 2.5s |
| CLS | < 0.1 |
| INP | < 200ms |

### Business KPI チェックスケジュール

| タイミング | チェック内容 | 場所 |
|-----------|-------------|------|
| A-2 完了後 2 週間 | Coverage エラー 0 件確認 | Search Console → Coverage |
| A-2 完了後 1 ヶ月 | Index 数 6ページ / Impressions 発生確認 | Search Console → Performance |
| 四半期 | Click 数・CTR トレンド分析 / 次 Sprint 提案 | Search Console → Performance |

---

## 5. SSL 証明書更新

certbot は自動更新 (cron) が設定されています。

```bash
# 更新状況確認 (VPS 上で)
sudo certbot certificates

# 手動更新 (必要な場合)
sudo certbot renew --dry-run   # テスト
sudo certbot renew             # 本番
```

---

## 6. nginx 設定変更手順

```bash
# テスト (必ず実施)
sudo nginx -t

# 反映
sudo nginx -s reload

# 設定ファイル場所
/etc/nginx/sites-available/enishi-lab.com   # ENISHI-LAB 設定
/etc/nginx/sites-available/mgx-poker        # MGX 設定 (変更禁止)
```

**mgx-poker の設定は絶対に変更しない。**
