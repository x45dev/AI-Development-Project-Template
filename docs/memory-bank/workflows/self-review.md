# Self-Review

This workflow guides the AI agent in performing a critical self-review of its own code changes, ensuring quality, adherence to standards, and alignment with the task requirements before presenting to the user or committing.

## Process:

### 1. Understand the Context of Changes
*   **Action**: Recall the original task or problem statement that led to these code changes.
*   **Action**: Review the implementation plan (if one was created, e.g., from `analyze-issue` workflow).
*   **Action**: Use `run_shell_command` with `git diff` to see all modifications made since the last commit or the start of the current task.

### 2. Code Quality and Standards Check
*   **Action**: **Readability**: Is the code easy to understand? Are variable and function names clear and descriptive? Is the logic straightforward?
*   **Action**: **Maintainability**: Could another developer (or AI agent) easily understand and modify this code in the future?
*   **Action**: **Adherence to Standards**: Refer to `docs/memory-bank/standards/` for relevant language-specific and general coding standards.
    *   **Action**: Check for consistent formatting, indentation, and naming conventions.
    *   **Action**: Ensure comments (if any) explain *why* complex logic exists, not *what* the code does.
*   **Action**: **Complexity**: Are there overly complex functions or classes? Could they be simplified or broken down? (Consider `analyse-code` for deeper analysis if needed).
*   **Action**: **Duplication**: Is there any repeated code that could be abstracted or reused?
*   **Action**: **Error Handling**: Are potential errors (e.g., invalid inputs, network failures) handled gracefully? Are error messages clear and informative?
*   **Action**: **Performance**: Are there any obvious performance bottlenecks or inefficient algorithms? (Consider `analyse-code` for deeper analysis if needed).

### 3. Functional Correctness Check
*   **Action**: **Completeness**: Does the code fully address all aspects of the original task or bug?
*   **Action**: **Correctness**: Does the code produce the expected output for all identified test cases (happy path, edge cases, error conditions)?
*   **Action**: **Edge Cases**: Have all known edge cases been considered and handled?
*   **Action**: **Side Effects**: Does the code have any unintended side effects on other parts of the system?
*   **Action**: **Security**: Are there any obvious security vulnerabilities introduced (e.g., improper input validation, hardcoded credentials)?

### 4. Test Verification
*   **Action**: Ensure all relevant tests pass (`mise run test`).
*   **Action**: If new tests were written, do they adequately cover the new or modified functionality? (Consider test coverage reports if available).
*   **Action**: If a bug was fixed, ensure the regression test (written during `bugfix` workflow) now passes and the bug is no longer reproducible.

### 5. Documentation Review
*   **Action**: If the changes introduce new features, modify existing behavior, or require updated usage instructions, ensure that relevant documentation has been updated (e.g., by performing the `manage-documentation` workflow).

### 6. Final Polish
*   **Action**: Run the `clean` workflow to apply any final automated formatting or linting fixes.
*   **Action**: Review the `git diff` one last time to catch any overlooked issues.

## Best Practices for Agents:
*   **Objective Stance**: Try to review the code as if another agent or human wrote it.
*   **Checklist Approach**: Systematically go through each point in this workflow.
*   **Small Chunks**: Review changes in small, manageable increments if possible.
*   **Contextual Awareness**: Always keep the original task and project standards in mind.
*   **Don't Rush**: Take the necessary time to thoroughly review the changes.
