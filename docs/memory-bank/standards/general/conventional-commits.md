---
title: Conventional Commits
description: Rules for creating conventional commit messages.
references:
  - https://www.conventionalcommits.org/en/v1.0.0/
---

## Content

### Format

Each commit message consists of a **header**, a **body** and a **footer**.

The commit message should be structured as follows:

[optional body]

[optional footer(s)]


### Type

The type must be one of the following:

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to our CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

### Scope

The scope is optional and can be used to specify the place of the commit change.

### Description

The description must be a short summary of the code changes.

### Body

The body is optional and can be used to provide additional context about the code changes.

### Footer

The footer is optional and can be used to reference issues or pull requests.

### Version Control Best Practices
- **Keep commits atomic and focused**
- **Write in imperative mood ("Add feature" not "Added feature")**
- **Explain why, not just what**
- **Reference issues/PRs when relevant**
- **Split unrelated changes into separate commits**

## Process:
1. Check for staged changes (`git status`)
2. If no staged changes, review and stage appropriate files
3. Run pre-commit checks (unless --no-verify)
4. Analyze changes to determine commit type
5. Generate descriptive commit message
6. Include scope if applicable: `type(scope): description`
7. Add body for complex changes explaining why
8. Execute commit
