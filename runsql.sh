# tem que fazer no centos 7
#sudo chcon -Rt svirt_sandbox_file_t /opt/data/ansibledb/
docker rm postgres
docker run --name postgres -d \
  -e POSTGRES_PASSWORD=ansible \
  -e POSTGRES_USER=ansible \
  -v /opt/data/ansibledb:/var/lib/postgresql/data \
  postgres

