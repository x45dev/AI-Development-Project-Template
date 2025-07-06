# Commit

This workflow guides the AI agent in creating well-formatted, conventional commits with descriptive messages.

## Process:

### 1. Prepare Changes
*   **Action**: Use `run_shell_command` with `git status` to review the current state of the working directory.
*   **Action**: If there are unstaged changes, use `run_shell_command` with `git add <file_path>` or `git add .` to stage the appropriate files for the commit.
*   **Action**: Use `run_shell_command` with `git diff --staged` to review the staged changes and ensure they are atomic and focused on a single logical change.

### 2. Determine Commit Type and Scope
*   **Action**: Analyze the staged changes to determine the primary purpose of the commit (e.g., `feat`, `fix`, `docs`, `refactor`, `style`, `test`, `chore`). Refer to `docs/memory-bank/standards/general/conventional-commits.md` for a full list and guidelines.
*   **Action**: Identify the scope of the change (e.g., `backend`, `frontend`, `auth`, `docs`, `ci`). This should be a concise noun describing the part of the codebase affected.

### 3. Generate Commit Message
*   **Action**: Construct the commit message using the Conventional Commits specification:
    ```
    <type>(<scope>): <description>

    [optional body]

    [optional footer(s)]
    ```
*   **Action**: **Description**: Write a concise, imperative, present-tense description (max 50-72 characters) of the change. Focus on *what* the change is.
*   **Action**: **Body (Optional)**: If the change is complex or requires further explanation, add a blank line after the description and then provide a more detailed explanation. Focus on *why* the change was made, the problem it solves, and any significant design decisions or tradeoffs. Wrap lines at 72 characters.
*   **Action**: **Footer(s) (Optional)**: Include references to issues or pull requests (e.g., `Fixes #123`, `Closes #456`, `Refs #789`). Breaking changes should be noted with `BREAKING CHANGE: <description>`.
*   **Action**: Review the generated message for clarity, conciseness, and adherence to standards.

### 4. Execute Commit
*   **Action**: Use `run_shell_command` with `git commit -m "<commit_message>"` to create the commit.
*   **Action**: If pre-commit hooks are configured, ensure they pass. If they fail, address the issues and re-attempt the commit.

### 5. Verify Commit
*   **Action**: Use `run_shell_command` with `git log -1 --stat` to verify the commit details and ensure the message is correctly applied.
*   **Action**: Use `run_shell_command` with `git status` to confirm the working tree is clean after the commit.

## Best Practices:
*   **Atomic Commits**: Each commit should represent a single, logical change.
*   **Imperative Mood**: Use imperative mood in the description (e.g., "Add feature" instead of "Added feature").
*   **Explain Why**: The commit body should explain the rationale behind the change, not just reiterate what was changed.
*   **Reference Issues**: Link commits to relevant issues or tasks for traceability.
*   **Review Before Commit**: Always review staged changes before committing.