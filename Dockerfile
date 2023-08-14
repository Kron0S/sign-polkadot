# Use an official Node runtime as the base image
FROM node:20

# Set the working directory in the Docker container
WORKDIR /usr/src/app

# Copy yarn.lock
COPY yarn.lock ./

# Install any needed packages specified in package.json
RUN yarn install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

ENV PROVIDER="wss://westend-rpc-tn.dwellir.com"
ENV SECRET_FILE_NAME="./secret.json"
ENV PASSWORD=""
ENV RAW_TRANSACTION="0x"

# Run the script when the Docker container launches
CMD ["node", "sign-tx.js"]
