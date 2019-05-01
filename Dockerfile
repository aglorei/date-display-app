FROM node:carbon-jessie

WORKDIR /code

COPY package*.json ./
RUN npm install

COPY . .
RUN npm test

ENTRYPOINT ["node", "/code/index.js"]
