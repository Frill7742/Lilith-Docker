#! /bin/bash

cd ~/.container/lilith/

sudo docker compose up -d

if [ -z "$( ls -A ~/.container/lilith/ssl/ )" ]; then
   sudo docker exec -it lilith-lilith-1 apt-get update
   sudo docker exec -it lilith-lilith-1 apt-get install -y --no-install-recommends ca-certificates
   sudo docker exec -it lilith-lilith-1 update-ca-cerificates
else
   echo "ca certificates are installed."
fi

IP=`sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lilith-lilith-1`

echo "---------------"
echo "IP: ${IP}"
echo "---------------"

sudo docker exec -t lilith-lilith-1 /lilith/lilith-launcher
