#! /usr/bin/env bash

#Check for updates
echo Downloading latest version...

rm -rf /sheep/*.jar

if [ "$BETA_CHANNEL" == "true" ] &&  [ "$DOWNLOAD_URL" != "" ]
then
    curl "$DOWNLOAD_URL" -o /sheep/sheepit-client.jar
else
    curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o /sheep/sheepit-client.jar
fi


#Autodetect cores
if [ $cpu -eq 0 ]
then
	cpu=$(nproc)
    echo "No thread count specified, autodetected $cpu threads."
fi

echo Starting client...
if [ "$UI_MODE" == "DARK" ]
then
	echo "switching to dark mode"
	# fix background color (I have no idea how to do that properly soo yeah)
	sed -i -e 's/<body>/<body style="background-color: #292b2d">/g' /opt/novnc/index.html
	theme="dark"
else
	theme="light"
fi

if [ -z $USER_NAME ] || [ -z $USER_PASSWORD ]
then
	java -jar /sheep/sheepit-client.jar -cores $cpu -cache-dir /tmp -theme $theme
else
	java -jar /sheep/sheepit-client.jar -cores $cpu -cache-dir /tmp -login $USER_NAME -password $USER_PASSWORD -theme $theme
fi
