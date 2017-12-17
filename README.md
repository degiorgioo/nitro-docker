# Generator Nitro meets Docker
This Repository was created for a practical training in the Namics office located in Zurich. The main purpose of this project, is to outsource the nitro generator (https://github.com/namics/generator-nitro). 

# Division of Concern
## Architecture
In my opinion the Developer shouldn't waste time to build the architecture of the Frontend Development environemnt. This should be done by an experienced Frontend Architect, who knows what technolgies should be used. In this case, the artchitect is responsible for the creation of Docker Image.

## Sourcecode
What is the most important thing for a Software Engineer? The Sourceode. Thus he / she should only be responsible for Sourcecode. 


# Docker Image
## Packages
The Docker Image is based on the latest Ubuntu and has the following packages installed: 
* curl
* npm
* git
* NodeJS 6.x
* yarn
* yeoman with generator-nitro

## Folder structure
```
/
├── home/namics
│   ├── node_modules --> node modules for the application
│   ├── app --> nitro 'app' folder
│   ├── config --> nitro 'config' folder
│   ├── tests --> nitro 'tests' folder
│   ├── gulp --> nitro 'gulp' folder
│   ├── projects --> nitro 'projetcs' folder
│   ├── src --> folder for the develop
│   ├── public --> folder for the assets
│   └── package.json --> DevDependencies for the applicaton
```
## Summary
During buildtime all needed folders of the nitro generator are copied in the container itself. The main purpose for the container should be, to set the enivornment for the developers. The architecture for the application and all needed files for builing and developing the application should be in it. The Developer is not responsible for the environment but the container should give them the opportunity to develop the application. 

## Docker-compose
To run the container the docker-compose helper is used. This file maps all folders for the development and expose all needed ports.

# Start developing
The structure of the project is organized as following:
```
project-folder/
├── .
│   ├── nitro --> All nitro files
│   └── project --> All development files
```
In the folder named 'project', all files for the application should be placed in. When the container starts, it runs the command ```npm run dev```, which watches all the files in this folder.

When all needed files are in in it, the following command can be used to starts the system:

```
docker-compose up
```