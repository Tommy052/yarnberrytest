FROM node:18-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["web-server/package.json", "web-server/package-lock.json*", "web-server/npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 8080
RUN chown -R node /usr/src/app
USER node
WORKDIR /usr/src/app/web-server
CMD ["node", "server"]
