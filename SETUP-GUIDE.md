# IPL25 Course Setup Guide

## Complete Installation Instructions for All Platforms

**Last Updated:** 2025-11-15
**Course:** IPL25 - Server, Network and IT Security
**Timeline:** Install BEFORE course starts (or Day 1 at latest)

---

## Table of Contents

### Quick Start

- [Overview: What You Need to Install](#overview-what-you-need-to-install)
- [Installation Order](#installation-order)
- [Important: Which Terminal to Use](#important-which-terminal-to-use)

### Required Accounts

1. [Azure Account (Pay-as-you-go)](#1-azure-account-pay-as-you-go)
2. [GitHub Account](#2-github-account)

### Package Managers

3. [Package Manager (Platform-Specific)](#3-package-manager-platform-specific)
   - [PC (Windows) - winget](#pc-windows---optional-winget)
   - [Mac - Homebrew](#mac---required-homebrew)

### Required CLI Tools

4. [Git (Version Control)](#4-git-version-control)
5. [Azure CLI (Cloud Management)](#6-azure-cli-cloud-management)
6. [GitHub CLI (Repository Management)](#7-github-cli-repository-management)
7. [Bicep CLI (Infrastructure as Code)](#8-bicep-cli-infrastructure-as-code)
8. [PostgreSQL Client (Database Client)](#10-postgresql-client-database-client)

### Required Development Tools

9. [Visual Studio Code (IDE)](#5-visual-studio-code-ide)
10. [Python 3.11+ (Programming Language)](#9-python-311-programming-language)

### Recommended AI Tools

11. [AI Chatbot (Recommended)](#11-ai-chatbot-recommended)
    - [Google Gemini](#option-a-google-gemini-recommended-for-students)
    - [Claude AI](#option-b-claude-ai)
    - [ChatGPT](#option-c-chatgpt)
12. [AI CLI Tool (Recommended)](#12-ai-cli-tool-recommended)
    - [Gemini CLI (Free)](#gemini-cli-free)

### Verification & Help

- [Verification: Run the Verification Script](#verification-run-the-verification-script)
- [Expected Results](#expected-results)
- [Troubleshooting](#troubleshooting)
- [Quick Reference: Installation Commands](#quick-reference-installation-commands)
- [Post-Installation Checklist](#post-installation-checklist)
- [Next Steps](#next-steps)
- [Support](#support)

---

## Overview: What You Need to Install

### Required Accounts

1. **Azure Account** (pay-as-you-go billing, recommended)
2. **GitHub Account** (free personal account)

### Required CLI Tools

3. **Azure CLI** (cloud management)
4. **Bicep CLI** (infrastructure as code)
5. **Git** (version control)
6. **GitHub CLI** (repository management)
7. **PostgreSQL Client** (database client)

### Required Development Tools

8. **Visual Studio Code** (code editor)
9. **Python 3.11+** (programming language)

### Recommended AI Tools

10. **AI Chatbot** - At least one of: Claude, ChatGPT, or Gemini (all free)
11. **AI CLI Tool** - Gemini CLI (only free option)

### Platform-Specific Requirements

- **PC (Windows):** Git Bash (included with Git for Windows)
- **Mac:** Homebrew (package manager, recommended)

---

## Installation Order

**Important:** Follow this order for all platforms to ensure dependencies are met.

1. Azure Account
2. GitHub Account
3. Package Manager (PC: optional, Mac: Homebrew)
4. Git (PC: includes Git Bash)
5. Visual Studio Code
6. Azure CLI
7. GitHub CLI
8. Bicep CLI
9. Python 3.11+
10. PostgreSQL Client
11. AI Chatbot (recommended)
12. AI CLI Tool (recommended)

**Time Estimate:** 60-90 minutes total

---

## Important: Which Terminal to Use

### PC (Windows) Users

**ALWAYS use Git Bash for all terminal commands in this guide.**

- ❌ **DO NOT use:** PowerShell, Command Prompt (cmd), or Windows Terminal
- ✅ **ALWAYS use:** Git Bash (installed with Git for Windows in step 4)

**How to open Git Bash:**

- Right-click on desktop → "Git Bash Here"
- Or: Start menu → search "Git Bash"
- Or: In VS Code → Open terminal and ensure Git Bash is selected

**Why Git Bash?**

- Provides bash shell on Windows (same as Mac/Linux)
- All course commands work in bash
- Avoids Windows-specific path and command issues

---

### Mac Users

**Use the built-in Terminal application.**

- Terminal.app (built-in)
- Or: iTerm2 (if you prefer)
- Uses bash or zsh by default (both work)

**How to open Terminal:**

- Applications → Utilities → Terminal
- Or: Cmd+Space → type "Terminal"

---

## 1. Azure Account (Pay-as-you-go)

**All Platforms - Same Process**

### Steps:

1. Navigate to [https://azure.microsoft.com/](https://azure.microsoft.com/)
2. Click **"Start free"** or **"Pay as you go"**
3. Sign in with Microsoft account (or create new using **private email**, not school email)
4. Complete registration:
   - Credit card required for verification
   - Choose **pay-as-you-go** billing (NOT student account)
   - No upfront charges
5. Complete identity verification
6. **Enable Multi-Factor Authentication (MFA)** - required for Azure Portal access:
   - Navigate to Security settings
   - Set up MFA using authenticator app (recommended) or SMS

### Verification:

- Log into [https://portal.azure.com](https://portal.azure.com)
- Verify subscription type shows "Pay-As-You-Go"

### Cost Management (Recommended):

1. In Azure Portal, search for "Cost Management + Billing"
2. Set up billing alert:
   - Alert when budget reaches $10 USD
3. Expected monthly cost (Weeks 1-4): Less than 100 SEK (~$10 USD)

### Important Notes:

- ⚠️ **Use private email address for signup, NOT school email**
- ⚠️ **MFA is mandatory for Azure Portal access** (enforced since March 2025)
- ⚠️ **You are responsible for all Azure costs**
- ⚠️ **Always stop/deallocate VMs when not in use**
- ⚠️ **Delete resources immediately after testing**
- ✅ **Set up billing alerts on Day 1**

---

## 2. GitHub Account

**All Platforms - Same Process**

### Steps:

1. Navigate to [https://github.com/](https://github.com/)
2. Click **"Sign up"**
3. Enter email, create password, choose username
4. Verify email address
5. Choose **Free** plan
6. **Enable Two-Factor Authentication (2FA)** - required for all GitHub users:
   - Settings → Password and authentication → Two-factor authentication
   - Use authenticator app (recommended), SMS, or security key
   - GitHub will enforce this within 45 days if not set up immediately

### Verification:

- Log into [https://github.com](https://github.com)
- Verify account is active

---

## 3. Package Manager (Platform-Specific)

### PC (Windows) - Optional: winget

Windows Package Manager (winget) is **optional but recommended** for easier installation.

**Check if installed:**

```bash
winget --version
```

**If not installed:**

- Built into Windows 11 by default
- Windows 10: Install from Microsoft Store: "App Installer"

**Alternative:** Download installers manually (instructions provided for each tool below)

---

### Mac - Required: Homebrew

Homebrew is **strongly recommended** for Mac users.

**Install Homebrew:**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Follow post-installation instructions displayed in terminal** (add Homebrew to PATH)

**For Mac ARM (Apple Silicon):** Homebrew installs to `/opt/homebrew`
**For Mac Intel:** Homebrew installs to `/usr/local`

**Verification:**

```bash
brew --version
```

---

## 4. Git (Version Control)

Git is required for version control and code management.

### PC (Windows): Git for Windows

**What you get:** Git + Git Bash (bash shell for Windows)

**Installation:**

**Option A: Using winget (recommended)**

```bash
winget install Git.Git
```

**Option B: Manual download**

1. Download from [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Run installer `Git-2.x.x-64-bit.exe`
3. **Important installation options:**
   - ✅ Check "Git Bash Here"
   - ✅ Check "Git GUI Here"
   - ✅ Check "Git LFS"
   - ✅ Choose "Use Git from Git Bash only" (or "Use Git and optional Unix tools")
   - ✅ Choose "Checkout Windows-style, commit Unix-style line endings"
   - ✅ Choose "Use MinTTY (the default terminal of MSYS2)"
   - ✅ Choose default editor: **Visual Studio Code** (if already installed, otherwise Vim)

**IMPORTANT: After installation, ALWAYS use Git Bash for all commands!**

**Verification:**

```bash
# Open Git Bash (NOT PowerShell, NOT Command Prompt)
# Right-click desktop → "Git Bash Here" or search "Git Bash" in Start menu
git --version
```

---

### Mac (Intel and ARM): Git via Homebrew or Xcode

**Option A: Using Homebrew (recommended)**

```bash
brew install git
```

**Option B: Xcode Command Line Tools**

```bash
xcode-select --install
```

**Verification:**

```bash
git --version
```

**Note for ARM Mac:** Both methods install native ARM versions.

---

### Configure Git (All Platforms)

**Required configuration:**

```bash
git config --global user.name "Your Full Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
```

**Optional but recommended:**

```bash
git config --global core.editor "code --wait"
```

---

## 5. Visual Studio Code (IDE)

### PC (Windows)

**Option A: Using winget**

```bash
winget install Microsoft.VisualStudioCode
```

**Option B: Manual download**

1. Download from [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Run installer `VSCodeSetup-x64-*.exe`
3. Accept defaults
4. ✅ Check "Add to PATH" (important)

**After installation - Configure Git Bash as default terminal:**

1. Open VS Code
2. Press `Ctrl+Shift+P` (Command Palette)
3. Type "Terminal: Select Default Profile"
4. Select **"Git Bash"**

**Verification:**

```bash
# In Git Bash
code --version
```

---

### Mac (Intel)

**Download and install:**

1. Download from [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Download **"Mac Intel Chip"** version
3. Open downloaded `.zip` file
4. Drag `Visual Studio Code.app` to `Applications` folder

**Add to PATH:**

1. Open VS Code
2. Press `Cmd+Shift+P` (Command Palette)
3. Type "Shell Command: Install 'code' command in PATH"
4. Press Enter

**Verification:**

```bash
code --version
```

---

### Mac (ARM / Apple Silicon)

**Download and install:**

1. Download from [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Download **"Mac Apple Silicon"** version
3. Open downloaded `.zip` file
4. Drag `Visual Studio Code.app` to `Applications` folder

**Add to PATH:**

1. Open VS Code
2. Press `Cmd+Shift+P` (Command Palette)
3. Type "Shell Command: Install 'code' command in PATH"
4. Press Enter

**Verification:**

```bash
code --version
```

**Note:** Native ARM version provides better performance on Apple Silicon.

---

## 6. Azure CLI (Cloud Management)

### PC (Windows)

**Option A: Using winget (recommended)**

```bash
winget install Microsoft.AzureCLI
```

**Option B: Manual download**

1. Download MSI installer from [https://aka.ms/installazurecli](https://aka.ms/installazurecli)
2. Run `azure-cli-*.msi`
3. Follow installer prompts
4. **Restart Git Bash after installation**

**Verification:**

```bash
# Restart Git Bash first
az --version
```

---

### Mac (Intel and ARM)

**Using Homebrew:**

```bash
brew install azure-cli
```

**Verification:**

```bash
az --version
```

**Note for ARM Mac:** Homebrew installs native ARM version.

---

### Authenticate with Azure (All Platforms)

**After installation:**

```bash
az login
```

- Browser window will open
- Sign in with your Azure account
- Terminal will show: "You have logged in"

**Verify authentication:**

```bash
az account show
```

**Set default subscription (if you have multiple):**

```bash
# List subscriptions
az account list --output table

# Set default
az account set --subscription "Subscription Name"
```

---

## 7. GitHub CLI (Repository Management)

### PC (Windows)

**Option A: Using winget (recommended)**

```bash
winget install GitHub.cli
```

**Option B: Manual download**

1. Download from [https://cli.github.com/](https://cli.github.com/)
2. Download Windows MSI installer
3. Run `gh_*_windows_amd64.msi`
4. **Restart Git Bash after installation**

**Verification:**

```bash
# Restart Git Bash first
gh --version
```

---

### Mac (Intel and ARM)

**Using Homebrew:**

```bash
brew install gh
```

**Verification:**

```bash
gh --version
```

**Note for ARM Mac:** Homebrew installs native ARM version.

---

### Authenticate with GitHub (All Platforms)

**After installation:**

```bash
gh auth login
```

**Follow prompts:**

1. Choose: **GitHub.com**
2. Choose: **HTTPS**
3. Choose: **Login with a web browser**
4. Copy the one-time code shown
5. Press Enter to open browser
6. Paste code and authorize

**Verify authentication:**

```bash
gh auth status
```

---

## 8. Bicep CLI (Infrastructure as Code)

Bicep CLI is installed via Azure CLI.

### All Platforms - Same Process

**Install Bicep:**

```bash
az bicep install
```

**Verification:**

```bash
az bicep version
```

**Expected output:** `Bicep CLI version 0.x.x`

---

## 9. Python 3.11+ (Programming Language)

### PC (Windows)

**Option A: Using winget (recommended)**

```bash
winget install Python.Python.3.11
```

**Option B: Manual download**

1. Download from [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Download **Python 3.11.x** (or later)
3. Run installer `python-3.11.x-amd64.exe`
4. ✅ **CRITICAL:** Check "Add Python to PATH"
5. Choose "Install Now"
6. **Restart Git Bash after installation**

**Verification:**

```bash
# Restart Git Bash first
python --version
# OR
python3 --version

# Verify pip
pip --version
```

---

### Mac (Intel and ARM)

**Using Homebrew:**

```bash
brew install python@3.11
```

**Verification:**

```bash
python3 --version
pip3 --version
```

**Note for ARM Mac:** Homebrew installs native ARM version.

---

### Verify Python Version (All Platforms)

**Ensure version is 3.11 or higher:**

```bash
python3 --version
```

**Expected output:** `Python 3.11.x` or `Python 3.12.x` or higher

---

## 10. PostgreSQL Client (Database Client)

**Note:** We use PostgreSQL for **both local development and Azure production** (no SQLite). This ensures:

- Production parity: Same database everywhere
- No migration headaches: What works locally works in Azure
- One database to learn: PostgreSQL only

**Installation Timeline:**

- **Setup (now)**: Install PostgreSQL locally
- **Week 1-2**: Not used yet (basic Flask, no database)
- **Week 3+**: Start using PostgreSQL locally, then deploy to Azure

### PC (Windows)

**Manual installation required:**

1. Download PostgreSQL installer from [https://www.postgresql.org/download/windows/](https://www.postgresql.org/download/windows/)
2. Run installer `postgresql-*.exe` (version 14 or later)
3. During installation:
   - ✅ Check "PostgreSQL Server" (needed for local development)
   - ✅ Check "Command Line Tools" (includes psql)
   - ✅ Check "pgAdmin" (optional, but useful for database management)
   - ❌ Uncheck "Stack Builder" (optional, can skip)
   - Set password for database superuser (postgres) - **remember this password!**
   - Use default port: 5432
4. Complete installation
5. **Restart Git Bash after installation**

**PostgreSQL service should start automatically on Windows. To verify:**

```bash
# Check if PostgreSQL service is running (in PowerShell or Command Prompt)
# Run: services.msc
# Look for "postgresql-x64-14" (or similar) - should show "Running"
```

**Add to PATH (if not automatic):**

```bash
# Add to ~/.bashrc in Git Bash
echo 'export PATH="/c/Program Files/PostgreSQL/16/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Verification:**

```bash
# Restart Git Bash first
psql --version

# Test connection to local database
psql -U postgres -h localhost
# Enter the password you set during installation
# Type \q to quit
```

---

### Mac (Intel and ARM)

**Using Homebrew:**

```bash
# Install PostgreSQL (includes both client and server)
brew install postgresql@14
```

**Start PostgreSQL service:**

```bash
# Start PostgreSQL service and enable auto-start on system boot
brew services start postgresql@14
```

**Verification:**

```bash
# Check version
psql --version

# Verify service is running
brew services list | grep postgresql

# Test connection to local database
psql -U $(whoami) -d postgres
# Type \q to quit
```

**Note for ARM Mac:** Homebrew installs native ARM version.

**Troubleshooting:**

- If `psql -U $(whoami) -d postgres` fails, create your user database:

  ```bash
  createdb $(whoami)
  psql
  ```

---

## 11. AI Chatbot (Recommended)

**Why:** AI chatbots help with code debugging, problem-solving, and learning during the course.

**Recommendation:** Set up at least **one** of the following (all have free tiers):

### Option A: Google Gemini (Recommended for Students)

**Advantages:**

- Completely free
- No usage limits on free tier
- Good code generation
- Also has free CLI tool (see section 12)

**Setup:**

1. Navigate to [https://gemini.google.com/](https://gemini.google.com/)
2. Sign in with Google account
3. Accept terms of service
4. Start using immediately

**Verification:**

- Ask a test question: "Explain what SSH is"
- Verify you get a response

---

### Option B: Claude AI

**Advantages:**

- Excellent at explaining complex concepts
- Great for code review and refactoring
- Strong reasoning capabilities

**Limitations (Free Tier):**

- Usage limited (resets every 5 hours)
- Access to latest Claude 4 model requires paid subscription ($20/month)

**Setup:**

1. Navigate to [https://claude.ai/](https://claude.ai/)
2. Sign up with email (use private email, not school email)
3. Verify email address
4. Start using immediately

**Verification:**

- Ask a test question: "Explain what SSH is"
- Verify you get a response

---

### Option C: ChatGPT

**Advantages:**

- Very popular, lots of community knowledge
- Good general-purpose assistant
- Extensive plugin ecosystem (paid tiers)

**Limitations (Free Tier):**

- Usage limited (rate limits apply)
- Access to latest GPT-5 requires paid subscription ($20/month)

**Setup:**

1. Navigate to [https://chat.openai.com/](https://chat.openai.com/)
2. Sign up with email (use private email, not school email)
3. Verify email address
4. Start using immediately

**Verification:**

- Ask a test question: "Explain what SSH is"
- Verify you get a response

---

### Recommendation for IPL25 Students

**Best choice:** **Google Gemini** because:

- ✅ Completely free with no limits
- ✅ Also offers free CLI tool (next section)
- ✅ Good balance of capabilities for this course
- ✅ No credit card required

**Optional:** Set up multiple chatbots to compare responses and learn which works best for different tasks.

---

## 12. AI CLI Tool (Recommended)

**Why:** AI in the terminal helps with debugging commands, writing scripts, and troubleshooting in real-time.

**Important:** Only **Gemini CLI** is available on free tier. Claude Code and Codex CLI require paid subscriptions ($20+/month).

### Gemini CLI (Free)

**What you get:**

- AI assistance directly in your terminal
- 60 requests per minute, 1,000 requests per day (free)
- No API key or credit card required
- Open source (Apache 2.0 license)

**All Platforms - Same Installation Process**

### Installation:

**Prerequisites:**

- Google account (same as for Gemini chatbot)
- Node.js and npm (see platform-specific installation below)

---

### PC (Windows): Install Node.js First

**If you don't have Node.js installed:**

1. Download Node.js LTS from [https://nodejs.org/](https://nodejs.org/)
2. Run installer `node-v*-x64.msi`
3. Accept defaults (includes npm)
4. **Restart Git Bash after installation**

**Verify Node.js installation:**

```bash
# Restart Git Bash first
node --version
npm --version
```

**Install Gemini CLI:**

```bash
npm install -g @google/gemini-cli
```

**Verification:**

```bash
gemini --version
```

---

### Mac (Intel and ARM)

**Option A: Using Homebrew (Recommended - No Node.js needed)**

```bash
brew install gemini-cli
```

**Option B: Using npm (if you already have Node.js)**

```bash
npm install -g @google/gemini-cli
```

**If you don't have Node.js and want to use npm method:**

```bash
brew install node
npm install -g @google/gemini-cli
```

**Verification:**

```bash
gemini --version
```

**Note for ARM Mac:** Both Homebrew and Node.js support native ARM.

---

### Authentication:

**First time setup:**

```bash
gemini auth login
```

- Browser will open
- Sign in with your Google account
- Grant permissions
- Return to terminal

**Verify authentication:**

```bash
gemini auth status
```

---

### Basic Usage Examples:

```bash
# Ask a question
gemini "How do I list all VMs in Azure?"

# Get help with a command
gemini "What does this command do: az vm create"

# Debug an error
gemini "I got this error: 'Connection refused'. What does it mean?"

# Generate code
gemini "Write a bash script to stop all Azure VMs"
```

---

### Alternative: Claude Code or Codex CLI (Paid Only)

**If you have a paid subscription:**

- **Claude Code** ($20/month with Claude Pro): Terminal integration for Claude
- **Codex CLI** ($20/month with ChatGPT Plus): OpenAI's coding agent

**For this course, we recommend sticking with free Gemini CLI.**

---

## Verification: Run the Verification Script

After installing all tools, verify your setup:

**IMPORTANT: Run verification script in:**

- **PC:** Git Bash
- **Mac:** Terminal

### Download and run verification script:

**Option A: Download and run locally**

```bash
# PC: Run in Git Bash | Mac: Run in Terminal

# Download script
curl -fsSL https://raw.githubusercontent.com/Become-A-DevOps-PM/onboarding/main/verify-setup.sh -o verify-setup.sh

# Make executable
chmod +x verify-setup.sh

# Run
./verify-setup.sh
```

**Option B: Run directly (without download)**

```bash
curl -fsSL https://raw.githubusercontent.com/Become-A-DevOps-PM/onboarding/main/verify-setup.sh | bash
```

**Or if you have the course repository:**

```bash
cd course/onboarding
./verify-setup.sh
```

---

## Expected Results

### ✅ Success - All Tools Installed

```text
✅ WEEK 1: OK
✅ ALL: OK

🎉 You are fully prepared for the entire IPL25 course!
```

### ⚠️ Partial - Week 1 Ready, Missing Some Tools

```text
✅ WEEK 1: OK
❌ ALL: NOT OK

⚠️  You are ready for Week 1, but missing tools for the full course.
```

### ❌ Not Ready - Missing Week 1 Tools

```text
❌ WEEK 1: NOT OK
❌ ALL: NOT OK

❌ You are NOT ready for Week 1.
```

---

## Troubleshooting

### Common Issues

#### Azure CLI not found (PC)

- **Solution:** Restart Git Bash after installation
- **Alternative:** Add to PATH manually:

  ```bash
  echo 'export PATH="/c/Program Files/Microsoft SDKs/Azure/CLI2/wbin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  ```

#### Python not found (PC)

- **Solution:** Ensure you checked "Add Python to PATH" during installation
- **Fix:** Reinstall Python and check the PATH option
- **Verification:** Restart Git Bash

#### `code` command not found (Mac)

- **Solution:** Open VS Code and run "Shell Command: Install 'code' command in PATH"

#### Git Bash not default terminal in VS Code (PC)

- **Solution:** Open VS Code → `Ctrl+Shift+P` → "Terminal: Select Default Profile" → "Git Bash"

#### Homebrew installation issues (Mac)

- **Check:** Ensure Xcode Command Line Tools are installed first:

  ```bash
  xcode-select --install
  ```

- **Follow:** Post-installation instructions to add Homebrew to PATH

#### psql not found (PC)

- **Solution:** Ensure PostgreSQL bin folder is in PATH
- **Check:** `C:\Program Files\PostgreSQL\16\bin` exists
- **Add to PATH:** See PostgreSQL installation section above

---

## Quick Reference: Installation Commands

### PC (Windows) - Using winget

**IMPORTANT: Terminal to use:**

- **winget commands:** Use PowerShell or Command Prompt (winget doesn't work in Git Bash)
- **All other commands (az, gh, npm, git, etc.):** Use Git Bash

```bash
# ========================================
# RUN IN POWERSHELL OR COMMAND PROMPT:
# ========================================

# Package manager (check if installed)
winget --version

# Git for Windows
winget install Git.Git

# VS Code
winget install Microsoft.VisualStudioCode

# Azure CLI
winget install Microsoft.AzureCLI

# GitHub CLI
winget install GitHub.cli

# Python 3.11+
winget install Python.Python.3.11

# PostgreSQL (manual download required)
# See section 10 above

# ========================================
# AFTER INSTALLING GIT, RUN IN GIT BASH:
# ========================================

# Bicep (via Azure CLI)
az bicep install

# Gemini CLI (requires Node.js)
# Install Node.js first from nodejs.org, then:
npm install -g @google/gemini-cli

# Git configuration
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Verify installations
git --version
az --version
gh --version
python --version
psql --version
gemini --version
```

---

### Mac (Intel and ARM) - Using Homebrew

**IMPORTANT: Run all commands in Terminal (Applications → Utilities → Terminal)**

```bash
# Install Homebrew first (run in Terminal)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Git
brew install git

# Azure CLI
brew install azure-cli

# GitHub CLI
brew install gh

# Python 3.11+
brew install python@3.11

# PostgreSQL (client and server)
brew install postgresql@14

# Start PostgreSQL service
brew services start postgresql@14

# Bicep (via Azure CLI)
az bicep install

# Gemini CLI
brew install gemini-cli
# OR if you prefer npm: npm install -g @google/gemini-cli
```

**VS Code:** Download manually from [https://code.visualstudio.com/](https://code.visualstudio.com/)

---

## Post-Installation Checklist

Once all tools are installed:

- [ ] Azure account created (pay-as-you-go)
- [ ] GitHub account created
- [ ] Git installed and configured
- [ ] VS Code installed
- [ ] **PC only:** Git Bash set as VS Code default terminal
- [ ] Azure CLI installed and authenticated (`az login`)
- [ ] GitHub CLI installed and authenticated (`gh auth login`)
- [ ] Bicep CLI installed (`az bicep version` works)
- [ ] Python 3.11+ installed
- [ ] PostgreSQL client installed
- [ ] AI Chatbot account created (Gemini recommended)
- [ ] AI CLI tool installed (Gemini CLI recommended)
- [ ] Verification script shows: **✅ WEEK 1: OK** and **✅ ALL: OK**
- [ ] Azure billing alerts configured (recommended)
- [ ] Azure MFA/2FA enabled (required)
- [ ] GitHub 2FA enabled (required)

---

## Next Steps

1. **Set up Azure billing alerts** (if not already done)
2. **Join course Teams/Discord** (check email for invitation)
3. **Wait for Day 1 instructions**

---

## Support

**Installation issues?**

- Check troubleshooting section above
- Search error messages online
- Ask in course Discord/Teams channel
- Contact instructor during office hours

**Ready for the course?**

- Run verification script: `./verify-setup.sh`
- Expected output: ✅ WEEK 1: OK and ✅ ALL: OK

---

**Document Version:** 1.0
**Last Updated:** 2025-11-15
**Course:** IPL25 - Server, Network and IT Security
