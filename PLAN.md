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

## Phase 1: Update Base Images to Current LTS/Stable Versions ✅

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

## Phase 2: Security Hardening (All Dockerfiles) ✅

- [x] Add non-root `USER` to all Dockerfiles (currently only `python/` has this)
- [x] Replace `ADD` with `COPY` where applicable (java, python-django, python-flask)
- [x] Change exposed ports from 80 to 8080 (avoid requiring root for port < 1024)

## Phase 3: Dockerfile Best Practices ✅

- [x] Add multi-stage builds to Java and Node.js Dockerfiles (Go already has one)
- [x] Use `COPY --chown` instead of separate `chown` commands
- [x] Fix the Django placeholder (`pythonPath.to.wsgi`) with clearer guidance
- [x] Add `--no-cache-dir` to pip install commands for smaller images
- [x] Fix Ruby Gemfile copy order for proper layer caching

## Phase 4: Update Dependencies ✅

- [x] `python-django/requirements.txt`: Django 3.1.1 → 5.1, gunicorn 20.0.4 → 22.0
- [x] `python-flask/requirements.txt`: Flask 1.1.2 → 3.1, gunicorn 20.0.4 → 22.0
- [x] `nodejs/package.json`: Add meaningful placeholder content (Express)

## Phase 5: Update docker-compose Files ✅

- [x] Remove deprecated `version: '3.4'` field (not needed in modern Compose)
- [x] Update port mappings to match new container ports (80 → 8080)
- [x] Update debug compose files (Django runserver, Flask port)

## Phase 6: Update Documentation & Repo Config ✅

- [x] Update `README.md` with current versions, table of samples, and usage instructions
- [x] Add `CONTRIBUTING.md` with guidelines and Dockerfile conventions
- [x] Update `.gitignore` with broader patterns
- [x] Add new language samples: Rust, TypeScript

## Phase 7: Add CI/CD ✅

- [x] Add `.github/workflows/lint.yml` — run hadolint on all Dockerfiles
- [x] Add `.github/workflows/build.yml` — build-test all Dockerfiles to catch errors

## Phase 8: Automated Freshness with Dependabot ✅

- [x] Add `.github/dependabot.yml` to auto-detect outdated base images and dependencies

**What Dependabot monitors (weekly schedule):**

| Ecosystem        | Directories                                              |
|------------------|----------------------------------------------------------|
| Docker           | All 10 Dockerfile directories (c++, go, java, nodejs, python, python-django, python-flask, ruby, rust, typescript) |
| pip              | python-django, python-flask                              |
| cargo            | rust                                                     |
| npm              | nodejs, typescript                                       |
| GitHub Actions   | Root (for future CI workflows)                           |

**How it works:**
- Dependabot checks weekly for newer base image tags and dependency versions
- Auto-creates PRs with version bump changes
- Commit messages are prefixed by ecosystem (`docker:`, `pip:`, `npm:`, `ci:`) for easy filtering
- No manual intervention needed — just review and merge the PRs
