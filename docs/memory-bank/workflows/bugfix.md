# Bug Fix

This workflow guides the AI agent through a structured process for identifying, analyzing, fixing, and verifying bugs.

## Process:

### 1. Understand and Reproduce
*   **Action**: Thoroughly read the bug report or issue description. If unclear, ask the user for clarification.
*   **Action**: Attempt to reproduce the bug. Document the exact steps to reproduce the issue.
*   **Action**: If reproduction is difficult or inconsistent, use `analyse-code` to inspect relevant code paths and `debug-code` to step through execution.

### 2. Analyze Root Cause
*   **Action**: Once the bug is reproducible, perform the `five-whys` workflow to identify the underlying root cause, not just the symptom.
*   **Action**: If the bug requires a more formal approach or involves multiple components, perform the `analyze-issue` workflow to create a detailed implementation specification for the fix.
*   **Action**: Identify the exact location(s) in the codebase where the fix needs to be applied. Use `search_file_content` and `read_file` to pinpoint relevant code.

### 3. Implement the Fix
*   **Action**: Before implementing, perform the `write-tests` workflow to create a new failing test case that specifically demonstrates the bug. This will serve as a regression test.
*   **Action**: Implement the code changes to fix the bug using `read_file`, `replace`, and `write_file` tools.
*   **Action**: Ensure the newly written test now passes.
*   **Action**: Run the full test suite (`mise run test` or equivalent) to ensure no regressions have been introduced.

### 4. Verify and Finalize
*   **Action**: Perform the `check` workflow to ensure code quality and consistency after the fix.
*   **Action**: Perform the `clean` workflow to automatically fix any formatting or linting issues.
*   **Action**: Perform the `self-review` workflow to critically evaluate the fix for correctness, efficiency, and adherence to best practices.
*   **Action**: If the bug fix alters existing behavior or requires updated usage instructions, perform the `manage-documentation` workflow to update relevant documentation.
*   **Action**: Prepare a commit for the changes. Perform the `commits` workflow to generate a descriptive and conventional commit message, referencing the bug issue.
*   **Action**: Inform the user of the completed fix and its verification.

## Best Practices:
*   **Reproduce First**: Never attempt a fix without a clear reproduction path.
*   **Test-Driven Fixes**: Always write a failing test before implementing the fix.
*   **Root Cause Analysis**: Address the underlying problem, not just the symptom.
*   **Regression Prevention**: Ensure the fix doesn't introduce new issues and that the bug won't reappear.
*   **Atomic Changes**: Keep the fix focused on the specific bug.