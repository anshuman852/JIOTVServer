FROM node:16

# Copy app to /src


WORKDIR /src

COPY ["package.json", "yarn.lock", "./"]

ENV PORT=3500 \
    HOST=0.0.0.0 \
    AUTH_USER=admin \
    AUTH_PASSWORD=password

EXPOSE ${PORT}

RUN yarn global add pm2

RUN yarn install
COPY . /src
CMD ["node", "index.js"]