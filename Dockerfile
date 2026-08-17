FROM node:lts-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY index.js ./
ENTRYPOINT ["node", "index.js"]
