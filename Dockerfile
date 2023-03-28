# FROM node:lts-alpine
# WORKDIR /usr/app
# COPY package*.json ./
# RUN npm install 
# RUN npm ci --only=production 
# # RUN npm run build
# COPY . .
# RUN npm run build 
# COPY .env ./dist/
# WORKDIR /dist
# EXPOSE 5000 

# CMD ["node","dist/index.js"]

FROM node:18.15-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD ["node","dist/index.js"]
