FROM jlesage/baseimage-gui:debian-11

MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all

RUN \
    # MAN folder needed for jre install
    mkdir -p /usr/share/man/man1 && mkdir -p /sheep/cache \
    # Install JRE and curl
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    openjdk-11-jre \
    curl \
    xz-utils \
    # Blender dependencies
    libxi6 \
    libsm6 \
    libxrender1 \
    libglu1-mesa \
    libgl1-mesa-glx \
    libxxf86vm1 \
    libxkbcommon0

WORKDIR /sheep
COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh

RUN APP_ICON_URL=https://www.sheepit-renderfarm.com/media/image/title.png && \
	install_app_icon.sh "$APP_ICON_URL"

ENV APP_NAME="Sheepit Renderclient"
ENV USER_ID="0"
ENV GROUP_ID="0"
ENV DISPLAY=":5"
ENV DISPLAY_HEIGHT="900"
ENV DISPLAY_WIDTH="550"

ENV CLEAN_TMP_DIR="1"
#ENV UI_MODE="LITE"
ENV UI_MODE="DARK"

ENV USER_NAME=""
ENV USER_PASSWORD=""
ENV cpu="0"

ENV BETA_CHANNEL="false"
ENV DOWNLOAD_URL=""
