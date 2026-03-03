FROM node:20-alpine

ENV NODE_ENV=production
WORKDIR /usr/src/app

RUN adduser -D appuser

COPY package.json package-lock.json* ./
RUN npm install --omit=dev

COPY --chown=appuser:appuser . .

USER appuser
EXPOSE 8080
CMD ["node", "index.js"]
