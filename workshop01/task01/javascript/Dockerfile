FROM node:20

# Install the application

# Create /app & cd into the /app
WORKDIR /app

# copy applications files and directory into /app
COPY package.json .
COPY package-lock.json .
COPY main.js .
# Cannot put . cause will "unzip" it
COPY public public
COPY views views

# run npm ci
RUN npm ci 

# RUN the application
ARG INSTANCE_NAME=dov-bear
ARG INSTANCE_HASH=HASHER
ENV PORT=5000

# What port to bind to
EXPOSE ${PORT}

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD curl -f http://localhost:${PORT}/healthz || exit 1

# How to start the program
# uses exec -v 
ENTRYPOINT [ "node","main.js" ] 
# uses shell
# ENTRYPOINT node main.js 
