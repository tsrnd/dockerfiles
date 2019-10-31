FROM node:13-alpine as build-env
ENV NODE_ENV=production
RUN apk --no-cache add python make g++
COPY package*.json .
RUN npm install

FROM node:13.0-alpine
WORKDIR /usr/src/app
COPY --from=build-env node_modules node_modules
COPY . .
CMD [ "npm", "run", "start:prod" ]