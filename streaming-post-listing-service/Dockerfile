FROM node:22-slim AS build
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . .
EXPOSE 5002
CMD [ "npm","start" ]
