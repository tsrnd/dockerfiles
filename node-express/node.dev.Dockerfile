FROM node:13-alpine
ENV NODE_ENV=development
WORKDIR /usr/src/app
COPY package*.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "start:dev" ]