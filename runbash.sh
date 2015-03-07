ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
#echo "ENVBASH=$ENVBASH"
docker run --rm -t -i -p 80:80 -p 443:443 --privileged \
  --link postgres:postgres \
  -v /opt/data/tower:/etc/tower \
  andrefernandes/docker-ansible-tower:latest $ENVBASH ${@:2}

