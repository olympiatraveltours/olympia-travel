FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build
RUN npm install -g serve@14
EXPOSE 3000
CMD serve -s build -l ${PORT:-3000}
