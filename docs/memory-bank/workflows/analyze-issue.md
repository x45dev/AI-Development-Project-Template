# Analyze Issue

This workflow guides the AI agent in thoroughly analyzing a given issue (e.g., a bug, a feature request) and generating a comprehensive implementation specification. This specification serves as a detailed plan for subsequent implementation workflows.

## Process:

### 1. Fetch and Understand Issue Details
*   **Action**: If the issue is from a platform like GitHub, use `run_shell_command` (e.g., `gh issue view <issue_number>`) to fetch its details (title, description, comments, labels).
*   **Action**: Read and parse the issue description carefully. Identify the core problem or requested feature, its context, and any explicit requirements or constraints.
*   **Action**: If the issue is a bug, consider performing the `five-whys` workflow to understand its root cause before proceeding.

### 2. Review Related Code and Project Context
*   **Action**: Use `glob` and `search_file_content` to identify existing files and code sections that are likely to be affected by or relevant to the issue.
*   **Action**: Use `read_file` to inspect the content of these relevant files to understand existing logic, patterns, and dependencies.
*   **Action**: Consult `docs/memory-bank/standards/` for relevant coding standards and `docs/memory-bank/techContext.md` for architectural context.

### 3. Draft Implementation Specification
*   **Action**: Based on the understanding gained, draft a detailed implementation specification using the template sections below. Populate each section with concrete details.
*   **Action**: **Key considerations during drafting**:
    *   **Technical Approach**: Outline the high-level solution. Will it involve modifying existing components, adding new ones, or refactoring?
    *   **Implementation Plan**: Break down the solution into a step-by-step sequence of tasks. This should be granular enough for an AI agent to follow.
    *   **Test Plan**: Describe the testing strategy. What types of tests will be written (unit, integration, E2E)? What are the key test cases?
    *   **Files to Modify/Create**: List specific file paths. For modifications, indicate the general area or function. For new files, suggest names and their purpose.
    *   **Existing Utilities**: Identify any existing functions, classes, or libraries within the project that can be leveraged to avoid re-inventing the wheel.
    *   **Success Criteria**: Define clear, measurable criteria that indicate when the issue is successfully resolved or the feature is complete.
    *   **Out of Scope**: Explicitly state what will *not* be addressed to manage expectations.
*   **Action**: Adhere to project guidelines such as the 300-line file limit where applicable.

### 4. Present for User Approval
*   **Action**: Present the drafted implementation specification to the user for review and approval.
*   **Action**: Be prepared to answer questions, incorporate feedback, and revise the specification as needed.
*   **Action**: **Do not proceed with implementation until the user approves the specification.**

## Template Sections for Implementation Specification:

### 1. Issue Summary
Brief overview of the issue/feature.

### 2. Problem Statement / Feature Goal
Clear definition of what needs to be solved or achieved.

### 3. Technical Approach
High-level solution approach and architecture decisions.

### 4. Implementation Plan
Step-by-step breakdown of implementation tasks.

### 5. Test Plan
Testing strategy and key test cases.

### 6. Files to Modify
List of existing files that need changes (with brief description of change).

### 7. Files to Create
New files that need to be created (with proposed names and purpose).

### 8. Existing Utilities to Leverage
Project utilities/helpers that can be reused.

### 9. Success Criteria
Measurable criteria for completion and verification.

### 10. Out of Scope
What will not be addressed in this implementation.

## Best Practices for Agents:
*   **Thoroughness**: Ensure all aspects of the issue are considered.
*   **Clarity**: Write the specification in clear, unambiguous language.
*   **Actionability**: The plan should be concrete enough to guide subsequent implementation.
*   **Collaboration**: Actively seek user feedback and incorporate it.
*   **Traceability**: Link the specification back to the original issue.