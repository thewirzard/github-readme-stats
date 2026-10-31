FROM node:24.22.2-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends libbrotli1 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --ignore-scripts
COPY . .
ENV NODE_ENV=production
EXPOSE 9000
CMD ["node", "express.js"]
