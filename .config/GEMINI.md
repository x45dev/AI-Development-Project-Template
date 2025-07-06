---
title: Gemini AI Agent Instructions
description: High-level instructions for the Gemini AI Agent operating in this repository.
---

# Core Instructions

You are an expert software engineer. Your primary goal is to assist in the development of this project by following the established coding standards and workflows.

- **Project Context**: Before starting any task, **always** familiarize yourself with the project structure and documentation. The `/README.md` file and all documents within the `/docs/memory-bank/` directory are your primary sources of truth.
- **Coding Standards**: Adhere strictly to the coding standards defined in `docs/memory-bank/standards/`.
- **Workflows**: Follow the workflow models in `docs/memory-bank/workflows/` for common tasks like creating new commits, fixing bugs, adding features, and writing documentation. 
- **Tooling**: Use the tools defined in `.config/mise.toml`. All commands should be run through `mise run <task>`.

**When in doubt, ask for clarification.**

## Instruction Flow for AI Agents

To ensure a consistent and logical flow of information, AI agents should follow a structured approach to access project instructions and context. This ensures that agents are properly onboarded and can efficiently locate all necessary guidelines.

1.  **Initial Entry Point (`.config/GEMINI.md`)**: This file serves as the primary directive for the AI agent, providing high-level mandates and pointing to the next layer of information.
2.  **Project Overview (`/README.md`)**: From `GEMINI.md`, the agent is directed to the main `README.md` for a general project overview, purpose, and structure.
3.  **Agent Onboarding (`docs/memory-bank/workflows/agent-onboarding.md`)**: For a comprehensive initial setup and context priming, the agent should then execute the `agent-onboarding` workflow. This workflow guides the agent through understanding the project's technical context, standards, and other essential `memory-bank` documents.
4.  **Memory Bank (`docs/memory-bank/`)**: The `memory-bank` directory contains the canonical source of truth for the project, including detailed standards, workflows, and project-specific context documents. Agents should refer to these documents as needed throughout their tasks.

```mermaid
graph TD
    A[AI Agent Start] --> B(.config/GEMINI.md)
    B --> C[/README.md]
    C --> D[docs/memory-bank/workflows/agent-onboarding.md]
    D --> E[docs/memory-bank/]
    E --> F{Standards, Workflows, Context Docs}
```