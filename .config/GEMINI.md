# Gemini Project Configuration

This file provides context for the Gemini AI code assistant to understand the project structure, commands, and conventions.

For detailed setup and usage instructions, please see the [README.md](../README.md) file.

## Project Overview

This project is a template for developing applications using AI Agents, Model Context Protocol (MCP) servers, and LLMs. It uses `mise` to manage the project environment, including development applications and secrets management.

## General

- The project follows the clean root workspace convention, with dotfiles located in the `.config/` directory where possible.
- Secrets are managed using `sops` and `age`.
- The project uses `fabric` for creating memory banks and PRDs.

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

## File Structure

- **`.config/`**: Contains project configuration files, including `mise.toml` and this `GEMINI.md` file.
- **`.github/`**: Contains GitHub Actions workflows for CI/CD.
- **`docs/`**: Contains project documentation.
- **`scripts/`**: Contains shell scripts for various tasks.
- **`backend/`**: Contains the backend application code.
- **`frontend/`**: Contains the frontend application code.

## Dependencies

The project's dependencies are managed by `mise` and are defined in the `.config/mise.toml` file. Key dependencies include:

- `python`
- `node`
- `go`
- `docker`
- `sops`
- `age`
- `uv`
- `ruff`
- `shellcheck`
- `hadolint`
- `yamllint`



