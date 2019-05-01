FROM node:carbon-jessie

WORKDIR /code
USER node

COPY --chown=node:node package*.json ./
RUN npm install && npm test

COPY --chown=node:node . .

ENTRYPOINT ["node", "/code/index.js"]
