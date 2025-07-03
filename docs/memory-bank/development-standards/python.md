---
description: Python best practices and patterns for modern software development using FastAPI
globs: ["**/*.py", "src/**/*.py", "tests/**/*.py"]
---
# Python Best Practices

## Project Structure
- Use the `src/your_package_name/` src layout
- Place tests in a `tests/` directory parallel to `src/`
- Keep configuration in `config/` or as environment variables
- Manage dependencies with `uv` and `pyproject.toml`
- Use `config/log_conf.json` for logging configuration.

## Code Style
- Use `ruff` for linting, formatting, and import sorting.
- Follow PEP 8 naming conventions:
  - snake_case for functions and variables
  - PascalCase for classes
  - UPPER_CASE for constants
- Maximum line length of 88 characters (Black default)
- Use absolute imports instead of relative imports

## Type Hinting
- Use type hints for all function arguments and return values
- Import types from the `typing` module
- Use `Optional[Type]` instead of `Type | None`
- Use `TypeVar` for generic types
- Define custom types in `types.py`
- Use `Protocol` for duck typing

## FastAPI Structure
- Use the `FastAPI` application instance
- Use `APIRouter` to organize routes
- Implement proper dependency injection
- Implement proper error handlers using `HTTPException`
- Structure views with proper separation of concerns

## Database
- Use the SQLAlchemy ORM
- Use Alembic for database migrations
- Use proper connection pooling
- Define models in separate modules
- Implement proper relationships
- Use proper indexing strategies

## Authentication
- Implement correct JWT authentication
- Use correct password hashing
- Implement correct role-based access control
- Use correct session management
- Implement correct OAuth2
- Handle authentication errors correctly

## API Design
- Use `FastAPI` to build REST APIs
- Implement proper request validation using `Pydantic`
- Use correct HTTP status codes
- Handle errors consistently using `HTTPException`
- Use correct response formats
- Implement proper rate limiting
- Document the API with OpenAPI (Swagger UI/ReDoc)

## Testing
- Use `pytest` for testing, always with `conftest.py` for fixtures.
- Write tests for all routes
- Use `pytest-cov` for coverage checks
- Implement proper fixtures
- Use `pytest-mock` for proper mocking
- Test all error scenarios

## Security
- Use HTTPS in production
- Implement proper CORS
- Sanitize all user input
- Use proper session configuration
- Implement proper logging
- Follow OWASP guidelines

## Performance
- Use proper caching
- Implement proper asynchronous operations
- Use proper background tasks
- Implement proper connection pooling
- Implement proper query optimization
- Monitor application performance

## Error Handling
- Create custom exception classes
- Use proper try-except blocks
- Implement proper logging
- Return correct error responses
- Handle boundary cases correctly
- Use correct error messages

## Documentation
- Use NumPy-style docstrings for functions, classes, and modules.
- Write documentation for all public APIs
- Keep README.md updated
- Use proper inline comments
- Generate API documentation
- Document environment setup

## Development Workflow
- Use virtual environments (venv)
- Implement pre-commit hooks
- Use a proper Git workflow
- Follow semantic versioning
- Use proper CI/CD practices
- Implement proper logging

## Dependencies
- Manage dependencies with `uv` and `pyproject.toml`.
- Configure `uv`, `ruff`, and `pytest` in `pyproject.toml`.
- Pin dependency versions
- Use correct package versions
- Update dependencies regularly
- Check for security vulnerabilities

## Deployment
- Serve FastAPI apps with `gunicorn` and `uvicorn` workers.
- Use the correct Docker configuration
- Implement correct CI/CD
- Use the correct environment variables
- Implement correct logging
- Use correct monitoring
- Handle deployment errors correctly
