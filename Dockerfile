ARG ARCH="amd64"
FROM multiarch/alpine:$ARCH-latest-stable
RUN apk add --update nodejs npm --repository=http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/

ENV NODE_ENV production

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .


ENTRYPOINT ["node", "app.js"]

run --name yunmusic -d -p 6666 nondanee/unblockneteasemusic


CMD /run.sh
