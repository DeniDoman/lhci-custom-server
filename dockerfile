FROM node:16-bullseye-slim

RUN apt-get update --fix-missing && apt-get install -y python build-essential && apt-get clean

WORKDIR /usr/src/lhci
COPY package.json .
COPY lighthouserc.json .

RUN npm install && \
    sed -e "s/loadStyle('chunks\/entry-WKRDB3RZ.css');/loadStyle('\/app\/chunks\/entry-WKRDB3RZ.css');/" node_modules/\@lhci/server/dist/index.html -i

EXPOSE 9001
CMD [ "npm", "start"]
