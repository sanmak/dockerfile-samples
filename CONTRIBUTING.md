# Contributing to Dockerfile Samples

Thanks for your interest in contributing! Here's how you can help.

## Adding a New Language Sample

1. Create a new directory named after the language (e.g. `rust/`)
2. Include at minimum:
   - `Dockerfile` — following the conventions below
   - `docker-compose.yml`
   - `docker-compose.debug.yml`
   - `.dockerignore`

## Dockerfile Conventions

All Dockerfiles in this repo should follow these practices:

- **Pin base image versions** — use `python:3.12-slim-bookworm`, not `python:latest`
- **Use non-root users** — add a `USER` instruction for runtime security
- **Expose ports above 1024** — use 8080 instead of 80 (avoids requiring root)
- **Use `COPY` over `ADD`** — unless you specifically need URL fetching or tar extraction
- **Optimize layer caching** — copy dependency manifests before source code
- **Use `--no-cache-dir`** for pip installs to reduce image size
- **Use multi-stage builds** where it makes sense (compiled languages, Node.js)

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Test that your Dockerfile builds successfully: `docker compose up --build`
5. Commit with a clear message (`git commit -m 'Add Rust sample'`)
6. Push and open a Pull Request

## Reporting Issues

Open an [issue](https://github.com/sanmak/dockerfile-samples/issues) with:
- Which sample is affected
- What you expected vs. what happened
- Your Docker version (`docker --version`)
