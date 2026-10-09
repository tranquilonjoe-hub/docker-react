FROM node:18-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
ENV NODE_OPTIONS="--max-old-space-size=512"
RUN npm run build

FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html
EXPOSE 80