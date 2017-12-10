FROM ubuntu

RUN apt-get -qq update

# install all packages for the installation 
RUN apt-get -y install curl sudo npm git

# install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

# install nitro-generator deps
RUN npm install -g yarn yo generator-nitro

# create user for yeoman
RUN useradd --create-home --shell /bin/bash namics && usermod -aG sudo namics

# set actual user 
USER namics

# create home directory
WORKDIR /home/namics