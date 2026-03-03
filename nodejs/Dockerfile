# Build stage — install dependencies
FROM node:20-alpine AS builder
WORKDIR /usr/src/app
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

# Runtime stage
FROM node:20-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
RUN adduser -D appuser
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --chown=appuser:appuser . .
USER appuser
EXPOSE 8080
CMD ["npm", "start"]
