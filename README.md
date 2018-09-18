# A simple dockerized SheepIt render farm client with webUI

This docker image is based on [@AGSPhoenix's](https://github.com/AGSPhoenix/sheepit-docker) Docker image.

## Instructions
Pretty similar to @AGSPhoenix's:

```
docker run \
 --name "Sheepit Client" \
 -p 5800:5800 \
zocker160/sheepit-docker-webui:latest
```

Additional parameters:

- `cpu` to override autodetection; like `-e cpu=4`.
- `VNC_PASSWORD` specify a password to connect to the GUI

#####You should be able to access the Sheepit-GUI by opening in a web browser:

`http://[HOST IP ADDR]:[port]`



## Extra bits
[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-docker-webui//)  
[GitHub page](https://github.com/zocker-160/sheepit-docker-webUI)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
