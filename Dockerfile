FROM       node:lts-buster as build
WORKDIR    /app
COPY       . /app
RUN        npm install
RUN        npm run build
        
