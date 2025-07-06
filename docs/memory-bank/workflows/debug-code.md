# Debug Code

This workflow guides the AI agent in systematically debugging code to identify the root cause of issues and verify fixes.

## Process:

### 1. Understand the Problem
*   **Action**: Read the error message, bug report, or problem description carefully. If available, review logs or stack traces.
*   **Action**: Attempt to reproduce the issue consistently. Document the exact steps that lead to the problem.
*   **Action**: If the problem is intermittent or hard to reproduce, identify conditions under which it is more likely to occur.

### 2. Isolate the Problem Area
*   **Action**: Based on the error message, stack trace, or reproduction steps, narrow down the potential code sections responsible for the issue. Use `search_file_content` to find relevant function calls, variable usages, or error messages.
*   **Action**: Use `read_file` to inspect the code in the suspected area. Look for:
    *   Incorrect logic or algorithms.
    *   Improper handling of edge cases (e.g., null values, empty inputs, boundary conditions).
    *   Race conditions or concurrency issues.
    *   Incorrect API usage or external library interactions.
    *   Off-by-one errors, type mismatches, or other common programming mistakes.

### 3. Formulate Hypotheses
*   **Action**: Based on your understanding and code inspection, formulate one or more hypotheses about the cause of the problem.
*   **Action**: For each hypothesis, consider what evidence would confirm or deny it.

### 4. Gather Evidence (Debugging Techniques)
*   **Action**: Choose the most appropriate debugging technique to test your hypotheses:
    *   **Print Statements/Logging**: Insert `print` statements or logging calls into the code to inspect variable values, execution flow, and function inputs/outputs at various points. Use `replace` to insert these, and `run_shell_command` to execute the code and capture output.
    *   **Interactive Debugger (Conceptual)**: While direct interactive debugging is not available, simulate its logic by:
        *   **Action**: Identifying key breakpoints (lines of code where you want to inspect state).
        *   **Action**: Using `print` statements before and after these conceptual breakpoints to capture the state of relevant variables.
        *   **Action**: Iteratively adding/removing print statements to trace the execution path and data flow.
    *   **Test Cases**: If a specific input causes the bug, write a minimal test case that reproduces the issue. This can help isolate the problem and serve as a regression test later.
    *   **Code Review**: Perform a detailed `self-review` or `analyse-code` on the suspected section, looking for subtle errors.
    *   **Version Control History**: Use `run_shell_command` with `git blame` or `git log -p` to see recent changes to the problematic code, which might reveal the introduction of the bug.

### 5. Analyze Evidence and Identify Root Cause
*   **Action**: Review the output from print statements, logs, or test failures. Compare the actual behavior with the expected behavior.
*   **Action**: Confirm or deny your hypotheses based on the evidence.
*   **Action**: Once the root cause is identified, consider performing a `five-whys` analysis to ensure you understand the deepest underlying reason.

### 6. Implement and Verify Fix
*   **Action**: Implement the necessary code changes to fix the identified bug using `read_file`, `replace`, and `write_file`.
*   **Action**: Remove all temporary print statements or debugging code.
*   **Action**: Run the specific test case that reproduced the bug to ensure it now passes.
*   **Action**: Run the full test suite (`mise run test`) to ensure no new regressions have been introduced.
*   **Action**: Perform the `check` workflow to ensure code quality and consistency.
*   **Action**: Perform the `self-review` workflow to critically evaluate the fix.

## Best Practices:
*   **Systematic Approach**: Avoid random changes. Follow a logical process.
*   **Small Changes**: Introduce debugging statements incrementally.
*   **Isolate**: Try to narrow down the problem to the smallest possible code segment.
*   **Hypothesize**: Always have a theory about what's wrong before trying to fix it.
*   **Verify**: Ensure the fix actually solves the problem and doesn't introduce new ones.
*   **Document**: If the debugging process reveals complex insights, consider updating relevant documentation.
