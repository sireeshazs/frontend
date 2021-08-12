FROM       node:lts-buster as build
WORKDIR    /app
COPY       . /app
RUN        npm install
RUN        npm run build

FROM       nginx:stable-alpine
COPY       --from=build /app/dist /var/www/html/app/dist
COPY       todo-docker.conf /etc/nginx/conf.d/default
CMD        ["nginx", "-g", "daemon off;"]

