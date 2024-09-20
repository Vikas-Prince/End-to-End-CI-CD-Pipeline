# base-image
FROM node:18

# meta data
LABEL createdby="Vikas"

# working directory in container
WORKDIR /app

# Copying package files into app directory
COPY package*.json ./

# Installing packages
RUN npm i

# Copying remaining code into container
COPY . .

# exposing the port on 4000
EXPOSE 4000

# start command to express server
ENTRYPOINT ["npm", "start"]


