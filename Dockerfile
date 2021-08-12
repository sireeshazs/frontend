FROM       node:lts-buster as build
WORKDIR    /app
COPY       . /app
RUN        npm install
RUN        npm run build

FROM       nginx:stable-alpine
COPY       --from=build /app/dist /var/www/html/frontend/dist
COPY       todo.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["/var/www/html/frontend/dist/api-entrypoint.sh"]
CMD        ["nginx", "-g", "daemon off;"]
