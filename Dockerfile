# a lightweight node image that's good for serving static content such as a react app ;)
FROM node:alpine

# Docker defaults to root user for mounting in Linux OS.
# Change it to node, so you don't get permission issues from docker trying to mkdir as root
# issue described here: https://github.com/nodejs/docker-node/issues/740
USER node

# Create working directory in home so we have access to it
RUN mkdir -p /home/node/app
WORKDIR /home/node/app

# install dependencies, setting ownership to the node user to override default ownership by root in Linux
    #install dependncies
COPY --chown=node:node ./package.json ./
RUN npm install
    # copy source code.
        # Note: This isn't needed if you're using Docker volumes mapped to your local dev environment since the volume will reference the source code in your local in order to implement hot reloading.
        #       But there's no harm in initially copying the source code into the container. And this step is required anyway if you happen to not build with volumes.
COPY --chown=node:node ./ ./

# Solves permission issue when mounting a react app in a docker volume in linux
# https://stackoverflow.com/questions/67087735/eacces-permission-denied-mkdir-usr-app-node-modules-cache-how-can-i-creat
#RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache

CMD ["npm", "start"]