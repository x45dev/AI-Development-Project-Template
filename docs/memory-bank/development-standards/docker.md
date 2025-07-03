---
description: Best practices for writing efficient and secure Dockerfiles
globs: ["**/Dockerfile"]
---
# Dockerfile Best Practices

## Base Image
- Use official, verified base images.
- Choose minimal base images (e.g., `alpine`, `slim`, `distroless`) to reduce size and attack surface.
- Pin the version of the base image (e.g., `node:18-alpine` instead of `node:latest`).

## Build Cache
- Optimize the order of instructions to leverage Docker's layer caching.
- Place instructions that change infrequently (e.g., installing system dependencies) at the beginning.
- Place instructions that change frequently (e.g., copying source code) at the end.
- For example, copy `package.json` and install dependencies before copying the entire application code.

## Multi-stage Builds
- Use multi-stage builds to separate the build environment from the production environment.
- The final image should only contain the minimal files required to run the application, not compilers, development tools, or intermediate artifacts.
- This significantly reduces image size and improves security.

## Security
- Do not run containers as the `root` user. Use the `USER` instruction to switch to a non-root user.
- Use a `.dockerignore` file to exclude unnecessary files and directories (e.g., `.git`, `node_modules`, `secrets`).
- Do not hardcode sensitive information (passwords, API keys) into the Dockerfile. Use build-time arguments (`ARG`), environment variables (`ENV`), or Docker secrets.
- Regularly scan images for vulnerabilities (using `docker scan` or third-party tools like Trivy, Snyk).

## Image Size
- Combine multiple `RUN` instructions into one to reduce the number of image layers (e.g., `RUN apt-get update && apt-get install -y ...`).
- Clean up the cache after installing packages (e.g., `rm -rf /var/lib/apt/lists/*`).
- Understand the difference between `COPY` and `ADD`, and prefer `COPY`.

## Instruction Usage
- Use `CMD` to provide the default command for the container.
- Use `ENTRYPOINT` to configure the container as an executable.
- Use `ENTRYPOINT` and `CMD` together to create flexible startup commands.
- Use the `HEALTHCHECK` instruction to check if the container is still working correctly.
