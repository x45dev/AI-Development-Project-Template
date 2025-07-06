---
title: Bash Style Guide
description: Best practices for writing Bash scripts.
references:
  - https://google.github.io/styleguide/shellguide.html
---

## Content

### Shebang

- **`#!/bin/bash`**: Start all scripts with `#!/bin/bash`.

### Variables

- **Quoting**: Quote all variable expansions (e.g., `"$my_variable"`).
- **Braces**: Use braces to delimit variable names (e.g., `${my_variable}`).
- **Local variables**: Use `local` to declare variables in functions.

### Error Handling

- **`set -o errexit`**: Exit immediately if a command exits with a non-zero status.
- **`set -o nounset`**: Exit if you use an unset variable.
- **`set -o pipefail`**: The return value of a pipeline is the status of the last command to exit with a non-zero status.

### Readability

- **Indentation**: Use 2 spaces for indentation.
- **Line length**: Keep lines under 80 characters.
- **Comments**: Use comments to explain complex parts of your script.
