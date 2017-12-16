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
│   ├── src --> nitro 'src' folder
│   ├── public --> nitro 'public' folder
│   └── package.json --> DevDependencies for the applicaton
```
## Summary
During buildtime all needed folders of the nitro generator are copied in the container itself. After copy all need files, the npm command is exectued to install all dependencies for the project. This are all described in the package.json copied from the nitro generator. 
