#! /usr/bin/env bash

#Check for updates
echo Downloading latest version...

rm -rf /sheep/*.jar

curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o /sheep/sheepit-client.jar


#Autodetect cores
if [ $cpu -eq 0 ]; then
    echo No thread count specified, autodetected `nproc` threads.
    cpu=`nproc`
fi

echo Starting client...
if [[ $UI_MODE == "DARK" ]];
then
	echo "switching to dark mode"
	# fix background color (I have no idea how to do that properly soo yeah)
	sed -i -e 's/<body>/<body style="background-color: #292b2d">/g' /opt/novnc/index.html
	java -jar /sheep/sheepit-client.jar -cores $cpu -cache-dir /tmp -login $USER_NAME -password $USER_PASSWORD -theme dark
fi

java -jar /sheep/sheepit-client.jar -cores $cpu -cache-dir /tmp -login $USER_NAME -password $USER_PASSWORD -theme light
