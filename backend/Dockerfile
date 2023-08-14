FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . ./

COPY config/typeorm.config.ts ./config/

EXPOSE 3000

CMD [ "npm", "run", "start:prod" ]