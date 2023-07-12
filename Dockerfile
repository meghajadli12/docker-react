# Stage 1: Build the Node.js application
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Run tests
FROM node:alpine as test
WORKDIR '/app'
COPY package.json .
RUN npm install --only=dev
COPY . .
CMD ["npm", "run", "test"]
