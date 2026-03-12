# Build stage
FROM golang:1.26-alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN go build -o /go/bin/app .

# Runtime stage
FROM alpine:3.19
RUN apk --no-cache add ca-certificates \
    && adduser -D appuser
COPY --from=builder /go/bin/app /app
USER appuser
ENTRYPOINT ["/app"]
EXPOSE 8080
