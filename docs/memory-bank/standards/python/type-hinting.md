---
title: Python Type Hinting
description: Guidelines for using type hints in Python projects.
---

## Content

### General Principles
- Use type hints for all function arguments and return values.
- Import types from the `typing` module.
- Use `Optional[Type]` instead of `Type | None`.
- Use `TypeVar` for generic types.
- Define custom types in `types.py`.
- Use `Protocol` for duck typing.
