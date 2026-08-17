FROM node:lts-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev && rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx
COPY index.js ./
ENTRYPOINT ["node", "index.js"]
