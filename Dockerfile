FROM node:26.10.0 as builder
WORKDIR '/app'
COPY /package.json .
run npm install
COPY . .
run npm run build

FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html
