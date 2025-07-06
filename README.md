# Project Title

A brief description of the project.

## Table of Contents

- [About The Project](#about)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](./docs/CONTRIBUTING.md)
- [License](./docs/LICENSE)
- [Changelog](./docs/CHANGELOG.md)
- [Memory Bank](./docs/memory-bank/README.md)

# About

## Project Overview
This project is a template for developing applications using AI Agents, Model Context Protocol (MCP) servers, and LLMs using a structured planning and task management framework.

### General
- A deterministic development environment is established with DevContainers and Mise.
- Secrets are managed using securely [SOPS](https://github.com/getsops/sops) (Secrets Operator) and [AGE](https://github.com/FiloSottile/age) (Actually Good Encryption).
- The project follows the clean root workspace convention, with dotfiles located in the `.config/` directory where possible.

### Agentic Development Framework

This project uses an integrated, three-phase framework to develop and apply core planning documents, creating a structured project context to support a reliable and scalable agentic development environment.

The framework is supported by three essential pillars:

* **Ideation & Scoping (AI-Product-Development-Toolkit):** This pillar uses a guided, Socratic method to transform raw ideas into a rich set of initial, human-readable specification documents.
* **Long-Term Memory & Context (Memory Bank):** This pillar establishes a persistent, structured, and holistic understanding of the project's purpose, architecture, and technical patterns. It serves as the canonical source of truth, combating the statelessness of AI models.
* **Execution & State Management (Task-Master):** This pillar manages the low-level "how" of development. It intelligently parses a comprehensive, narrative project plan to create and track a concrete, sequential action plan.

The three phases of the workflow are:

* **Phase 1: Project Initiation & Knowledge Structuring**
    * **Action**: Engage in a guided conversation with an AI agent using prompts from the **AI-Product-Development-Toolkit** to generate initial narrative documents (`PRD.md`, `MVP-Concept.md`, etc.).
    * **Action**: Synthesize the outputs from the previous step to populate the structured markdown files within the `/docs/memory-bank/` directory. This establishes the project's "source of truth."
    * **Output**: A set of initial planning documents and a fully populated `/docs/memory-bank/` directory containing the standard Memory Bank files (`projectBrief.md`, `techContext.md`, etc.).

* **Phase 2: Task Generation and Planning**
    * **Action**: Author a single, comprehensive, and narrative **Project Requirements Document** (`/docs/prd.md`). This document is written in prose and synthesized from the structured knowledge in the Memory Bank.
    * **Action**: Instruct your AI agent to use Task-Master to parse the narrative `prd.md`. Task-Master's LLM will intelligently interpret the document to generate a detailed project plan.
    * **Output**: A `tasks.json` file in the `.taskmaster` directory, containing a structured list of tasks, dependencies, and priorities. Individual task files are generated in the `/tasks/` directory.

* **Phase 3: Symbiotic Development & Iteration**
    * **Action**: Execute the development loop:
        1.  **Select Task**: Use `task-master next` to identify the next task.
        2.  **Implement with Context**: Instruct the agent to complete the task, referencing the specific task file and the holistic context within the `/docs/memory-bank/`.
        3.  **Update Task State**: Mark the task as complete using `task-master update --id=<id> --status=done`.
        4.  **Update Long-Term Memory**: Critically, update the Memory Bank (`activeContext.md`, `progress.md`, `techContext.md`, etc.) with any new decisions, patterns, or technologies introduced during the task. This keeps the project's "soul" in sync with the codebase.

## Project Structure
```
/
├── .aiignore
├── .dockerignore
├── .editorconfig
├── .gitignore
├── .pre-commit-config.yaml
├── .yamllint.yaml
├── docker-compose.yml
├── README.md
├── .config/
│   ├── .env
│   ├── .env.sops.example.yaml
│   ├── .env.sops.yaml
│   ├── cz.toml
│   ├── GEMINI.md
│   ├── lefthook.yml
│   ├── mise.toml
│   └── sops.yaml
├── .devcontainer/
│   └── devcontainer.json
├── .git/...
├── .github/
│   └── workflows/
│       └── ci.yaml
├── .ruff_cache/
│   └── 0.12.2/...
├── .venv/
│   ├── bin/...
│   └── lib/...
├── .vscode/
│   └── mcp.json
├── docs/
│   ├── CHANGELOG.md
│   ├── CONTRIBUTING.md
│   ├── LICENSE
│   ├── getting-started/
│   │   ├── fabric_create-memory-bank.md
│   │   ├── memory-bank-prd.md
│   │   ├── setup.md
│   │   └── planning-framework/
│   │       ├── 00-overview.md
│   │       └── 01-step-by-step-guide.md
│   └── memory-bank/
│       ├── 00-instructions.md
│       ├── activeContext.md
│       ├── projectBrief.md
│       ├── productContext.md
│       ├── techContext.md
│       ├── systemPatterns.md
│       ├── progress.md
│       ├── standards/
│       │   ├── README.md
│       │   ├── astro/
│       │   │   ├── htmx.md
│       │   │   ├── project-setup.md
│       │   │   └── tailwindcss.md
│       │   ├── bash/
│       │   │   └── style-guide.md
│       │   ├── docker/
│       │   │   └── best-practices.md
│       │   ├── general/
│       │   │   ├── code-style.md
│       │   │   ├── commenting.md
│       │   │   ├── conventional-commits.md
│       │   │   ├── database.md
│       │   │   ├── git-workflow.md
│       │   │   └── naming-conventions.md
│       │   └── python/
│       │       ├── dependencies.md
│       │       ├── deployment.md
│       │       ├── development-workflow.md
│       │       ├── documentation.md
│       │       ├── error-handling.md
│       │       ├── fastapi.md
│       │       ├── performance.md
│       │       ├── project-setup.md
│       │       ├── pydantic.md
│       │       ├── security.md
│       │       ├── testing.md
│       │       └── type-hinting.md
│       └── workflows/
│           ├── analyse-code.md
│           ├── analyze-issue.md
│           ├── bugfix.md
│           ├── check.md
│           ├── clean.md
│           ├── commits.md
│           ├── context-prime.md
│           ├── create-docs.md
│           ├── five-whys.md
│           ├── implement-task.md
│           └── update-docs.md
├── infra/
│   └── kubernetes/
│       └── .gitkeep
├── scripts/
│   ├── setup.sh
│   └── test.sh
└── services/
    ├── backend/
    │   ├── Dockerfile
    │   ├── pyproject.toml
    │   └── src/
    │       └── .gitkeep
    └── frontend/
        ├── Dockerfile
        ├── package.json
        └── src/
            └── .gitkeep
```

# Getting Started
## Environment Setup
- Launch DevContainer
- Validate environment 
    - ensure that the project directory is mounted
    - ensure that Gemini CLI is installed, authenticated, and that authentication is persisted across container restarts
    - ensure that Mise is installed, trusted and activated (including installing Mise tools)
    - ensure that an AGE key is accessible to SOPS/Mise; that sensitive information is encrypted in `/.config/.env.sops.yaml`; and that Mise can successfully access the information via SOPS (run `mise run decrypt` task to print to STDOUT)
- Complete documentation generation process as specified in `/docs/getting-started/planning-framework/01-step-by-step-guide.md`
- Start the MCP server(s) via Mise/Docker Compose
- Code!

# Usage
FIXME (@gemini)

# Roadmap
FIXME (@gemini)
