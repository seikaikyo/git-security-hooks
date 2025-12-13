# Git Security Hooks 🔐

**[English](README.md)** | **[正體中文](README.zh-TW.md)** | **[日本語](README.ja.md)**

每次 git commit 自動掃描機敏資料（API keys、tokens、密碼）。

## 特色

- 🔍 **自動掃描** - 每次 commit 自動檢查，不需手動操作
- 🚫 **阻擋提交** - 防止意外洩漏機敏資料
- 🌍 **全域設定** - 一次設定，所有 repo 自動套用
- ⚡ **快速** - 使用 [gitleaks](https://github.com/gitleaks/gitleaks) 高效掃描

## 快速開始

```bash
# 複製專案
git clone https://github.com/seikaikyo/git-security-hooks.git

# 執行安裝
cd git-security-hooks
./install.sh
```

搞定！之後所有 git commit 都會自動掃描。

## 運作流程

```
git commit -m "your message"
        │
        ▼
   🔍 掃描機敏資料...
        │
        ├─ 安全     → ✓ 安全檢查通過 → Commit 成功
        │
        └─ 有問題   → ⚠️ Commit 被阻止 → 修正後重試
```

## 可偵測項目

- API Keys（AWS、GCP、Azure、Vercel、Netlify 等）
- Access Tokens（GitHub、GitLab、npm 等）
- 私鑰（RSA、SSH、PGP）
- 設定檔中的密碼
- 資料庫連線字串
- 以及 100+ 種其他模式

## 手動安裝

如果你想手動設定：

```bash
# 安裝 gitleaks
brew install gitleaks  # macOS
# 或參考 https://github.com/gitleaks/gitleaks#installation

# 設定全域 hooks 路徑
git config --global core.hooksPath /path/to/git-security-hooks/hooks
```

## 跳過檢查（謹慎使用）

如果遇到誤報：

```bash
git commit --no-verify -m "your message"
```

## 解除安裝

```bash
git config --global --unset core.hooksPath
```

## 系統需求

- Git 2.9+（支援 `core.hooksPath`）
- [gitleaks](https://github.com/gitleaks/gitleaks)

## 為什麼需要這個？

[GitGuardian](https://gitguardian.com/) 和 [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning) 這類服務是在你 push **之後**才偵測。這個 hook 在你 commit **之前**就攔截——完全避免機敏資料進入 git 歷史。

## 授權

MIT

---

用 ❤️ 打造，避免「完蛋我把 API key 推上去了」的窘境。
