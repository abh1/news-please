FROM python:latest@sha256:3a7e9a15b93d6729f06ef9262b57a109366581a90f628e0cdb0181184499cf48

RUN apt-get update && apt-get install -y npm curl git make gcc python-dev libffi-dev musl-dev libxml2-dev libxslt-dev openssl libssl-dev zlib1g-dev libjpeg-dev

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copying all the files from your file system to container file system
COPY package.json .

# Install all dependencies
RUN npm install

# Copy other files too
COPY ./ .

RUN git clone https://github.com/fhamborg/news-please.git /news-please
RUN pip3 install -r /news-please/requirements.txt

# Expose the port
EXPOSE 3030

# Command to run app when intantiate an image
CMD ["npm","start"]