FROM node:11.7.0-stretch

# Create app directory
WORKDIR /opt/app

COPY temp/startup /opt/startup

# Install Tools
RUN apt-get update \
    && apt-get install -y net-tools nano openssh-server vim curl wget tcptraceroute

RUN npm install -g pm2 \
    && mkdir -p /home/LogFiles \
    && echo "root:Docker!" | chpasswd \
    && echo "cd /opt/app" >> /etc/bash.bashrc \
    && chmod 755 /opt/startup/init_container.sh

COPY temp/sshd_config /etc/ssh/
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

COPY temp/package*.json ./
RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY temp/. .
RUN npm run build

EXPOSE 3000

ENV PM2HOME /pm2home

ENV PORT 3000
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/opt/app

ENV APP_HOME "/opt/app"
ENV HTTPD_LOG_DIR "/home/LogFiles"

# CMD [ "npm", "start" ]
ENTRYPOINT ["/opt/startup/init_container.sh"]