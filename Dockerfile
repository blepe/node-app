FROM node:lts-buster
RUN npm i -g npm
RUN npm i -g nodemon

RUN mkdir /app
WORKDIR /app

RUN echo "const app = require('http').createServer((req, res) => res.end('Hello!'));" >> app.js
RUN echo "const PORT = process.env.PORT || 3000;" >> app.js
RUN echo "" >> app.js
RUN echo "app.listen(PORT, () => {" >> app.js
RUN echo "  console.log(\`Server is listening on port \${PORT}\`);" >> app.js
RUN echo "});" >> app.js && cat app.js

RUN echo "{" >> package.json
RUN echo "  \"name\": \"demo-app\"," >> package.json
RUN echo "  \"version\": \"1.0.0\"," >> package.json
RUN echo "  \"private\": true," >> package.json
RUN echo "  \"scripts\": {" >> package.json
RUN echo "    \"start\": \"node app.js\"" >> package.json
RUN echo "  }" >> package.json
RUN echo "}" >> package.json && cat package.json

HEALTHCHECK --interval=10s --start-period=30s \
        CMD node --no-warnings healthcheck.js 

CMD npm start
