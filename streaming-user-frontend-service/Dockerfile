FROM node:22-slim AS build
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . .
EXPOSE 3000
CMD [ "npm","start" ]
