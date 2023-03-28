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

FROM node:18.15.0
WORKDIR /usr
COPY package.json ./
COPY tsconfig.json ./
COPY . ./src
RUN ls -a
RUN npm install
RUN npm run build
EXPOSE 5000
CMD ["npm","run","dev"]
## this is stage two , where the app actually runs

# FROM node:12.17.0-alpine
# WORKDIR /usr
# COPY package.json ./
# RUN npm install --only=production
# COPY --from=0 /usr/dist .
# RUN npm install pm2 -g
# EXPOSE 5000
# CMD ["pm2-runtime","app.js"]