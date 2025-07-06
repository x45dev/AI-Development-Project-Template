---
title: FastAPI Best Practices
description: Best practices for developing FastAPI applications.
references:
  - https://github.com/sanjeed5/awesome-cursor-rules-mdc/blob/main/rules-mdc/fastapi.mdc
---

## Content

### Application Structure

- **Modular Design**: Organize your application into modules or "apps".
- **Routers**: Use `APIRouter` to structure your endpoints.
- **Dependency Injection**: Use FastAPI's dependency injection system for managing dependencies.

### Pydantic Models

- **Input and Output**: Use Pydantic models for request and response validation.
- **Clarity**: Define clear and explicit schemas for your data.

### Asynchronous Operations

- **`async`/`await`**: Use `async` and `await` for all I/O-bound operations.
- **Database**: Use an async database driver (e.g., `asyncpg`).

### API Design
- **HTTP Methods**: Use correct HTTP methods (GET, POST, PUT, DELETE, etc.).
- **Status Codes**: Implement correct HTTP status codes for responses.
- **Request/Response Models**: Use Pydantic models for request and response validation.
- **Validation**: Implement robust input validation.
- **Error Handling**: Use custom exception handlers for consistent error responses.
- **OpenAPI Documentation**: Document the API with OpenAPI (FastAPI's automatic docs).

### Database
- **ORM**: Use an appropriate ORM (e.g., SQLAlchemy).
- **Migrations**: Implement database migrations.
- **Connection Pool**: Use a connection pool for database connections.
- **Transactions**: Handle database transactions correctly.
- **Query Optimization**: Optimize database queries.

### Authentication
- **JWT Authentication**: Implement JWT authentication.
- **Password Hashing**: Use secure password hashing.
- **Role-Based Access Control**: Implement role-based access control (RBAC).
- **Session Management**: Use secure session management.
- **OAuth2**: Implement OAuth2 where appropriate.

### Security
- **CORS**: Implement Cross-Origin Resource Sharing (CORS) policies.
- **Rate Limiting**: Use rate limiting to prevent abuse.
- **Input Validation**: Implement comprehensive input validation.
- **Security Headers**: Use appropriate security headers.
- **Logging**: Implement secure logging practices.

### Performance
- **Caching**: Use caching mechanisms.
- **Asynchronous Operations**: Leverage `async`/`await` for I/O-bound operations.
- **Background Tasks**: Use background tasks for long-running operations.
- **Connection Pooling**: Optimize database connection pooling.
- **Query Optimization**: Continuously optimize database queries.

### Testing
- **Unit Tests**: Write comprehensive unit tests.
- **Integration Tests**: Implement integration tests.
- **Test Fixtures**: Use test fixtures for setup and teardown.
- **Mocking**: Use mocking for external dependencies.
- **Error Scenarios**: Test error scenarios thoroughly.
- **Test Coverage**: Aim for high test coverage.

### Deployment
- **Docker Configuration**: Use efficient Docker configurations.
- **CI/CD**: Implement CI/CD pipelines.
- **Environment Variables**: Manage environment variables securely.
- **Logging**: Implement centralized logging.
- **Monitoring**: Set up monitoring and alerting.

### Documentation
- **Docstrings**: Use clear and concise docstrings.
- **API Documentation**: Maintain up-to-date API documentation.
- **Type Hints**: Use type hints extensively.
- **Error Scenarios**: Document error scenarios.
