FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build
RUN npm install -g serve@14
ENV PORT=3000
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]
