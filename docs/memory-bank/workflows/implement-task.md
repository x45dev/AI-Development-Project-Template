# Implement Task

This workflow guides the AI agent through the methodical implementation of a given task, emphasizing planning, execution, and self-verification.

## Process:

### 1. Understand and Plan
*   **Action**: Thoroughly read and understand the task requirements. If ambiguous, ask the user for clarification.
*   **Action**: If the task is complex, consider performing an `analyze-issue` workflow to create a detailed implementation specification.
*   **Action**: Break down the task into smaller, manageable sub-tasks or logical steps.
*   **Action**: Identify necessary files to modify or create. Use `glob` and `search_file_content` to locate relevant code sections.
*   **Action**: Plan the implementation approach, considering:
    *   Dependencies and constraints.
    *   Performance implications.
    *   Maintainability and scalability.
    *   Code reusability.
    *   Testing strategy.
*   **Action**: If applicable, propose the plan to the user for approval before proceeding with significant changes.

### 2. Implement Incrementally
*   **Action**: For each sub-task:
    *   **Action**: If new functionality is being added or a bug is being fixed, consider performing the `write-tests` workflow to create failing tests first (Test-Driven Development).
    *   **Action**: Implement the code changes using `read_file`, `replace`, and `write_file` tools.
    *   **Action**: Ensure adherence to project coding standards (refer to `docs/memory-bank/standards/`).
    *   **Action**: Add comments sparingly, focusing on *why* complex logic is implemented, not *what* it does.
    *   **Action**: Run local tests or relevant checks to verify the immediate change.

### 3. Self-Verification & Quality Assurance
*   **Action**: After implementing a significant portion or completing the task:
    *   **Action**: Perform the `check` workflow to run all relevant quality checks (linting, type checking, tests).
    *   **Action**: Address any errors or warnings reported by the `check` workflow.
    *   **Action**: Perform the `clean` workflow to automatically fix formatting and minor linting issues.
    *   **Action**: Perform the `self-review` workflow to critically evaluate the implemented code for correctness, efficiency, and adherence to best practices.
    *   **Action**: If the task involved a bug fix, ensure the original bug is no longer reproducible and that no new regressions have been introduced.

### 4. Documentation & Finalization
*   **Action**: If the task introduced new features, changed existing behavior, or requires updated usage instructions, perform the `manage-documentation` workflow to update relevant documentation.
*   **Action**: Prepare a commit for the changes. Perform the `commits` workflow to generate a descriptive and conventional commit message.
*   **Action**: Inform the user of the completion and readiness for review or further action.

## Best Practices:
*   **Iterate**: Implement in small, verifiable steps.
*   **Test Early, Test Often**: Leverage testing workflows throughout implementation.
*   **Consult Standards**: Always refer to `docs/memory-bank/standards/` for language-specific guidelines.
*   **Communicate**: Keep the user informed, especially for complex tasks or when encountering blockers.