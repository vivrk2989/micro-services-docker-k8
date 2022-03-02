# micro-services-docker-k8

# Microservices vs Monolith Architecture

![Image Link](https://github.com/vivrk2989/micro-services-docker-k8/blob/main/Images/monolith%20vs%20microservices.png)

# Docker API Diagram
![Image Link](https://github.com/vivrk2989/micro-services-docker-k8/blob/main/Images/docker%20api%20diagram.png)

### Docker Setup for windows
Docker WSL2/Linux subsystem on windows
- Install Docker Desktop on Window - https://docs.docker.com/desktop/windows/install/
- Change Hyper V settings 
- Enable WSL2 and Linux subsystem

### What is a docker image?
A Docker image is an immutable (unchangeable) file that contains the source code, libraries, dependencies, tools, and other files needed for an application to run.
Due to their read-only quality, these images are sometimes referred to as snapshots. They represent an application and its virtual environment at a specific point in time. Since images are, in a way, just templates, you cannot start or run them. What you can do is use that template as a base to build a container. A container is, ultimately, just a running image. Once you create a container, it adds a writable layer on top of the immutable image, meaning you can now modify it.

### What is a docker container?
A Docker container is a virtualized run-time environment where users can isolate applications from the underlying system. These containers are compact, portable units in which you can start up an application quickly and easily. 
Docker containers provide strong isolation which ensures that they do not interrupt with other running containers. Because of this isolation capability, our machine is much secure.
Docker containers virtualise at the app layer as compared to virtual machines where virtualisation happens at the hardware level. Because of this, containers are extremely lightweight.



### Docker commands
- run `docker` 
- check the version of docker using `docker --version`
- Test connection using `docker run hello-world`
- use `docker images` to see the list of all the images. This will display the `REPOSITORY`, `TAG`, `IMAGE ID`, `CREATED` and `SIZE`
- To delete an image, use `docker rmi <name-of-the-image> -f`
- Use `docker login` to login with your credentials
- If you come across some issues with login like below
![Image Link](https://github.com/vivrk2989/micro-services-docker-k8/blob/main/Images/Docker%20login%20issue.png)
- If the above error occurs, use `alias docker='winpty docker` and try `docker login` again. 
### Examples - use cases and port mapping
- Run `docker run -p 2368:2368 ghost` 
- then go to the browser and paste `localhost:2368` to see the page image running
- I can send it to port 80 using `docker run -d -p 80:2368 ghost`. I will now be able to see the ghost application running on `localhost` on our browser
- use `docker run -d -p 80:80 nginx` and go to browser and paste `localhost` to see nginx running. The first `80` is the host and the second `80` is the container.
- If port 80 is busy, I can send it to port 99 using `docker run -d -p 99:80 nginx` . Now the nginx wont be running with just `localhost` on the browser. We will be able to see nginx if we use `localhost:99`.
- 
### Docker container lifecycle
- to check the containers that are running, use `docker ps`. We can also use `docker ps -a`
- to stop a docker container, use `docker stop <Container ID>`. 
- use `docker run -d -p 2368:2368 ghost` to run it in a dettached mode so that we can use our terminal
- use `docker start <Container ID>` to start a container we created
- to remove a container, use `docker rm <Container ID> -f`
- Delete multiple containers using `docker rm <Container ID1> <Container ID2> -f`

### Docker docs
- `docker run -d -p 4000:4000 docs/docker.github.io`. Once this is running, go to the browser and paste `localhost:4000` to see the official docker docs page which is running on a container

#### Hosting static website with Nginx using docker
- Create a html file `index.html` 
```
<!DOCTYPE html>
<head>
    <title>Welcome to DevOps</title>
</head>
    <body>
        <h1>Hosting static web page</h1>
        <h2>With Docker container</h2>
        <h3>This is a WOW moment!</h3>
    </body>
```
- copy the index.html from localhost to the default location of nginx
- `cd /usr/share/nginx/html/`
- from the folder directory that has our index.html file, use the copy command `docker cp index.html <ContainerName/ID>:/usr/share/nginx/html/index.html`


#### Docker Images
- use `sudo docker login` from the ubuntu terminal with ur credentials
- Now got to you docker hub account and clcik on create repository
![Image Link](https://github.com/vivrk2989/micro-services-docker-k8/blob/main/Images/dcoker%20create%20repository.png)
- name the repository 
- then come back to the terminal and do `sudo docker ps` to get the `Conatiner ID` and `Name` like below
![Image Link](https://github.com/vivrk2989/micro-services-docker-k8/blob/main/Images/Image%20id%20and%20name.png)
- now to commit, use `sudo docker commit <containername-or-id> <nameit>`
- use `sudo docker tag <containername/id> <username>/<reponame>`
- then push it using `sudo docker push <username>/<reponame>`

### Dockerfile-Docker Images-Docker Conatiners
We write a dockerfile script that defines how to build a specific Docker image. The file automatically executes the commands and creates a docker image.
The commands for creating an image from a Dockerfile is docker build.
The image is then used as a template in which we can run our application. The application needs an isolated environment which is our container.


#### Automating 
- create a `Dockerfile` in the same location as the index.html file
```
# from which image - image we used as our base image
FROM nginx

# label to communicate with team members
LABEL MAINTAINER=VIVEK@SPARTAGLOBAL.com

# copy data from localhost to container
COPY index.html /usr/share/nginx/html

# expose port (in this case it was port 80)
EXPOSE 80

# launch/create a container
CMD ["nginx", "-g", "daemon off;"]
```
#### Creating container for my app
- copy the app folder into the right directory
- within this directory, create a `Dockerfile` 
```
FROM node:latest

WORKDIR /usr/src/app

COPY /app /usr/src/app/ 

EXPOSE 3000

CMD ["node", "app.js"]
```
- run docker using `sudo docker run -d -p 80:3000 vivrk2989/docker_app`
- docker commit `<image-id> <username>/<repo-name>:<tag-name>`
- docker push `<username>/<repo-name>:<tag-name>`

#### Build procudtion ready - Multi-stage build
- current image is in working state
- listening on required port - EXPOSE 3000
- copy app folder
- npm install
- npm install express
- CDM [node, app.js]
- `localhost:3000` displays node-app-home-page
- add production ready layer
- find the slimmer/smaller size of image to use `docker hub`
- create alias app for our base image as 
- --from=app path of WRKDIR PATH:new image WORKDIR
- size `105gb` to `250mb` approx
