#!/bin/bash
# creates tower user and group
if egrep -i "^tower" /etc/group; then
  echo "Group 'tower' exists, skipping group creation...";
else
  sudo groupadd -g 5004 -r tower
fi
if egrep -i "^tower" /etc/passwd; then
  echo "User 'tower' exists, skipping user creation...";
else
  sudo useradd -r -u 5004 -c "Tower user" -m -d /opt/data/tower -g 5004 tower
fi
# run installation
docker run --name towerinstall -t -i --privileged \
  --link postgres:postgres \
  -v /opt/data/tower:/etc/tower \
  andrefernandes/docker-ansible-tower:latest /opt/ansible-tower-setup/setup.sh -c /opt/tower_setup_conf.yml -i /opt/inventory

