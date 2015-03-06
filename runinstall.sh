docker run --name towerinstall -t -i --privileged \
  --link postgres:postgres \
  andrefernandes/docker-ansible-tower:latest /opt/ansible-tower-setup/setup.sh -c /opt/tower_setup_conf.yml -i /opt/inventory

