#!/bin/bash
#
# IPL25 Course Readiness Verification Script
# Checks all required tools and configurations for the entire course
#
# Usage: ./verify-setup.sh
# Or: curl -fsSL https://raw.githubusercontent.com/Become-A-DevOps-PM/onboarding/main/verify-setup.sh | bash
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Track readiness separately
WEEK1_READY=true
ALL_READY=true

echo ""
echo "========================================="
echo "  IPL25 Course Readiness Verification"
echo "========================================="
echo ""

# Detect platform
detect_platform() {
    OS="$(uname -s)"
    case "${OS}" in
        Linux*)     PLATFORM="Linux";;
        Darwin*)    PLATFORM="Mac";;
        MINGW*|MSYS*|CYGWIN*)    PLATFORM="Windows";;
        *)          PLATFORM="Unknown";;
    esac

    if [ "$PLATFORM" = "Mac" ]; then
        ARCH="$(uname -m)"
        if [ "$ARCH" = "arm64" ]; then
            PLATFORM_DETAIL="Mac (ARM/Apple Silicon)"
        else
            PLATFORM_DETAIL="Mac (Intel)"
        fi
    elif [ "$PLATFORM" = "Windows" ]; then
        PLATFORM_DETAIL="Windows (Git Bash)"
    else
        PLATFORM_DETAIL="$PLATFORM"
    fi

    echo -e "${BLUE}📊 Platform:${NC} $PLATFORM_DETAIL"

    if [ "$PLATFORM" = "Mac" ]; then
        SHELL_NAME="$(basename "$SHELL")"
        echo -e "${BLUE}📊 Shell:${NC} $SHELL_NAME"
    fi
    echo ""
}

# Check function
# Parameters: tool_name, command_check, version_check, when_needed (week1|all|optional)
check_tool() {
    local tool_name="$1"
    local command_check="$2"
    local version_check="$3"
    local when_needed="$4"

    if eval "$command_check" &> /dev/null; then
        if [ -n "$version_check" ]; then
            VERSION=$(eval "$version_check" 2>&1 | head -n 1)
            echo -e "${GREEN}✅${NC} $tool_name: $VERSION"
        else
            echo -e "${GREEN}✅${NC} $tool_name: installed"
        fi
    else
        if [ "$when_needed" = "week1" ]; then
            echo -e "${RED}❌${NC} $tool_name: NOT FOUND ${YELLOW}(Week 1 required)${NC}"
            WEEK1_READY=false
            ALL_READY=false
        elif [ "$when_needed" = "all" ]; then
            echo -e "${RED}❌${NC} $tool_name: NOT FOUND ${BLUE}(Full course required)${NC}"
            ALL_READY=false
        else
            echo -e "${YELLOW}⚠️${NC}  $tool_name: NOT FOUND (optional)"
        fi
    fi
    return 0
}

# Start detection
detect_platform

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  1. ACCOUNTS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Azure Authentication
if command -v az &> /dev/null; then
    if az account show &> /dev/null; then
        AZURE_ACCOUNT=$(az account show --query "user.name" -o tsv 2>&1)
        AZURE_SUBSCRIPTION=$(az account show --query "name" -o tsv 2>&1)
        echo -e "${GREEN}✅${NC} Azure Account: Authenticated as $AZURE_ACCOUNT"
        echo -e "   Subscription: $AZURE_SUBSCRIPTION"
    else
        echo -e "${YELLOW}⚠️${NC}  Azure Account: NOT AUTHENTICATED (run: az login)"
        echo -e "   ${BLUE}→${NC} Authentication can be done later"
    fi
else
    echo -e "${RED}❌${NC} Azure Account: Cannot check (Azure CLI not installed) ${YELLOW}(Week 1 required)${NC}"
    WEEK1_READY=false
    ALL_READY=false
fi

# GitHub Authentication
if command -v gh &> /dev/null; then
    if gh auth status &> /dev/null; then
        GH_USER=$(gh api user --jq .login 2>&1)
        echo -e "${GREEN}✅${NC} GitHub Account: Authenticated as $GH_USER"
    else
        echo -e "${YELLOW}⚠️${NC}  GitHub Account: NOT AUTHENTICATED (run: gh auth login)"
        echo -e "   ${BLUE}→${NC} Authentication can be done later"
    fi
else
    echo -e "${RED}❌${NC} GitHub Account: Cannot check (GitHub CLI not installed) ${YELLOW}(Week 1 required)${NC}"
    WEEK1_READY=false
    ALL_READY=false
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  2. CLI TOOLS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Git
check_tool "Git" "command -v git" "git --version" "week1"

