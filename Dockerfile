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

# FROM node:18.15.0
# WORKDIR /usr/app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build
# EXPOSE 8000
# CMD ["node","dist/index.js"]

# FROM node:18.15.0
# WORKDIR /usr
# COPY package.json ./
# COPY tsconfig.json ./
# COPY src ./src
# RUN ls -a
# RUN npm install
# EXPOSE 5000
# CMD ["npm","run","dev"]

# FROM node:18.15-alpine
# WORKDIR /usr
# COPY package.json ./
# COPY package-lock.json* ./
# COPY tsconfig.json ./
# COPY . .
# RUN npm install 
# RUN npm run build
# EXPOSE 5000
# CMD ["node","dist/index.js"]


FROM node:18.15-alpine AS builder
WORKDIR /usr
COPY package.json ./
COPY package-lock.json* ./
COPY tsconfig.json ./
COPY . .
RUN npm install 
RUN npm run build

FROM node:18.15-alpine
WORKDIR /usr
COPY package* ./
# RUN npm install --production
RUN npm install --omit=dev

COPY --from=builder ./usr/dist /usr
# COPY --from=builder ./app/build ./build
EXPOSE 5000
CMD ["node", "dist/index.js"]