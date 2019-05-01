FROM node:carbon-jessie

WORKDIR /code
USER node

COPY package*.json ./
RUN npm install && npm test

COPY . .

ENTRYPOINT ["node", "/code/index.js"]
