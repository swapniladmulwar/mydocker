#multi step docker file
# as builder is output of first stage

FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Second stage of nginx https://hub.docker.com/_/nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

