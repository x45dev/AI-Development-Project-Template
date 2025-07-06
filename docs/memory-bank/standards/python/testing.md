---
title: Python Testing
description: Guidelines for testing with pytest and hypothesis.
---

## Content

### Testing Framework

- **`pytest`**: Use `pytest` for testing, always with `conftest.py` for fixtures.
- **`hypothesis`**: Use `hypothesis` for property-based testing.
- **`pytest-cov`**: Use `pytest-cov` for coverage checks.

### Test Structure

- **`tests` directory**: Place all tests in a `tests` directory at the root of the project.
- **Test file naming**: Name test files with a `test_` prefix (e.g., `test_my_module.py`).
- **Test function naming**: Name test functions with a `test_` prefix (e.g., `test_my_function`).

### Best Practices

- **Isolation**: Tests should be isolated and not depend on each other.
- **Fixtures**: Use `pytest` fixtures to set up and tear down test state.
- **Assertions**: Use clear and descriptive assertions.
- **Test boundary cases and error conditions.**
- **Write tests before fixing bugs.**
- **Keep tests readable and maintainable.**
- **Mocking**: Use `pytest-mock` for proper mocking.
- **Test all error scenarios.**
