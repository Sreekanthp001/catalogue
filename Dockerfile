#FROM node:20-alpine AS builder (this added 21/08/25)
FROM node:20-alpine3.21 AS builder
#FROM node:20-alpine3.20 AS builder #(add this 22/08/25 image scaning)
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install

FROM node:20-alpine3.21
#FROM node:20-alpine3.20 #(add this 22/08/25 image scaning)
RUN addgroup -S roboshop
RUN adduser -S roboshop -G roboshop
ENV MONGO="true"
ENV MONGO_URL="mongodb://mongodb:27017/catalogue"
WORKDIR /opt/server
USER roboshop
COPY --from=builder /opt/server /opt/server
CMD ["node","server.js"]





# FROM node:20-alpine3.21
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node","server.js"]