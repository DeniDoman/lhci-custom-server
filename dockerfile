FROM node:16-bullseye-slim

# Install utilities
RUN apt-get update --fix-missing && apt-get install -y python build-essential && apt-get clean

WORKDIR /usr/src/lhci
COPY package.json .
RUN npm install

EXPOSE 9001
CMD [ "npm", "start"]
