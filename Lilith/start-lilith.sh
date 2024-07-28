#! /bin/bash

cd ~/.container/lilith/

sudo docker compose up -d


if [ -z "$( ls -A ~/.container/lilith/ssl/ )" ]; then
   echo "installing ... "
   echo "Please wait a few moments."

   #At the moment, Ubuntu does not have ca-certificates installed, so it will be installed at the first timeAt the moment, Ubuntu does not have ca-certificates installed, so it will be installed at the first time.
   sudo docker exec -it lilith-lilith-1 apt-get update >> /dev/null
   sudo docker exec -it lilith-lilith-1 apt-get install -y --no-install-recommends ca-certificates >> /dev/null
   sudo docker exec -it lilith-lilith-1 update-ca-certificates >> /dev/null
else
   echo "ca certificates are installed."
fi

IP=`sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lilith-lilith-1`

echo "---------------"
echo "IP: ${IP}"
echo "---------------"

sudo docker exec -t lilith-lilith-1 /lilith/lilith-launcher
