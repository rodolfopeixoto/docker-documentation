FROM node:latest
MAINTAINER Rodolfo Peixoto
ENV NODE_ENV=development
COPY ./appbook/ /var/www
WORKDIR /var/www
RUN npm install 
ENTRYPOINT ["npm", "start"]
EXPOSE 3000