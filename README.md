# Project Title

A brief description of the project.

## Table of Contents

- [About The Project](#about-the-project)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](./docs/CONTRIBUTING.md)
- [License](./docs/LICENSE)
- [Changelog](./docs/CHANGELOG.md)
- [Memory Bank](./docs/memory-bank/README.md)

# About The Project

## Project Overview
This project is a template for developing applications using AI Agents, Model Context Protocol (MCP) servers, and LLMs. It uses DevContainers and `mise` to manage the project environment, including development applications and secrets management.

### General

- The project follows the clean root workspace convention, with dotfiles located in the `.config/` directory where possible.
- Secrets are managed using `sops` and `age`.
- The project uses `fabric` for creating memory banks and PRDs.


## Project Structure
```
/
├── .config/
│   ├── .env                # Local environment variables (gitignored)
│   ├── .env.sops.yaml      # Encrypted environment variables for production/staging
│   ├── GEMINI.md           # High-level instructions for the Gemini AI Agent
│   ├── mise.toml           # Project-specific tool configuration for mise
│   └── sops.yaml           # SOPS configuration for secret encryption
├── .devcontainer/
│   └── devcontainer.json   # Dev container configuration for a consistent environment
├── .vscode/
│   └── settings.json       # VSCode workspace settings
├── docs/
│   ├── CHANGELOG.md
│   ├── CONTRIBUTING.md
│   ├── LICENSE
│   ├── README.md
│   └── memory-bank/
│       ├── active-context.md
│       ├── project-overview.md
│       ├── standards/      # Coding standards for various languages
│       │   ├── astro/
│       │   ├── bash/
│       │   ├── docker/
│       │   ├── general/
│       │   └── python/
│       └── workflows/      # AI agent workflow models
│           ├── analyze-issue.md
│           ├── bugfix.md
│           └── ...
├── services/
│   ├── backend/            # Example Python/FastAPI service
│   │   ├── Dockerfile
│   │   ├── pyproject.toml
│   │   └── src/
│   └── frontend/           # Example Astro/TailwindCSS service
│       ├── Dockerfile
│       ├── package.json
│       └── src/
├── infra/
│   └── kubernetes/         # Kubernetes manifests
│       └── ...
├── scripts/
│   ├── setup.sh            # Project setup script
│   └── test.sh             # Script to run all project tests
├── .dockerignore
├── .gitignore
├── docker-compose.yml
└── README.md               # Main project README with links to docs/
```
