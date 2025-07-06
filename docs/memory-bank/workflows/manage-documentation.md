# Manage Documentation

This workflow guides the AI agent in creating new documentation and updating existing documentation, ensuring it is comprehensive, LLM-optimized, and adheres to project standards. The goal is to produce documentation that effectively serves both human developers and other AI agents.

## Core Principles:

*   **LLM-Optimized Format**: Documentation should be token-efficient, reference-heavy, and use flexible formatting (subsections, code blocks, examples) rather than rigid step-by-step instructions.
*   **Concrete File References**: Always include specific file paths, and line numbers when helpful, for all code examples and references.
*   **No Duplication**: Each piece of information should appear in *exactly one* file. Use cross-references (`[link text](path/to/file.md)`) for related content.
*   **Agent-Centric**: Instructions are clear, actionable commands for the AI agent, leveraging available tools.
*   **Timestamp Header**: Each generated or updated document MUST start with `<!-- Generated: YYYY-MM-DD HH:MM:SS UTC -->`.

## Process:

### 1. Understand the Documentation Task
*   **Action**: Determine if the task is to create *new* documentation for a component/feature or to *update* existing documentation (e.g., for a new feature, bug fix, or refactoring).
*   **Action**: Identify the scope of the documentation: which components, features, or aspects of the project need to be covered.

### 2. Analyze the Codebase and Gather Information
*   **Action**: Systematically analyze the relevant codebase sections. Use the following tools:
    *   `read_file`: To inspect specific files.
    *   `glob`: To discover related files (e.g., all source files for a component, test files).
    *   `search_file_content`: To find specific patterns, function calls, or variable usages.
    *   `run_shell_command`: To execute project-specific commands that might provide insights (e.g., `git log` for recent changes, `mise run check` for quality).
*   **Action**: For each area of analysis, extract:
    *   **Key Files**: Important headers, source files, configuration files.
    *   **Specific References**: Line numbers for key functions/sections, actual code examples from the codebase.
    *   **Patterns**: Recurring structures, naming conventions, common workflows.
    *   **Inputs/Outputs/Behavior**: How components interact.
    *   **Edge Cases/Error Handling**: How the system behaves under unusual conditions.
    *   **Integration Points**: How this component connects with others.

### 3. Create or Update Documentation Content
*   **Action**: Based on the analysis, generate or modify the content for the target documentation file(s).
*   **Action**: Adhere to the `Required Documentation Structure` and `Specific File Requirements` outlined below.
*   **Action**: Ensure the content is token-efficient, focusing on essential information. Avoid redundant explanations.
*   **Action**: Integrate practical guidance and common workflows with concrete file locations and examples.
*   **Action**: For new documentation, use the `Documentation Template` provided below.
*   **Action**: For updates, read the existing file first (`read_file`) to understand its current content and structure, then apply changes using `replace` or `write_file`.
*   **Action**: Update the timestamp header at the top of the file with the current UTC time.

### 4. Verify and Refine
*   **Action**: After writing/updating, read the generated file (`read_file`) and critically review it for:
    *   **Accuracy**: Is the information correct and up-to-date?
    *   **Completeness**: Does it cover all necessary aspects of the scope?
    *   **Clarity**: Is it easy to understand for both humans and LLMs?
    *   **Adherence to Principles**: Does it follow LLM-optimized format, concrete file references, and no duplication?
    *   **Consistency**: Is the style and tone consistent with other project documentation?
*   **Action**: Perform a duplication check across all relevant documentation files to ensure no information is repeated. If duplication is found, remove it and use cross-references.
*   **Action**: Ensure all file paths and references are accurate and helpful.

