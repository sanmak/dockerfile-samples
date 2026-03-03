# Dockerfile Samples

[![MIT License][license-shield]][license-url]

Production-ready Dockerfile templates for popular languages and frameworks. Copy into your project and start building containers.

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#available-samples">Available Samples</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Dockerfile samples is designed to make developers life easier. As more applications move towards containerization, it's equally important to standardize Dockerfiles and have them available readily.

Each sample follows Docker best practices:
- Pinned base image versions (no `latest` tags)
- Non-root user for runtime security
- Multi-stage builds where applicable (Go, Java, Node.js, Rust, TypeScript)
- Optimized layer caching (dependencies installed before app code)
- Ports above 1024 (no root required)

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

<!-- USAGE EXAMPLES -->
## Usage

1. Copy the folder for your language/framework into your project
2. Adjust the Dockerfile for your source code paths and build commands
3. Build and run:

```bash
docker compose up --build
```

Each sample includes:
- `Dockerfile` — production-ready container image
- `docker-compose.yml` — run the container locally
- `docker-compose.debug.yml` — run with debugging enabled
- `.dockerignore` — exclude unnecessary files from the build context

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/sanmak/dockerfile-samples/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/feature-name`)
3. Commit your Changes (`git commit -m 'Add some feature-name'`)
4. Push to the Branch (`git push origin feature/feature-name`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the MIT License. See [`LICENSE`](https://github.com/sanmak/dockerfile-samples/blob/main/LICENSE) for more information.

<!-- CONTACT -->
## Contact

SANKET MAKHIJA - [@sanket_dude](https://twitter.com/sanket_dude) - sanket[dot]mahija[at]gmail[dot]com

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/sanmak/dockerfile-samples?style=for-the-badge
[license-url]: https://github.com/sanmak/dockerfile-samples/blob/main/LICENSE
