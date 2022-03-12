# ViewVC 1.2.1 or later (nginx + fcgiwrap) on debian

This is a very lean docker image for https://github.com/viewvc/viewvc/ which is based on debian:xxx-slim.

The web-server runs on port 80.

Example Docker Compose file:

    version: '2'
    services:
      websvn:
        image: yoshihide1981/viewvc
        container_name: viewvc
        ports:
            - "8003:80"
        environment:
            - repository=svn://10.0.1.20/main
        restart: always

- GitHUB  
https://github.com/YoshihideShirai/docker-viewvc
- dockerhub  
https://hub.docker.com/r/yoshihide1981/viewvc
