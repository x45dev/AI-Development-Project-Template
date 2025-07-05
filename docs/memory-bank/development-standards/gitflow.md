---
description: Gitflow workflow rules. These rules should be applied when performing git operations.
---
# Gitflow Workflow Rules

## Main Branches

### main (or master)
- Contains production-ready code
- Never commit directly to main
- Only accepts merges from the following branches:
  - hotfix/* branches
  - release/* branches
- Must be tagged with a version number after each merge
git
### develop
- Main development branch
- Contains the latest delivered development changes
- Source branch for feature branches
- Never commit directly to develop

## Support Branches

### feature/*
- Branches from: develop
- Merges back to: develop
- Naming convention: feature/[issue-id]-descriptive-name
- Example: feature/123-user-authentication
- Must be kept up-to-date with develop before creating a PR
- Deleted after merge

### release/*
- Branches from: develop
- Merges back to:
  - main
  - develop
- Naming convention: release/vX.Y.Z
- Example: release/v1.2.0
- Contains only bug fixes, documentation, and release-oriented tasks
- No new features
- Deleted after merge

### hotfix/*
- Branches from: main
- Merges back to:
  - main
  - develop
- Naming convention: hotfix/vX.Y.Z
- Example: hotfix/v1.2.1
- Only for urgent production fixes
- Deleted after merge

## Commit Messages
- Format: `type(scope): description`
- Types:
  - feat: new feature
  - fix: bug fix
  - docs: documentation changes
  - style: formatting, missing semicolons, etc.
  - refactor: code refactoring
  - test: adding tests
  - chore: maintenance tasks

## Version Control

### Semantic Versioning
- MAJOR version for incompatible API changes
- MINOR version for backward-compatible functionality
- PATCH version for backward-compatible bug fixes

## Pull Request Rules
1. All changes must be made through a pull request
2. Number of approvals required: at least 1
3. CI checks must pass
4. Direct commits to protected branches (main, develop) are prohibited
5. Branch must be up-to-date before merging
6. Delete branch after merging

## Branch Protection Rules

### main & develop
- Require pull request reviews
- Require status checks to pass
- Require branch to be up-to-date
- Include administrators in restrictions
- Prohibit force pushes
- Prohibit deletions

## Release Process
1. Create a release branch from develop
2. Bump the version number
3. Fix any release-related issues
4. Create a PR to main
5. After merging to main:
   - Tag the release version
   - Merge back to develop
   - Delete the release branch

## Hotfix Process
1. Create a hotfix branch from main
2. Fix the issue
3. Bump the patch version number
4. Create a PR to main
5. After merging to main:
   - Tag the release version
   - Merge back to develop
   - Delete the hotfix branch
