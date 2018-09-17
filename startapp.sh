#!/bin/sh

#Check for updates
echo Downloading latest version...

rm -rf /sheep/*.jar

curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o /sheep/sheepit-client.jar


#Autodetect cores
if [ $cpu -eq 0 ]; then
    echo No core count specified, autodetected `nproc` cores.
    cpu=`nproc`
fi

echo Starting client...
java -jar /sheep/sheepit-client.jar -cores $cpu -cache-dir /sheep/cache
