---
description: Guidelines for writing clean, maintainable, and human-readable code. Apply these rules when writing or reviewing code to ensure consistency and quality.
globs: []
---
# Clean Code Guidelines
## Use Constants Instead of Magic Numbers
- Replace hard-coded values with named constants.
- Use descriptive constant names to explain the purpose of the value.
- Place constants at the top of the file or in a dedicated constants file.
## Meaningful Naming
- The names of variables, functions, and classes should reveal their purpose.
- Names should explain why something exists and how it is used.
- Avoid abbreviations unless they are universally understood.
## Wise Comments
- Don't comment on what the code does—let the code be self-documenting.
- Use comments to explain why something is done in a certain way.
- Write documentation for APIs, complex algorithms, and non-obvious side effects.
## Single Responsibility
- Each function should do only one thing.
- Functions should be small and focused.
- If a function needs comments to explain what it does, it should be split.
## DRY (Don't Repeat Yourself)
- Extract duplicate code into reusable functions.
- Share common logic through proper abstraction.
- Maintain a single source of truth.
## Clean Structure
- Keep related code together.
- Organize code in a logical hierarchy.
- Use consistent file and folder naming conventions.
## Encapsulation
- Hide implementation details.
- Expose clear interfaces.
- Move nested conditional judgments into well-named functions.
## Code Quality Maintenance
- Continuously refactor.
- Fix technical debt early.
- Leave the code cleaner than you found it.
## Testing
- Write tests before fixing bugs.
- Keep tests readable and maintainable.
- Test boundary cases and error conditions.
## Version Control
- Write clear commit messages.
- Make small, focused commits.
- Use meaningful branch names.
