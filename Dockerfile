FROM jlesage/baseimage-gui:debian-10

MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive

RUN \
# MAN folder needed for jre install
     mkdir -p /usr/share/man/man1 \
  && mkdir -p /sheep/cache \
# Install JRE and curl
  && apt-get update \
  && apt-get install -y --no-install-recommends \
	default-jre \
	curl \
	#install Blender to get all dependencies
	#blender
	libsdl1.2debian \
	libxxf86vm1 \
	libgl1-mesa-glx \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	libxfixes3

WORKDIR /sheep
COPY startapp.sh /startapp.sh

RUN APP_ICON_URL=https://www.sheepit-renderfarm.com/media/image/title.png && \
	install_app_icon.sh "$APP_ICON_URL"

ENV APP_NAME="Sheepit Renderclient"
ENV USER_ID="0"
ENV GROUP_ID="0"
ENV DISPLAY=":5"
ENV DISPLAY_HEIGHT="800"
ENV DISPLAY_WIDTH="500"

ENV CLEAN_TMP_DIR="1"
ENV UI_MODE="LITE"
#ENV UI_MODE="DARK"

ENV USER_NAME="username"
ENV USER_PASSWORD="password"
ENV cpu "0"

#VOLUME /sheep
