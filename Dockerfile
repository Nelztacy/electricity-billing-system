FROM node:16

WORKDIR /target

COPY package*.jar ./

RUN npm install

COPY . .

EXPOSE 5000
CMD [ "node", "index.js" ]