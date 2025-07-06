# Check

This workflow guides the AI agent in performing comprehensive code quality, security, and correctness checks across the codebase. It emphasizes identifying and resolving issues to maintain high code standards.

## Process:

### 1. Execute Project Checks
*   **Action**: Identify the project's primary check command. This is typically `mise run check` or a similar command defined in the project's `mise.toml` or `package.json`.
*   **Action**: Use `run_shell_command` to execute the project-specific check command (e.g., `mise run check`).
*   **Action**: Capture and analyze the output for errors, warnings, and failures.

### 2. Analyze and Prioritize Issues
*   **Action**: Review the output from the check command. Categorize issues by type (e.g., linting errors, type errors, test failures, security vulnerabilities, build errors).
*   **Action**: Prioritize issues for fixing based on severity and impact:
    1.  **Build-breaking errors**: Issues that prevent the project from compiling or running.
    2.  **Test failures**: Failing unit, integration, or end-to-end tests.
    3.  **Security vulnerabilities**: High-severity security findings.
    4.  **Type errors**: Issues identified by type checkers.
    5.  **Linting errors**: Code style and potential bug warnings.
    6.  **Warnings**: Non-critical issues that should still be addressed.

### 3. Fix Issues Iteratively
*   **Action**: For each identified issue, apply the appropriate remediation strategy:
    *   **For linting or formatting issues**: First, attempt to fix automatically using the `clean` workflow. If manual intervention is required, apply changes using `replace` or `write_file`.
    *   **For type errors**: Analyze the code using `read_file` and apply manual corrections to type annotations, function signatures, or data structures.
    *   **For test failures**: Debug the failing test and the associated code. This may involve using the `debug-code` workflow or performing a `five-whys` analysis to understand the root cause of the bug. Then, implement the fix and ensure the test passes.
    *   **For security vulnerabilities**: Analyze the reported vulnerability, identify the affected code, and apply necessary patches or code changes to mitigate the risk. This might involve updating dependencies or refactoring insecure code patterns.
    *   **For build errors**: Analyze the error messages, inspect relevant build configuration files, and correct syntax errors, missing dependencies, or incorrect paths.
*   **Action**: After each fix or set of related fixes, re-run the specific check that identified the issue, and then re-run the full `mise run check` command to verify the fix and ensure no new issues were introduced.

### 4. Final Verification
*   **Action**: Continue the process of fixing and re-checking until all checks pass with no errors or warnings.
*   **Action**: **Important**: Do not commit any code during this process until all checks pass. The goal is to ensure the codebase is in a clean and stable state.
*   **Action**: Do not change version numbers or make unrelated changes; focus solely on resolving the identified issues.

## Common Checks Include:
*   **Linting**: Code style and syntax errors (e.g., Ruff, ESLint, Clippy).
*   **Type Checking**: Static analysis for type consistency (e.g., MyPy, TypeScript, Sorbet).
*   **Unit/Integration/E2E Tests**: Verification of functionality.
*   **Security Scan**: Vulnerability detection (e.g., Bandit, Snyk, Dependabot).
*   **Code Formatting**: Consistency of code style (e.g., Black, Prettier, gofmt).
*   **Build Verification**: Compilation and packaging success.

## Best Practices:
*   **Systematic Approach**: Address issues in a structured, prioritized manner.
*   **Iterative Fixing**: Fix one issue or a small group of related issues at a time, then re-verify.
*   **Root Cause**: For persistent or complex issues, consider performing a `five-whys` analysis.
*   **Tool-Specific Knowledge**: Be familiar with the output and common fixes for each checking tool used in the project.