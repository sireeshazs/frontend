FROM       node:12
WORKDIR    /app
COPY       . /app
RUN        npm install
RUN        npm run build
        
