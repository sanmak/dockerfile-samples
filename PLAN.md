# Repository Modernization Plan

## Current State (Last updated: Dec 2020)

| Language       | Current Base Image            | Status              |
|----------------|-------------------------------|---------------------|
| C++            | `gcc:latest`                  | Unpinned tag        |
| Go             | `golang:alpine` / `alpine:latest` | Unpinned tags   |
| Java           | `openjdk:8-jdk-alpine`        | EOL (Java 8)        |
| Node.js        | `node:12.18-alpine`           | EOL (Node 12)       |
| Python         | `python:3.8-slim-buster`      | EOL (Python 3.8)    |
| Python-Django  | `python:3.8-slim-buster`      | EOL (Python 3.8)    |
| Python-Flask   | `python:3.8-slim-buster`      | EOL (Python 3.8)    |
| Ruby           | `ruby:2.5-slim`               | EOL (Ruby 2.5)      |

---

## Phase 1: Update Base Images to Current LTS/Stable Versions

| Language       | Updated Base Image                | Notes                          |
|----------------|-----------------------------------|--------------------------------|
| C++            | `gcc:14`                          | Pin to specific major version  |
| Go             | `golang:1.22-alpine` / `alpine:3.19` | Pin both stages          |
| Java           | `eclipse-temurin:21-jdk-alpine`   | Java 21 LTS, modern vendor    |
| Node.js        | `node:20-alpine`                  | Node 20 LTS                   |
| Python         | `python:3.12-slim-bookworm`       | Python 3.12, Debian Bookworm  |
| Python-Django  | `python:3.12-slim-bookworm`       | Python 3.12, Debian Bookworm  |
| Python-Flask   | `python:3.12-slim-bookworm`       | Python 3.12, Debian Bookworm  |
| Ruby           | `ruby:3.3-slim`                   | Ruby 3.3 stable               |

## Phase 2: Security Hardening (All Dockerfiles)

- [ ] Add non-root `USER` to all Dockerfiles (currently only `python/` has this)
- [ ] Replace `ADD` with `COPY` where applicable (java, python-django, python-flask)
- [ ] Change exposed ports from 80 to 8080 (avoid requiring root for port < 1024)
- [ ] Add `HEALTHCHECK` instructions where applicable

## Phase 3: Dockerfile Best Practices

- [ ] Add multi-stage builds to Java and Node.js Dockerfiles (Go already has one)
- [ ] Use `COPY --chown` instead of separate `chown` commands
- [ ] Add `.dockerignore` improvements where needed
- [ ] Fix the Django placeholder (`pythonPath.to.wsgi`) with clearer guidance
- [ ] Add `--no-cache-dir` to pip install commands for smaller images

## Phase 4: Update Dependencies

- [ ] `python-django/requirements.txt`: Django 3.1.1 → 5.1, gunicorn 20.0.4 → 22.0
- [ ] `python-flask/requirements.txt`: Flask 1.1.2 → 3.1, gunicorn 20.0.4 → 22.0
- [ ] `nodejs/package.json`: Add meaningful placeholder content

## Phase 5: Update docker-compose Files

- [ ] Update `version: '3.4'` → remove version field (deprecated in modern Compose)
- [ ] Update port mappings to match new container ports (80 → 8080)
- [ ] Review and update debug compose files

## Phase 6: Update Documentation & Repo Config

- [ ] Update `README.md` with current versions, badges, and usage instructions
- [ ] Add `CONTRIBUTING.md` with guidelines
- [ ] Add GitHub Actions CI workflow to validate Dockerfiles (hadolint linting)
- [ ] Update `.gitignore` with broader patterns
- [ ] Add new language samples: Rust, TypeScript (stretch goal)

## Phase 7: Add CI/CD

- [ ] Add `.github/workflows/lint.yml` — run hadolint on all Dockerfiles
- [ ] Add `.github/workflows/build.yml` — build-test all Dockerfiles to catch errors
