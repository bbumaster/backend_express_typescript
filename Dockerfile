FROM node:lts-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install 
# RUN npm ci --only=production 
RUN npm run build
COPY . .
EXPOSE 5000 
CMD ["node","dist/index.js"]
