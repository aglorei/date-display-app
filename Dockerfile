FROM node:carbon-jessie AS build

WORKDIR /code
COPY --chown=node:node . .
RUN npm install && npm test

FROM node:carbon-jessie

WORKDIR /code
COPY --chown=node:node --from=build /code/node_modules ./node_modules
COPY --chown=node:node . .

ENTRYPOINT ["node", "/code/index.js"]
