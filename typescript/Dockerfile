# Build stage — compile TypeScript to JavaScript
FROM node:25-alpine AS builder
WORKDIR /usr/src/app
COPY package.json package-lock.json* tsconfig.json ./
RUN npm install
COPY src ./src
RUN npm run build

# Runtime stage — run compiled JavaScript only
FROM node:25-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
RUN adduser -D appuser
COPY package.json package-lock.json* ./
RUN npm install --omit=dev
COPY --from=builder /usr/src/app/dist ./dist
USER appuser
EXPOSE 8080
CMD ["node", "dist/index.js"]
