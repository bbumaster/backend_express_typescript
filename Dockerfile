FROM node:lts-alpine
WORKDIR /usr/src/app
COPY package*.json /usr/src/app
RUN npm install 
# RUN npm ci --only=production 
RUN npm run build
COPY . /usr/src/app
EXPOSE 5000 
CMD ["node","dist/index.js"]
