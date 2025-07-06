# Workflows Overview

This directory contains a comprehensive set of workflows designed to guide and assist AI agents in various software development activities. These workflows are structured to ensure consistency, efficiency, and adherence to project standards.

## Philosophy

The workflows are built upon the following principles:

*   **Agent-Centric**: Instructions are phrased as direct commands and guidelines for the AI agent, leveraging its capabilities and available tools.
*   **Structured & Iterative**: Tasks are broken down into clear, actionable steps, promoting an iterative development approach with built-in verification.
*   **Tool-Agnostic (where possible)**: While specific tools are mentioned, the emphasis is on the *type* of action, with a preference for `mise run <task>` for project-specific commands.
*   **Self-Verification**: Workflows integrate steps for the agent to verify its own work (e.g., running tests, linters, checks).
*   **Interconnected**: Workflows are designed to be modular and can call upon each other, forming a cohesive development process.

## How to Use These Workflows

When faced with a task, the AI agent should:

1.  **Identify the primary workflow**: Determine which top-level workflow best addresses the user's request (e.g., `implement-task`, `bugfix`, `manage-documentation`).
2.  **Follow the steps sequentially**: Execute each step within the chosen workflow.
3.  **Utilize sub-workflows**: When a step requires a more detailed or specialized action, refer to the relevant sub-workflow (e.g., `implement-task` might call `write-tests`, then `clean`, then `check`, then `commits`).
4.  **Leverage available tools**: Explicitly use `read_file`, `write_file`, `run_shell_command`, `glob`, `search_file_content`, and other available tools as instructed within the workflows.
5.  **Communicate with the user**: For clarification, approval, or reporting progress/issues.

## Workflow Categories

The workflows are organized into the following categories:

*   **Foundational**: Core setup and context management for the agent.
*   **Development Lifecycle**: Workflows for implementing features, fixing bugs, and managing code changes.
*   **Quality Assurance**: Workflows for ensuring code quality, consistency, and correctness.
*   **Problem Solving & Planning**: Workflows for analyzing issues and strategizing solutions.
*   **Documentation**: Workflows for creating and maintaining project documentation.
*   **Introspection & Review**: Workflows for analyzing code and reviewing changes.

## List of Workflows

*   `00-overview.md` (This file)
*   `agent-onboarding.md` (Formerly `context-prime.md`)
*   `implement-task.md`
*   `bugfix.md`
*   `commits.md`
*   `clean.md`
*   `check.md`
*   `analyse-code.md`
*   `five-whys.md`
*   `analyze-issue.md`
*   `manage-documentation.md` (Consolidated from `update-docs.md` and `create-docs.md`)
*   `write-tests.md` (New)
*   `refactor-code.md` (New)
*   `self-review.md` (New)
*   `debug-code.md` (New)
