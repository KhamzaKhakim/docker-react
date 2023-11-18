FROM node:21-alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
RUN ls

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html