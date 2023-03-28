FROM node:lts-alpine
WORKDIR /usr/app
COPY package*.json ./
RUN npm install 
# RUN npm ci --only=production 
RUN npm run build
COPY . .
RUN npm run build 
COPY tsconfig.json ./dist/
COPY .env ./dist/
WORKDIR /dist
EXPOSE 5000 

CMD ["node","dist/index.js"]
