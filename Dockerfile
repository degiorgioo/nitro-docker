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

RUN apt-get install -y libpng-dev

# set actual user 

ADD ./nitro/package.json /home/namics
ADD ./nitro/gulpfile.js /home/namics
ADD ./nitro/gulp /home/namics/gulp
ADD ./nitro/config /home/namics/config
ADD ./nitro/app /home/namics/app
ADD ./nitro/tests /home/namics/tests
ADD ./nitro/project /home/namics/project

WORKDIR /home/namics

RUN npm install

ADD . ./example_project