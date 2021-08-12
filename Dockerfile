FROM       node:lts-buster as build
WORKDIR    /app
COPY       . /app
RUN        npm install
RUN        npm run build
        
FROM       nginx:stable-alpine
COPY       --from=build /app/build /var/www/html/frontend/dist
COPY       todo.conf /etc/nginx/conf.d/default.conf
CMD        ["nginx", "-g", "daemon off;"]
