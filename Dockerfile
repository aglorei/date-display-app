FROM node:carbon-jessie

WORKDIR /code

COPY package*.json ./
RUN npm install && npm test

COPY . .

ENTRYPOINT ["node", "/code/index.js"]
