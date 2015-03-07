
#FROM andrefernandes/docker-sshd:latest
FROM andrefernandes/docker-systemd-sshd:latest

MAINTAINER Andre Fernandes

RUN yum install -y ansible && \
    yum clean all

ADD tower_setup_conf.yml /opt/tower_setup_conf.yml
ADD inventory /opt/inventory

RUN cd /opt && \
    wget http://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz -q -O /opt/ansible-tower-setup.tar.gz && \
    tar -xzf ansible-tower-setup.tar.gz && \
    ln -s ansible-tower-setup-2.1.1 ansible-tower-setup && \
    rm ansible-tower-setup.tar.gz && \
    groupadd -g 5004 -r awx && \
    useradd -r -u 5004 -c "Tower user" -g 5004 awx

ADD roles /opt/ansible-tower-setup/roles

#RUN cd /opt/ansible-tower-setup && \
#    ./setup.sh -c /opt/tower_setup_conf.yml -i /opt/inventory

EXPOSE 80 443

VOLUME [ "/etc/tower" ]
VOLUME [ "/sys/fs/cgroup" ]

