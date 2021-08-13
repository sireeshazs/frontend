FROM       node:10 as build
WORKDIR    /app
COPY       . /app
RUN        npm install
RUN        npm run build

FROM       nginx:latest
COPY       --from=build /app/dist /var/www/html/app/dist
COPY       todo-docker.conf /etc/nginx/conf.d/default.conf
CMD        ["nginx", "-g", "daemon off;"]

