FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


FROM node:22-alpine AS production

WORKDIR /app

RUN apk add --no-cache netcat-openbsd

COPY --from=builder /app/node_modules ./node_modules
COPY package*.json ./

COPY --from=builder /app/dist ./dist

COPY drizzle.config.ts ./drizzle.config.ts
COPY src/lib/db ./src/lib/db

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]