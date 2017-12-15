FROM ubuntu

RUN apt-get -qq update

# install all packages for the installation 
RUN apt-get -y install curl sudo npm git --fix-missing

# install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

# install nitro-generator deps
RUN npm install -g yarn yo generator-nitro

# create user for yeoman
RUN useradd --create-home --shell /bin/bash namics && usermod -aG sudo namics

# install dependency for npm package
RUN apt-get install -y libpng-dev

# sets the actual working directory inside the docker-container
# all commands are now extecuted in it.
WORKDIR /home/namics

# Copy all relevant files and folders from nitro.
# This files should be created by the architect of the project.
# In my opinion the developer should not care about the the architecture
# of the Software. Thus this two parts are splitted, the docker-container,
# will be shipped with the whole architectur of the frontend project.
# What needs a Frontend Engineer --> The Sourcecode on the local machine! 
COPY ./nitro/package.json /home/namics
COPY ./nitro/gulp /home/namics/gulp
COPY ./nitro/config /home/namics/config
COPY ./nitro/app /home/namics/app
COPY ./nitro/tests /home/namics/tests
COPY ./nitro/project /home/namics/project

# Prepare the docker-image for mapping the two folders on the 
# developers local machine.
RUN mkdir public
RUN mkdir src

# install all packages, which are listed in package.json
# All packages are downloaded and installed on buildtime of the dockercontainer.
RUN npm install