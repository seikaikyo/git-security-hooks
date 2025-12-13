# Git Security Hooks 🔐

Automatically scan for secrets (API keys, tokens, passwords) before every git commit.

<details>
<summary>🇹🇼 正體中文</summary>

每次 git commit 自動掃描機敏資料（API keys、tokens、密碼）。

### 特色

- 🔍 **自動掃描** - 每次 commit 自動檢查，不需手動操作
- 🚫 **阻擋提交** - 防止意外洩漏機敏資料
- 🌍 **全域設定** - 一次設定，所有 repo 自動套用
- ⚡ **快速** - 使用 [gitleaks](https://github.com/gitleaks/gitleaks) 高效掃描

### 快速開始

```bash
git clone https://github.com/seikaikyo/git-security-hooks.git
cd git-security-hooks
./install.sh
```

### 運作流程

```
git commit -m "your message"
        │
        ▼
   🔍 掃描機敏資料...
        │
        ├─ 安全     → ✓ 安全檢查通過 → Commit 成功
        └─ 有問題   → ⚠️ Commit 被阻止 → 修正後重試
```

### 解除安裝

```bash
git config --global --unset core.hooksPath
```

</details>

<details>
<summary>🇯🇵 日本語</summary>

git commit のたびに機密情報（APIキー、トークン、パスワード）を自動スキャン。

### 特徴

- 🔍 **自動スキャン** - コミットごとに自動チェック、手動操作不要
- 🚫 **コミットをブロック** - 機密情報の漏洩を防止
- 🌍 **グローバル設定** - 一度の設定ですべてのリポジトリに適用
- ⚡ **高速** - [gitleaks](https://github.com/gitleaks/gitleaks) による効率的なスキャン

### クイックスタート

```bash
git clone https://github.com/seikaikyo/git-security-hooks.git
cd git-security-hooks
./install.sh
```

### 仕組み

```
git commit -m "your message"
        │
        ▼
   🔍 機密情報をスキャン中...
        │
        ├─ 安全     → ✓ セキュリティチェック通過 → コミット成功
        └─ 問題あり → ⚠️ コミットをブロック → 修正して再試行
```

### アンインストール

```bash
git config --global --unset core.hooksPath
```

</details>

---

## Features

- 🔍 **Automatic scanning** - Every commit is scanned, no manual steps
- 🚫 **Blocks commits** - Prevents accidental secret leaks
- 🌍 **Global setup** - Works for all repositories on your machine
- ⚡ **Fast** - Uses [gitleaks](https://github.com/gitleaks/gitleaks) for efficient scanning

## Quick Start

```bash
# Clone this repo
git clone https://github.com/seikaikyo/git-security-hooks.git

# Run installer
cd git-security-hooks
./install.sh
```

That's it! All your git commits will now be scanned automatically.

## How It Works

```
git commit -m "your message"
        │
        ▼
   🔍 Scanning for secrets...
        │
        ├─ Clean     → ✓ Security check passed → Commit succeeds
        │
        └─ Has secrets → ⚠️ Commit blocked → Fix and retry
```

## What It Detects

- API Keys (AWS, GCP, Azure, Vercel, Netlify, etc.)
- Access Tokens (GitHub, GitLab, npm, etc.)
- Private Keys (RSA, SSH, PGP)
- Passwords and secrets in config files
- Database connection strings
- And 100+ other patterns

## Manual Installation

```bash
# Install gitleaks
brew install gitleaks  # macOS
# or see https://github.com/gitleaks/gitleaks#installation

# Set global hooks path
git config --global core.hooksPath /path/to/git-security-hooks/hooks
```

## Bypass (Use With Caution)

If you get a false positive:

```bash
git commit --no-verify -m "your message"
```

## Uninstall

```bash
git config --global --unset core.hooksPath
```

## Requirements

- Git 2.9+ (for `core.hooksPath` support)
- [gitleaks](https://github.com/gitleaks/gitleaks)

## Why?

Services like [GitGuardian](https://gitguardian.com/) and [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning) catch secrets **after** you push. This hook catches them **before** you commit - preventing the embarrassment and security risk entirely.

## License

MIT

---

Made with ❤️ to prevent "oh no I pushed my API key" moments.
