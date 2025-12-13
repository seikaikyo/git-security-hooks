# Git Security Hooks 🔐

Automatically scan for secrets (API keys, tokens, passwords) before every git commit.

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

If you prefer manual setup:

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
