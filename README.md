# A simple dockerized SheepIt render farm client with webUI

This docker image is based on [@AGSPhoenix's](https://github.com/AGSPhoenix/sheepit-docker) Docker image.

## Instructions
Pretty similar to @AGSPhoenix's:

```
docker run \
 --name "sheepit" \
zocker160/sheepit-docker-webui:latest
```

You can also specify the `cpu` variable to override autodetection; like `-e cpu=4`.

## Extra bits
[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-docker-webui//)  
[GitHub page](https://github.com/zocker-160/sheepit-docker-webUI)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
