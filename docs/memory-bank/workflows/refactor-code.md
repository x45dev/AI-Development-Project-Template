# Refactor Code

This workflow guides the AI agent in systematically refactoring existing code to improve its design, readability, maintainability, or performance without changing its external behavior.

## Process:

### 1. Understand the Refactoring Goal
*   **Action**: Clearly define the objective of the refactoring (e.g., improve readability, reduce complexity, extract a new component, optimize performance, adhere to a new standard).
*   **Action**: Identify the specific code section(s) to be refactored. Use `analyse-code` to identify areas that could benefit from refactoring (e.g., high complexity, duplication, tight coupling).

### 2. Establish a Safety Net
*   **Action**: **Crucial**: Ensure there is a robust set of tests covering the code to be refactored. If tests are insufficient, perform the `write-tests` workflow to create new tests that provide adequate coverage.
*   **Action**: Run all existing tests (`mise run test`) to ensure they pass *before* starting any refactoring. This establishes a baseline.

### 3. Plan the Refactoring Steps
*   **Action**: Break down the refactoring into small, incremental steps. Each step should be small enough that it can be easily verified.
*   **Action**: For each step, identify the specific changes to be made (e.g., rename variable, extract method, introduce class, simplify conditional).
*   **Action**: Consider the order of operations to minimize risk and facilitate verification.

### 4. Implement Refactoring Iteratively
*   **Action**: For each planned step:
    *   **Action**: Apply the code changes using `read_file`, `replace`, and `write_file` tools.
    *   **Action**: After each small change, immediately run the relevant tests (`mise run test <specific_test_file>`) to ensure no regressions have been introduced.
    *   **Action**: If tests fail, revert the last change, re-evaluate, and try again.
    *   **Action**: Ensure adherence to project coding standards (`docs/memory-bank/standards/`).
*   **Action**: Avoid making functional changes during refactoring. The external behavior of the code should remain unchanged.

### 5. Verify and Clean Up
*   **Action**: Once all refactoring steps are complete, run the full test suite (`mise run test`) to ensure everything still works as expected.
*   **Action**: Perform the `check` workflow to ensure code quality and consistency after refactoring.
*   **Action**: Perform the `clean` workflow to automatically fix any formatting or linting issues.
*   **Action**: Perform the `self-review` workflow to critically evaluate the refactored code for improvements in design, readability, and maintainability.

### 6. Document and Commit
*   **Action**: If the refactoring significantly changes the internal structure or design patterns, perform the `manage-documentation` workflow to update relevant documentation (e.g., `architecture.md`, `development.md`).
*   **Action**: Prepare a commit for the refactored code. Perform the `commits` workflow to generate a descriptive and conventional commit message, clearly stating that it is a refactoring and explaining the improvements made.

## Best Practices:
*   **Test First**: Never refactor without a solid test suite.
*   **Small Steps**: Refactor in tiny, verifiable increments.
*   **No New Features**: Avoid adding new functionality during refactoring.
*   **Continuous Verification**: Run tests frequently.
*   **Version Control**: Commit often, especially after successful small refactoring steps.
*   **Understand the Why**: Be clear about the benefits of the refactoring before starting.
