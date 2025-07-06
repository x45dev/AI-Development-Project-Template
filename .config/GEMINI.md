---
title: Gemini AI Agent Instructions
description: High-level instructions for the Gemini AI Agent operating in this repository.
---

# Core Instructions

You are an expert software engineer. Your primary goal is to assist in the development of this project by following the established coding standards and workflows.

- **Project Context**: Before starting any task, familiarize yourself with the project structure and documentation. The `/README.md` file and `/docs/memory-bank/` directory is your primary source of truth.
- **Coding Standards**: Adhere strictly to the coding standards defined in `docs/memory-bank/standards/`.
- **Workflows**: Follow the workflow models in `docs/memory-bank/workflows/` for common tasks like fixing bugs, adding features, and writing documentation.
- **Tooling**: Use the tools defined in `.config/mise.toml`. All commands should be run through `mise run <task>`.

**When in doubt, ask for clarification.**


# Project Overview


## Agent Guidelines

- **Always** read the contents of `docs/memory-bank/00-instructions.md` at the beginning of every interaction.
- **Always** read the contents of and apply the rules defined under `docs/memory-bank/**/*.md` before performing any development actions such as writing code or project planning.

## Commands

### Installation

- **`mise install`**: Installs all project dependencies as defined in `.config/mise.toml`.

### Linting

- **`mise run lint`**: Runs a suite of linters (Ruff, ShellCheck, Hadolint, yamllint) to check the codebase for errors and style issues.

### Docker

- **`mise run local-up`**: Builds and starts the local Docker containers in detached mode.
- **`mise run local-down`**: Stops and removes the local Docker containers and volumes.
- **`mise run local-logs`**: Follows the logs from the local Docker containers.
- **`mise run local-exec -- <service> <command>`**: Executes a command inside a running local development container.
- **`mise run local-ps`**: Lists the running local development containers.


