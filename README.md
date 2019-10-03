# A simple dockerized SheepIt render farm client with webUI and CUDA support

This docker image is based on [@AGSPhoenix's](https://github.com/AGSPhoenix/sheepit-docker) Docker image and adds a WebUI and CUDA support for rendering on Nvidias GPUs.

---

In order to make this image work, you need to have [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker) installed in order to enable passthru to the nvidia card(s).

You will also need to have the [Nvidia-CUDA-toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64)  to be installed on your host system.


## Instructions
#### CPU
```
docker run \
 --name "Sheepit Client" \
 -p 5800:5800 \
 -p 5900:5900 \
zocker160/sheepit-docker-webui:latest
```
#### GPU
```
docker run \
 --name "Sheepit Client" \
 --runtime=nvidia \
 -p 5800:5800 \
 -p 5900:5900 \
zocker160/sheepit-docker-webui:nvidia
```

Additional parameters:

- `cpu` to override autodetection; like `-e cpu=4`.
- `VNC_PASSWORD` specify a password to connect to the GUI
- `KEEP_APP_RUNNING` when set to `1`, the application will be automatically restarted if it crashes or if user quits it; default: `0`

##### You should be able to access the Sheepit-GUI by opening in a web browser:

`http://[HOST IP ADDR]:5800`

##### You can connect with any VNC client of your choise as well:

` [HOST IP ADDR]:5900`

## Extra bits
[Docker Hub page](https://hub.docker.com/r/zocker160/sheepit-docker-webui//)  
[GitHub page](https://github.com/zocker-160/sheepit-docker-webUI)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
