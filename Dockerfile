# we'll use the version 9 of node
FROM node:10

# Create app directory
WORKDIR /usr/src/app

# COPY package.json package-lock.json from host into docker (those are the files that hold the list of dependencies of the app).
COPY package.json .  
COPY package-lock.json .  

# Install app dependencies
RUN npm install

# Bundle app source
COPY . /usr/src/app

# "Create React App" starter kit comes with the build command which will build the app app and put it in the build folder
RUN npm run build

# expose prot 3050 to the outside world
EXPOSE 3050

# run command to start the app that was just built
CMD [ "npm", "run", "prod" ]