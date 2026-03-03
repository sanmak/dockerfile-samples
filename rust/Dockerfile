# Build stage
FROM rust:1.93-alpine AS builder
RUN apk add --no-cache musl-dev
WORKDIR /usr/src/app
COPY Cargo.toml Cargo.lock* ./
# Create a dummy main.rs to cache dependency builds
RUN mkdir src && echo "fn main() {}" > src/main.rs \
    && cargo build --release \
    && rm -rf src

COPY src ./src
# Touch main.rs so cargo rebuilds the actual app, not the dummy
RUN touch src/main.rs \
    && cargo build --release

# Runtime stage
FROM alpine:3.19
RUN adduser -D appuser
COPY --from=builder /usr/src/app/target/release/dockerfilesamples /usr/local/bin/app
USER appuser
EXPOSE 8080
CMD ["app"]
