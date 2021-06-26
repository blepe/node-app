FROM node:lts-buster
RUN npm i -g npm
RUN npm i -g nodemon

RUN mkdir /app
WORKDIR /app

COPY app/* /app/

#HEALTHCHECK --interval=10s --start-period=30s \
#        CMD node --no-warnings healthcheck.js 

CMD npm start
