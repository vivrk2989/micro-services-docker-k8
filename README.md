# micro-services-docker-k8

![Image Link]()


### Docker Setup for windows
Docker WSL2/Linux subsystem on windows
- Install Docker Desktop on Window - https://docs.docker.com/desktop/windows/install/
- Change Hyper V settings 
- Enable WSL2 and Linux subsystem

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