# Azure CLI
check_tool "Azure CLI" "command -v az" "az version --query '\"azure-cli\"' -o tsv 2>/dev/null || az --version | head -n 1" "week1"

# GitHub CLI
check_tool "GitHub CLI" "command -v gh" "gh --version | head -n 1" "week1"

# Bicep CLI
if command -v az &> /dev/null; then
    if az bicep version &> /dev/null; then
        BICEP_VERSION=$(az bicep version 2>&1 | grep -oE 'version [0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
        echo -e "${GREEN}✅${NC} Bicep CLI: $BICEP_VERSION"
    else
        echo -e "${RED}❌${NC} Bicep CLI: NOT INSTALLED (run: az bicep install) ${BLUE}(Full course required)${NC}"
        ALL_READY=false
    fi
else
    echo -e "${RED}❌${NC} Bicep CLI: Cannot check (Azure CLI not installed) ${BLUE}(Full course required)${NC}"
    ALL_READY=false
fi

# PostgreSQL Client
check_tool "PostgreSQL Client (psql)" "command -v psql" "psql --version" "all"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  3. DEVELOPMENT TOOLS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# VS Code
check_tool "VS Code" "command -v code" "code --version | head -n 1" "week1"

# Python 3.11+
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
    PYTHON_MAJOR=$(echo "$PYTHON_VERSION" | cut -d. -f1)
    PYTHON_MINOR=$(echo "$PYTHON_VERSION" | cut -d. -f2)

    if [ "$PYTHON_MAJOR" -ge 3 ] && [ "$PYTHON_MINOR" -ge 11 ]; then
        echo -e "${GREEN}✅${NC} Python: $PYTHON_VERSION (requires 3.11+)"
    else
        echo -e "${RED}❌${NC} Python: $PYTHON_VERSION (requires 3.11+) ${BLUE}(Full course required)${NC}"
        ALL_READY=false
    fi
else
    echo -e "${RED}❌${NC} Python 3.11+: NOT FOUND ${BLUE}(Full course required)${NC}"
    ALL_READY=false
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  4. AI TOOLS (RECOMMENDED)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Track if at least one AI CLI tool is found
AI_CLI_FOUND=false

# Node.js (needed for Gemini CLI via npm)
check_tool "Node.js" "command -v node" "node --version" "optional"

# AI CLI Tools
# Gemini CLI (free)
if command -v gemini &> /dev/null; then
    GEMINI_VERSION=$(gemini --version 2>/dev/null | head -n 1)
    echo -e "${GREEN}✅${NC} Gemini CLI: $GEMINI_VERSION ${BLUE}(free)${NC}"
    AI_CLI_FOUND=true
else
    echo -e "${YELLOW}⚠️${NC}  Gemini CLI: NOT FOUND (free option)"
fi

# Claude Code (paid)
if command -v claude &> /dev/null; then
    CLAUDE_VERSION=$(claude --version 2>/dev/null | head -n 1)
    echo -e "${GREEN}✅${NC} Claude Code: $CLAUDE_VERSION ${BLUE}(paid)${NC}"
    AI_CLI_FOUND=true
else
    echo -e "${YELLOW}⚠️${NC}  Claude Code: NOT FOUND (paid \$20/month)"
fi

# ChatGPT/OpenAI CLI (paid) - check multiple possible commands
if command -v chatgpt &> /dev/null; then
    CHATGPT_VERSION=$(chatgpt --version 2>/dev/null | head -n 1 || echo "installed")
    echo -e "${GREEN}✅${NC} ChatGPT CLI: $CHATGPT_VERSION ${BLUE}(paid)${NC}"
    AI_CLI_FOUND=true
elif command -v openai &> /dev/null; then
    OPENAI_VERSION=$(openai --version 2>/dev/null | head -n 1 || echo "installed")
    echo -e "${GREEN}✅${NC} OpenAI CLI: $OPENAI_VERSION ${BLUE}(paid)${NC}"
    AI_CLI_FOUND=true
else
    echo -e "${YELLOW}⚠️${NC}  ChatGPT/OpenAI CLI: NOT FOUND (paid \$20/month)"
fi

# Show recommendation if no AI CLI tools found
if [ "$AI_CLI_FOUND" = false ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Recommendation:${NC} Install at least one AI CLI tool"
    echo -e "   ${BLUE}→${NC} Free option: Gemini CLI (npm install -g @google/gemini-cli)"
    echo -e "   ${BLUE}→${NC} Paid options: Claude Code or ChatGPT CLI (\$20/month)"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  5. PLATFORM-SPECIFIC"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Windows-specific: Git Bash as default terminal in VS Code
if [ "$PLATFORM" = "Windows" ]; then
    VSCODE_SETTINGS="$APPDATA/Code/User/settings.json"
    if [ -f "$VSCODE_SETTINGS" ]; then
        if grep -q "Git Bash" "$VSCODE_SETTINGS" 2>/dev/null; then
            echo -e "${GREEN}✅${NC} Git Bash as VS Code default terminal"
        else
            echo -e "${YELLOW}⚠️${NC}  Git Bash NOT set as VS Code default terminal"
            echo -e "   ${BLUE}→${NC} Open VS Code → Settings → Terminal → Default Profile → Select 'Git Bash'"
        fi
    else
        echo -e "${YELLOW}⚠️${NC}  VS Code settings not found (run VS Code at least once)"
    fi
fi

# Mac-specific: Homebrew check (informational)
if [ "$PLATFORM" = "Mac" ]; then
    if command -v brew &> /dev/null; then
        BREW_VERSION=$(brew --version | head -n 1)
        echo -e "${GREEN}✅${NC} Homebrew: $BREW_VERSION"
    else
        echo -e "${YELLOW}⚠️${NC}  Homebrew: Not installed (recommended for Mac package management)"
        echo -e "   ${BLUE}→${NC} Install: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    fi
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FINAL VERDICT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Display Week 1 status
if [ "$WEEK1_READY" = true ]; then
    echo -e "${GREEN}✅ WEEK 1: OK${NC}"
else
    echo -e "${RED}❌ WEEK 1: NOT OK${NC}"
fi

# Display All (full course) status
if [ "$ALL_READY" = true ]; then
    echo -e "${GREEN}✅ ALL: OK${NC}"
else
    echo -e "${RED}❌ ALL: NOT OK${NC}"
fi

echo ""

# Detailed outcome
if [ "$ALL_READY" = true ]; then
    echo "🎉 You are fully prepared for the entire IPL25 course!"
    echo ""
    echo "Final pre-course steps:"
    echo "  1. Ensure Azure account has ${BLUE}pay-as-you-go${NC} billing configured"
    echo "  2. Authenticate with Azure: ${BLUE}az login${NC}"
    echo "  3. Authenticate with GitHub: ${BLUE}gh auth login${NC}"
    echo "  4. Set up billing alerts in Azure Portal (recommended)"
    echo ""
    echo "Installation summary:"
    echo "  ✅ Accounts: Azure, GitHub"
    echo "  ✅ CLI Tools: Git, Azure CLI, GitHub CLI, Bicep, PostgreSQL"
    echo "  ✅ Development: VS Code, Python 3.11+"
    if [ "$AI_CLI_FOUND" = true ]; then
        echo "  ✅ AI Tools: At least one AI CLI tool installed (recommended)"
    else
        echo "  ⚠️  AI Tools: No AI CLI tools found (recommended)"
    fi
    echo ""
    echo "See you on Day 1! 🚀"
    exit 0
elif [ "$WEEK1_READY" = true ]; then
    echo "⚠️  You are ready for Week 1, but missing tools for the full course."
    echo ""
    echo "Week 1 ready, but install these for later weeks:"
    echo "  • Tools marked with ${BLUE}(Full course required)${NC} above"
    if [ "$AI_CLI_FOUND" = false ]; then
        echo "  • At least one AI CLI tool (Gemini CLI recommended - free)"
    fi
    echo ""
    echo "You can start the course, but install missing tools before they're needed."
    echo ""
    echo "Installation guides:"
    echo "  • PC (Windows): course/onboarding/setup-guide-windows.md"
    echo "  • Mac (Intel): course/onboarding/setup-guide-mac.md"
    echo "  • Mac (ARM): course/onboarding/setup-guide-mac.md"
    exit 0
else
    echo "❌ You are NOT ready for Week 1."
    echo ""
    echo "Please install all missing tools marked with ${YELLOW}(Week 1 required)${NC} above."
    echo ""
    echo "Installation guides:"
    echo "  • PC (Windows): course/onboarding/setup-guide-windows.md"
    echo "  • Mac (Intel): course/onboarding/setup-guide-mac.md"
    echo "  • Mac (ARM): course/onboarding/setup-guide-mac.md"
    echo ""
    echo "After installation, re-run: ${BLUE}./verify-setup.sh${NC}"
    exit 1
fi
