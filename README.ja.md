# Git Security Hooks 🔐

**[English](README.md)** | **[正體中文](README.zh-TW.md)** | **[日本語](README.ja.md)**

git commit のたびに機密情報（APIキー、トークン、パスワード）を自動スキャン。

## 特徴

- 🔍 **自動スキャン** - コミットごとに自動チェック、手動操作不要
- 🚫 **コミットをブロック** - 機密情報の漏洩を防止
- 🌍 **グローバル設定** - 一度の設定ですべてのリポジトリに適用
- ⚡ **高速** - [gitleaks](https://github.com/gitleaks/gitleaks) による効率的なスキャン

## クイックスタート

```bash
# リポジトリをクローン
git clone https://github.com/seikaikyo/git-security-hooks.git

# インストーラーを実行
cd git-security-hooks
./install.sh
```

以上！これからすべての git commit が自動的にスキャンされます。

## 仕組み

```
git commit -m "your message"
        │
        ▼
   🔍 機密情報をスキャン中...
        │
        ├─ 安全     → ✓ セキュリティチェック通過 → コミット成功
        │
        └─ 問題あり → ⚠️ コミットをブロック → 修正して再試行
```

## 検出対象

- APIキー（AWS、GCP、Azure、Vercel、Netlify など）
- アクセストークン（GitHub、GitLab、npm など）
- 秘密鍵（RSA、SSH、PGP）
- 設定ファイル内のパスワード
- データベース接続文字列
- その他 100 以上のパターン

## 手動インストール

手動で設定したい場合：

```bash
# gitleaks をインストール
brew install gitleaks  # macOS
# または https://github.com/gitleaks/gitleaks#installation を参照

# グローバル hooks パスを設定
git config --global core.hooksPath /path/to/git-security-hooks/hooks
```

## バイパス（注意して使用）

誤検知の場合：

```bash
git commit --no-verify -m "your message"
```

## アンインストール

```bash
git config --global --unset core.hooksPath
```

## 必要条件

- Git 2.9+（`core.hooksPath` サポート）
- [gitleaks](https://github.com/gitleaks/gitleaks)

## なぜ必要？

[GitGuardian](https://gitguardian.com/) や [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning) などのサービスは、push **した後**に検出します。この hook は commit **する前**にキャッチし、機密情報が git 履歴に入ることを完全に防ぎます。

## ライセンス

MIT

---

「やばい、APIキーをプッシュしちゃった」という瞬間を防ぐために ❤️ を込めて作りました。
