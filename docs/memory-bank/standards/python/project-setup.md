---
title: Python Project Setup
description: Instructions for setting up Python projects with uv and pyproject.toml.
---

## Content

### Project Structure
- Use the `src/your_package_name/` src layout.
- Place tests in a `tests/` directory parallel to `src/`.
- Keep configuration in `config/` or as environment variables.
- Manage dependencies with `uv` and `pyproject.toml`.
- Use `config/log_conf.json` for logging configuration.

### Project and Dependency Management

- **`uv`**: All Python projects must use `uv` for project and dependency management.
- **`pyproject.toml`**: All project configuration must be defined in `pyproject.toml`. Do not use `setup.py`, `setup.cfg`, or `requirements.txt`.

### Linting and Formatting

- **`ruff`**: Use `ruff` (from astro.sh) for linting, formatting, and import sorting. Configure `ruff` in `pyproject.toml`.

### Type Checking

- **`ty`**: Use ([`ty`](https://docs.astral.sh/ty/)) for static type checking.

### Example `pyproject.toml`

```toml
[project]
name = "my-project"
version = "0.1.0"
dependencies = []

[tool.ruff]
line-length = 88

[tool.ruff.lint]
select = ["E", "F", "I"]

[tool.ty.environment]
python = "../../.venv"
python-platform = "linux"
python-version = "3.13"
root = ["./src"]

[tool.ty.rules]
index-out-of-bounds = "ignore"
```
