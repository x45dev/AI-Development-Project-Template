# Agent Onboarding

This workflow guides the AI agent through the initial process of understanding a new project or re-establishing context for an ongoing task. The goal is to build a comprehensive internal model of the project, its structure, and its requirements.

## Process:

1.  **Initial Project Overview**: Gain a high-level understanding.
    *   **Action**: Read `/README.md`.
    *   **Action**: Identify the project's primary purpose, key technologies, and main dependencies.
    *   **Action**: Read `/docs/memory-bank/00-instructions.md` and `/docs/memory-bank/projectBrief.md` for project-specific instructions and high-level vision.

2.  **AI-Specific Guidelines**: Understand how the agent should operate within this project.
    *   **Action**: Read `/.config/GEMINI.md` (or equivalent AI configuration file if present) for agent-specific instructions and constraints.
    *   **Action**: Read `/docs/memory-bank/activeContext.md` to understand the current task, blockers, and next steps.

3.  **Repository Structure & Conventions**: Map out the codebase layout.
    *   **Action**: Use `glob` with `**/*` and `list_directory` recursively to get a comprehensive list of files and directories, respecting `.gitignore` and `.aiignore`.
    *   **Action**: Identify main directories (e.g., `src`, `tests`, `docs`, `services`, `infra`) and their general purposes.
    *   **Action**: Note any obvious naming conventions or architectural patterns by inspecting file names and directory structures.

4.  **Configuration & Dependencies Review**: Understand the project's technical setup.
    *   **Action**: Read relevant package manager files (e.g., `package.json`, `pyproject.toml`, `Cargo.toml`, `build.gradle`) to identify declared dependencies.
    *   **Action**: Read build configuration files (e.g., `Makefile`, `webpack.config.js`, `Dockerfile`s) to understand how the project is built and run.
    *   **Action**: Read environment setup files (e.g., `.env`, `.env.sops.yaml`, `devcontainer.json`) to understand development environment requirements.
    *   **Action**: Read `/.config/mise.toml` to understand project-specific tool configurations and available `mise run` tasks.

5.  **Development & Testing Context**: Understand how to develop and verify changes.
    *   **Action**: Identify the testing framework(s) by inspecting `pyproject.toml`, `package.json`, or `Cargo.toml` for test-related dependencies, and by searching for common test file patterns (e.g., `test_*.py`, `*.test.js`, `*.spec.ts`) using `glob`.
    *   **Action**: Read `docs/memory-bank/standards/` for coding standards relevant to the project's languages and frameworks.
    *   **Action**: Read `docs/memory-bank/workflows/` for other relevant workflows.

## Output:

Upon completion of this workflow, the agent should possess a clear and actionable understanding of:

*   The project's overall goals, constraints, and current state.
*   Its technical architecture and key components.
*   The established development and testing workflows.
*   Project-specific coding standards and conventions.
*   How to effectively use available tools within the project context.
