# Write Tests

This workflow guides the AI agent in writing effective and comprehensive tests for new or existing code, adhering to project testing standards.

## Process:

### 1. Understand Testing Requirements
*   **Action**: Identify the type of test required (unit, integration, end-to-end) based on the functionality being tested and the project's testing strategy.
*   **Action**: Read `docs/memory-bank/standards/python/testing.md` (or relevant language-specific testing standards) to understand conventions, frameworks, and best practices.
*   **Action**: If testing an existing bug, ensure you have a clear reproduction path and ideally, a failing test case from the `bugfix` workflow.

### 2. Identify Test Scope and Location
*   **Action**: Determine which part of the codebase needs testing. Use `read_file` to understand the code's functionality, inputs, outputs, and edge cases.
*   **Action**: Locate the appropriate directory for the new test file. Use `glob` to find existing test files (e.g., `**/*.test.js`, `test_*.py`) to understand the project's test file organization.
*   **Action**: Create a new test file with a descriptive name (e.g., `test_my_feature.py`, `myComponent.test.tsx`).

### 3. Design Test Cases
*   **Action**: For each function, method, or component being tested, identify:
    *   **Happy Path**: Normal, expected inputs and outputs.
    *   **Edge Cases**: Boundary conditions, empty inputs, null values, maximum/minimum values.
    *   **Error Conditions**: Invalid inputs, expected exceptions, error handling paths.
    *   **Side Effects**: Verify any changes to state or external systems.
*   **Action**: For unit tests, mock external dependencies to isolate the code under test.

### 4. Implement Tests
*   **Action**: Write the test code using the project's chosen testing framework (e.g., Pytest, Jest, Vitest, JUnit).
*   **Action**: Use `write_file` to create the new test file or `replace` to add new test cases to an existing file.
*   **Action**: Ensure tests are:
    *   **Atomic**: Each test case focuses on a single aspect of functionality.
    *   **Readable**: Clear and easy to understand.
    *   **Maintainable**: Easy to update as the code evolves.
    *   **Fast**: Run quickly to facilitate rapid feedback.
*   **Action**: Include assertions that clearly verify the expected behavior.

### 5. Run and Verify Tests
*   **Action**: Use `run_shell_command` with the appropriate `mise run test` command (or specific test command for the new test file) to execute the newly written tests.
*   **Action**: Ensure all new tests pass. If a test fails, debug the test code or the application code until it passes.
*   **Action**: After new tests pass, run the full test suite (`mise run test`) to ensure no existing functionality has been inadvertently broken.
*   **Action**: If applicable, check test coverage to ensure the new tests adequately cover the intended code paths.

### 6. Integrate with Development Workflow
*   **Action**: If the tests are part of a new feature or bug fix, ensure they are included in the subsequent `commits` workflow.
*   **Action**: If the tests reveal issues, consider initiating the `bugfix` workflow.

## Best Practices:
*   **TDD (Test-Driven Development)**: For new features or bug fixes, write failing tests *before* writing the implementation code.
*   **Clear Assertions**: Make it obvious what each test is verifying.
*   **Meaningful Names**: Name test files and test functions descriptively.
*   **Avoid Duplication**: Reuse test setup logic where appropriate.
*   **Maintainability**: Keep tests focused and independent.