### 5. Finalization (if coordinating agent)
*   **Action**: If acting as a coordinating agent for a larger documentation task (e.g., generating a full set of project docs):
    *   **Action**: Wait for all sub-agents to complete their documentation tasks.
    *   **Action**: Read all generated documentation files.
    *   **Action**: Perform a final, comprehensive duplication check and eliminate any remaining redundancies.
    *   **Action**: Create or update the main `README.md` with a brief project description, key entry points, quick build commands, and links to the newly generated documentation files. Keep it concise (under 50 lines total).
    *   **Action**: Update the `README.md` timestamp.
    *   **Action**: Delete any old, merged documentation files (e.g., `docs/patterns.md` if its content was merged elsewhere).

## Required Documentation Structure (for individual files):

Each document MUST include:
1.  **Timestamp Header**: `<!-- Generated: YYYY-MM-DD HH:MM:SS UTC -->`
2.  **Brief Overview**: 2-3 paragraphs max, explaining purpose and value.
3.  **Key Files & Examples**: Concrete file references for each major topic.
4.  **Common Workflows**: Practical guidance with file locations.
5.  **Reference Information**: Quick lookup tables with file paths.

## Specific File Requirements (for common documentation types):

*   **`docs/project-overview.md`**:
    *   Overview: What the project is, core purpose, key value proposition.
    *   Key Files: Main entry points and core configuration files.
    *   Technology Stack: Core technologies with specific file examples.
    *   Platform Support: Requirements with platform-specific file locations.

*   **`docs/architecture.md`**:
    *   Overview: High-level system organization.
    *   Component Map: Major components with their source file locations.
    *   Key Files: Core headers and implementations with brief descriptions.
    *   Data Flow: How information flows with specific function/file references.

*   **`docs/build-system.md`**:
    *   Overview: Build system with file references to main build configuration.
    *   Build Workflows: Common tasks with specific commands and config files.
    *   Platform Setup: Platform-specific requirements with file paths.
    *   Reference: Build targets, presets, and troubleshooting with file locations.

*   **`docs/testing.md`**:
    *   Overview: Testing approach with test file locations.
    *   Test Types: Different test categories with specific file examples.
    *   Running Tests: Commands with file paths and expected outputs.
    *   Reference: Test file organization and build system test targets.

*   **`docs/development.md`**:
    *   Overview: Development environment, code style, patterns.
    *   Code Style: Conventions with specific file examples (show actual code from codebase).
    *   Common Patterns: Implementation patterns with file references and examples from the codebase.
    *   Workflows: Development tasks with concrete file locations and examples.
    *   Reference: File organization, naming conventions, common issues with specific files.

*   **`docs/deployment.md`**:
    *   Overview: Packaging and distribution with script references.
    *   Package Types: Different packages with build targets and output locations.
    *   Platform Deployment: Platform-specific packaging with file paths.
    *   Reference: Deployment scripts, output locations, server configurations.

*   **`docs/files.md` (File Catalog)**:
    *   Overview: Comprehensive file catalog with descriptions and relationships.
    *   Core Source Files: Main application logic with purpose descriptions.
    *   Platform Implementation: Platform-specific code with interface mappings.
    *   Build System: Build configuration and helper modules.
    *   Configuration: Assets, scripts, configs - Supporting files and their roles.
    *   Reference: File organization patterns, naming conventions, dependency relationships.
    *   **Format**: Concise lists with file paths and single-sentence descriptions. Focus on helping LLMs quickly locate functionality, not comprehensive documentation.

## Documentation Template (for new components/features):

### Overview
Brief 1-2 paragraph overview explaining purpose and value.

### Usage
How to use this component/feature with examples.

### API / Props / Parameters
Detailed specification of interfaces.

### Component Hierarchy
Structure and relationships (if applicable).

### State Management
How state is handled and flows through the system.

### Behavior
Expected behavior in different scenarios.

### Error Handling
How errors are caught, handled, and reported.

### Performance Considerations
Optimization notes and performance characteristics.

### Accessibility
Accessibility features and compliance.

### Testing
How to test this component/feature.

### Related Components/Features
Links to related documentation.
