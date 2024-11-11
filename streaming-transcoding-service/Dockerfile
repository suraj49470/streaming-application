FROM node:22-slim AS build

WORKDIR /app

COPY package*.json ./

# RUN npm ci --only=production
RUN npm ci
 

COPY . .

FROM node:22-alpine AS runtime

RUN apk update && \
    apk add --no-cache ffmpeg

WORKDIR /app

COPY --from=build /app /app

EXPOSE 5001

CMD ["npm", "start"]
