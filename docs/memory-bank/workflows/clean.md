# Clean

This workflow guides the AI agent in automatically and manually fixing code formatting and quality issues across the codebase to ensure adherence to project standards.

## Process:

### 1. Automated Formatting and Linting
*   **Action**: Identify the project's primary language(s) and associated formatting/linting tools (e.g., Ruff for Python, Prettier/ESLint for JavaScript/TypeScript, `cargo fmt`/`clippy` for Rust).
*   **Action**: Prioritize running automated formatters first, as they often resolve many issues that linters would flag.
*   **Action**: Use `run_shell_command` with the appropriate `mise run <task>` command for automated fixes (e.g., `mise run format`, `mise run lint-fix`).
    *   **Python Projects**: `mise run ruff-format` (for formatting and import sorting), `mise run ruff-fix` (for linting fixes).
    *   **JavaScript/TypeScript Projects**: `mise run prettier-fix` (for formatting), `mise run eslint-fix` (for linting fixes).
    *   **General**: If a `mise run clean` task exists, execute that first.

### 2. Type Checking
*   **Action**: After automated formatting and linting, run type checking tools to identify type-related errors.
*   **Action**: Use `run_shell_command` with the appropriate `mise run <task>` command (e.g., `mise run ty-check` for Python, `mise run tsc-check` for TypeScript).
*   **Action**: Analyze the output for type errors. These often require manual intervention.

### 3. Manual Fixes and Review
*   **Action**: Review the output from linting and type checking tools for any remaining errors or warnings that could not be fixed automatically.
*   **Action**: For each identified issue:
    *   **Action**: Locate the problematic code using `read_file` and the provided line numbers/file paths.
    *   **Action**: Apply manual corrections using `replace` or `write_file` to resolve the issue, ensuring adherence to the relevant coding standards (`docs/memory-bank/standards/`).
    *   **Action**: Common manual fixes include:
        *   Resolving import order conflicts (if not handled by formatter).
        *   Adjusting line length violations that cannot be auto-wrapped.
        *   Removing unused imports/variables (if not auto-removed).
        *   Adding or correcting type annotations.
        *   Implementing missing return types.
        *   Ensuring consistent quotes/semicolons.
        *   Addressing complex logical errors flagged by linters.
*   **Action**: After making manual changes, re-run the automated formatting and linting tools, followed by type checking, to ensure no new issues were introduced and all previous issues are resolved.

### 4. Verification
*   **Action**: Once all automated and manual fixes are applied, perform the `check` workflow to ensure all code quality and security checks pass with no errors or warnings.
*   **Action**: Review the changes made before proceeding to commit. Use `run_shell_command` with `git diff` to inspect all modifications.

## Best Practices:
*   **Iterative Fixing**: Address issues in small batches, re-running checks frequently.
*   **Prioritize**: Fix build-breaking errors and critical linting issues first.
*   **Understand the Why**: For manual fixes, understand *why* the tool flagged the issue to prevent recurrence.
*   **Consult Standards**: Always refer to `docs/memory-bank/standards/` for language-specific guidelines and style conventions.