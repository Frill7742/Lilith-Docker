#! /bin/bash

cd /home/{user}/.container/lilith/

sudo docker compose up -d

if [ -z "$( ls -A '/home/{user}/.container/lilith/ssl/' )" ]; then
   sudo docker exec -it lilith-lilith-1 apt-get update
   sudo docker exec -it lilith-lilith-1 apt-get install -y --no-install-recommends ca-certificates
   sudo docker exec -it lilith-lilith-1 update-ca-cerificates
else
   echo "Not Empty"
fi

sudo docker exec -t lilith-lilith-1 /lilith/lilith-launcher-linux-s3
