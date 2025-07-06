# Code Analysis

This workflow guides the AI agent in performing in-depth code analysis using various introspection techniques and tools to gain a deeper understanding of the codebase, identify patterns, and uncover potential issues.

## Process:

### 1. Select Analysis Type
*   **Action**: Based on the user's request or the current task, determine the most relevant type of code analysis to perform from the menu below.

### 2. Execute Analysis and Gather Data
*   **Action**: For the selected analysis type, use the appropriate tools and techniques to gather relevant information. This will primarily involve:
    *   `read_file`: To inspect the content of specific files.
    *   `glob`: To discover files matching certain patterns (e.g., all `.py` files, all test files).
    *   `search_file_content`: To find specific patterns, function calls, or variable usages within files.
    *   `run_shell_command`: To execute project-specific analysis tools (e.g., `mise run lint`, `mise run test`, `git log`, `git blame`).
    *   Internal reasoning and pattern recognition based on the gathered data.

### 3. Interpret Findings and Identify Patterns
*   **Action**: Synthesize the data collected from the tools. Look for:
    *   **Relationships**: How different components or files interact.
    *   **Dependencies**: Explicit and implicit dependencies between modules or functions.
    *   **Architectural Patterns**: Recurring design choices (e.g., MVC, microservices, layered architecture).
    *   **Code Smells**: Indicators of potential problems (e.g., long functions, duplicated code, complex conditionals).
    *   **Performance Bottlenecks**: Areas that might be inefficient.
    *   **Security Vulnerabilities**: Potential weaknesses in input handling, authentication, etc.
    *   **Test Coverage Gaps**: Areas of the codebase not adequately covered by tests.

### 4. Generate Report and Recommendations
*   **Action**: Compile the findings into a structured report. The report should include:
    *   **Executive Summary**: A brief overview of the analysis and key takeaways.
    *   **Detailed Findings**: Specific observations, including file paths, line numbers, and code snippets where relevant.
    *   **Risk Assessment**: Evaluation of the severity and impact of identified issues.
    *   **Actionable Recommendations**: Concrete suggestions for improvements, prioritized by impact and effort.
    *   **Code Examples**: Illustrative code snippets to support findings or recommendations.
*   **Action**: Present the report to the user.

## Analysis Menu:

### 1. Knowledge Graph Generation
*   **Purpose**: Map relationships and dependencies between components, modules, or functions.
*   **Techniques**: Use `glob` to list all source files. Use `search_file_content` to find `import`, `require`, `from`, `include` statements, function calls, class instantiations. Analyze call graphs and data flow.

### 2. Code Quality Evaluation
*   **Purpose**: Assess code complexity, maintainability, and identify technical debt.
*   **Techniques**: Run project linters (`mise run lint`). Look for metrics like cyclomatic complexity (if tools are available via `run_shell_command`), duplicated code (e.g., using `search_file_content` for common patterns), and adherence to coding standards (`docs/memory-bank/standards/`).

### 3. Performance Analysis
*   **Purpose**: Identify potential bottlenecks, memory usage patterns, and algorithm inefficiencies.
*   **Techniques**: Analyze loops, recursive functions, large data structures. Look for inefficient database queries (if applicable, by searching for SQL patterns). Suggest profiling (if user can provide profiling data).

### 4. Security Review
*   **Purpose**: Identify potential vulnerabilities, insecure coding practices, and sensitive data handling issues.
*   **Techniques**: Search for common security pitfalls (e.g., SQL injection patterns, insecure deserialization, improper input validation, hardcoded credentials). Review authentication and authorization mechanisms. Look for `TODO` or `FIXME` comments related to security.

### 5. Architecture Review
*   **Purpose**: Evaluate adherence to design patterns, SOLID principles, coupling, cohesion, and module boundaries.
*   **Techniques**: Analyze class/module structure, inheritance hierarchies, and communication patterns between components. Look for violations of single responsibility, open/closed principles, etc.

### 6. Test Coverage Analysis
*   **Purpose**: Determine the extent to which the codebase is covered by tests and identify untested code paths.
*   **Techniques**: Run project tests (`mise run test`). If coverage tools are available, analyze their reports. Otherwise, manually inspect test directories (`glob` for test files) and compare with source code to identify gaps.

## Output Format:
*   **Executive Summary**
*   **Detailed Findings** (with file paths, line numbers, code snippets)
*   **Risk Assessment** (High, Medium, Low)
*   **Actionable Recommendations** (Prioritized)
*   **Relevant Code Examples**