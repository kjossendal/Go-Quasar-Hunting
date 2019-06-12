# build stage
FROM node:lts-alpine as build-stage
LABEL MAINTAINER='Jossendal Development<kjossendal@gmail.com>'
RUN npm install -g @quasar/cli
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]