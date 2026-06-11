FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build
RUN npm install -g serve@13
EXPOSE 3000
CMD ["sh", "-c", "serve -s build -l tcp://0.0.0.0:${PORT:-3000}"]
