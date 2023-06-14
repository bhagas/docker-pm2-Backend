FROM keymetrics/pm2:18-alpine

# Bundle APP files
COPY src src/
COPY package.json .
COPY ecosystem.config.js .
COPY .env .

# Install app dependencies
RUN npm install -g npm
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production


# Expose the listening port of your app
EXPOSE 5000

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]