# VS Code Workspace Configuration

This directory contains VS Code workspace configuration files for the IPL25 course.

## Files

### `extensions.json`

Recommended VS Code extensions for IPL25 students.

**What it does:**
- When students open this project in VS Code, they'll be prompted to install recommended extensions
- Ensures everyone has the same development environment
- Lists unwanted extensions (like SQLite tools, since we use PostgreSQL only)

**Extensions included:**

**Essential:**
- Python development (Python, Pylance)
- PostgreSQL database (SQLTools + PostgreSQL driver)
- Azure & Bicep (Bicep, Azure Account, Azure Resources)
- Remote development (Remote - SSH for connecting to VMs)
- Git (GitLens)
- Configuration (YAML, Bash IDE)

**Optional:**
- Markdown editing
- EditorConfig

**How students use this:**

1. Open the project folder in VS Code
2. VS Code will show: "This workspace has extension recommendations"
3. Click "Install All" to install recommended extensions

**Updating this file:**

If you add new recommended extensions, update:
1. This `extensions.json` file
2. The setup guide: `SETUP-GUIDE.md` (VS Code Extensions section)

**Note:** This file is included in the student onboarding repository.
