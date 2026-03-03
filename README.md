# Dockerfile Samples

[![MIT License][license-shield]][license-url]
[![Build Dockerfiles][build-shield]][build-url]
[![Lint Dockerfiles][lint-shield]][lint-url]
[![GitHub Stars][stars-shield]][stars-url]
[![GitHub Forks][forks-shield]][forks-url]
[![PRs Welcome][prs-shield]][prs-url]

Production-ready Dockerfile templates for 10 languages and frameworks. Clone, copy, and ship.

---

## Why This Repo?

Most Dockerfile examples you find online use `latest` tags, run as root, and skip multi-stage builds. These samples are different:

- **Pinned base images** — reproducible builds with no surprise breakage
- **Non-root containers** — every sample runs as an unprivileged user
- **Multi-stage builds** — smaller images for compiled languages (Go, Java, Rust, TypeScript)
- **CI-validated** — every Dockerfile is linted with [Hadolint](https://github.com/hadolint/hadolint) and build-tested on every push
- **Dependency monitoring** — Dependabot keeps base images and packages up to date automatically

---

<!-- TABLE OF CONTENTS -->
<details>
  <summary><strong>Table of Contents</strong></summary>

  - [Available Samples](#available-samples)
  - [Quick Start](#quick-start)
  - [Prerequisites](#prerequisites)
  - [Repository Structure](#repository-structure)
  - [What's Included](#whats-included)
  - [Best Practices](#best-practices)
  - [CI/CD](#cicd)
  - [Contributing](#contributing)
  - [Roadmap](#roadmap)
  - [License](#license)
  - [Contact](#contact)

</details>

---

## Available Samples

| Language | Base Image | Framework | Port |
|----------|-----------|-----------|------|
| [C++](./c++/) | `gcc:14` | — | — |
| [Go](./go/) | `golang:1.22-alpine` | — | 8080 |
| [Java](./java/) | `eclipse-temurin:21` | Spring Boot | 8080 |
| [Node.js](./nodejs/) | `node:20-alpine` | Express | 8080 |
| [Python](./python/) | `python:3.12-slim-bookworm` | — | — |
| [Python + Django](./python-django/) | `python:3.12-slim-bookworm` | Django 5.1 | 8080 |
| [Python + Flask](./python-flask/) | `python:3.12-slim-bookworm` | Flask 3.1 | 8080 |
| [Ruby](./ruby/) | `ruby:3.3-slim` | — | 8080 |
| [Rust](./rust/) | `rust:1.77-alpine` | — | 8080 |
| [TypeScript](./typescript/) | `node:20-alpine` | Express | 8080 |

## Quick Start

```bash
# Clone the repo
git clone https://github.com/sanmak/dockerfile-samples.git
cd dockerfile-samples

# Pick a sample and run it
cd python-flask
docker compose up --build
```

Open [http://localhost:8080](http://localhost:8080) — you're running.

## Prerequisites

| Tool | Minimum Version | Install |
|------|----------------|---------|
| Docker | 20.10+ | [docs.docker.com/get-docker](https://docs.docker.com/get-docker/) |
| Docker Compose | V2 (included with Docker Desktop) | [docs.docker.com/compose/install](https://docs.docker.com/compose/install/) |

## Repository Structure

```
dockerfile-samples/
├── c++/                  # GCC 14 compilation sample
├── go/                   # Go 1.22 with multi-stage build
├── java/                 # Eclipse Temurin 21, multi-stage
├── nodejs/               # Node 20 + Express, multi-stage
├── python/               # Python 3.12 minimal
├── python-django/        # Django 5.1 + Gunicorn
├── python-flask/         # Flask 3.1 + Gunicorn
├── ruby/                 # Ruby 3.3
├── rust/                 # Rust 1.77, multi-stage alpine
├── typescript/           # TypeScript + Express, multi-stage
├── .github/
│   ├── workflows/
│   │   ├── build.yml     # Build-test all Dockerfiles
│   │   └── lint.yml      # Hadolint linting
│   └── dependabot.yml    # Automated dependency updates
├── CONTRIBUTING.md
└── README.md
```

## What's Included

Every language sample ships with:

| File | Purpose |
|------|---------|
| `Dockerfile` | Production-ready container image |
| `docker-compose.yml` | Run the container locally |
| `docker-compose.debug.yml` | Run with debugging enabled |
| `.dockerignore` | Exclude unnecessary files from the build context |

## Best Practices

All samples follow these conventions:

- **Pinned base image versions** — no `latest` tags, ever
- **Non-root user** at runtime — `USER appuser` for security
- **Multi-stage builds** for compiled languages — smaller final images
- **Optimized layer caching** — dependency manifests copied before source code
- **Ports above 1024** — no root privileges required to bind
- **`COPY` over `ADD`** — explicit and predictable
- **`--no-cache-dir`** on pip installs — smaller Python images

## CI/CD

Every push and pull request triggers two GitHub Actions workflows:

- **[Lint Dockerfiles][lint-url]** — runs [Hadolint](https://github.com/hadolint/hadolint) against all Dockerfiles to catch anti-patterns
- **[Build Dockerfiles][build-url]** — builds every sample to verify they compile and produce valid images

[Dependabot](https://docs.github.com/en/code-security/dependabot) monitors base images, pip packages, npm packages, Cargo crates, and GitHub Actions for updates on a weekly schedule.

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](./CONTRIBUTING.md) for Dockerfile conventions and submission guidelines.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/feature-name`)
3. Commit your Changes (`git commit -m 'Add some feature-name'`)
4. Push to the Branch (`git push origin feature/feature-name`)
5. Open a Pull Request

## Roadmap

See the [open issues](https://github.com/sanmak/dockerfile-samples/issues) for proposed features and known issues.

## License

Distributed under the MIT License. See [`LICENSE`](./LICENSE) for more information.

## Contact

**Sanket Makhija** — [https://x.com/sanketmakhija](https://x.com/sanketmakhija)

Project Link: [github.com/sanmak/dockerfile-samples](https://github.com/sanmak/dockerfile-samples)

---

If this repo helped you, consider giving it a star. It helps others find it.

<!-- MARKDOWN LINKS & IMAGES -->
[license-shield]: https://img.shields.io/github/license/sanmak/dockerfile-samples?style=for-the-badge
[license-url]: https://github.com/sanmak/dockerfile-samples/blob/main/LICENSE
[build-shield]: https://img.shields.io/github/actions/workflow/status/sanmak/dockerfile-samples/build.yml?style=for-the-badge&label=build
[build-url]: https://github.com/sanmak/dockerfile-samples/actions/workflows/build.yml
[lint-shield]: https://img.shields.io/github/actions/workflow/status/sanmak/dockerfile-samples/lint.yml?style=for-the-badge&label=lint
[lint-url]: https://github.com/sanmak/dockerfile-samples/actions/workflows/lint.yml
[stars-shield]: https://img.shields.io/github/stars/sanmak/dockerfile-samples?style=for-the-badge
[stars-url]: https://github.com/sanmak/dockerfile-samples/stargazers
[forks-shield]: https://img.shields.io/github/forks/sanmak/dockerfile-samples?style=for-the-badge
[forks-url]: https://github.com/sanmak/dockerfile-samples/network/members
[prs-shield]: https://img.shields.io/badge/PRs-welcome-brightgreen?style=for-the-badge
[prs-url]: https://github.com/sanmak/dockerfile-samples/pulls
