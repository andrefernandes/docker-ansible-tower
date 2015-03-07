Ansible Tower
=============

Ansible Tower in a container.

## How to use

You must start a postgres container before starting the Tower
container.

## How did I pull it off?

Tower installation demands "systemd", wich is a no-no on containers.
I had to remove "fakesystemd" and rely on tricks stolen from other
images to install systemd in a safe way. Shamefully I forgot the
sources (will fix it as soon as I can).

I also had to change several playbooks from the installation, because
"service" tasks are also broken on containers. The "roles" folder contains
the modified playbook files.

This image can't be built on a single "docker build" run because it depends
on a link to another container (the database). So there are a few manual
steps to produce the final version.

## Now what? How can I build it?

Building this image is a three-step task:

* Start the database container (this creates a data volume and a known db admin user):

    ./runsql.sh

* Build the tower container (resulting mage is still useless):

    ./build.sh

* Change whatever you want tower_setup_conf.yml and inventory files

* Run the tower container on "setup mode" (this will populate the database and
  creates a "towerinstall" temporary container *and* will populate the volume at
  '/opt/data/tower'):

    ./runinstall.sh

* Commit the "towerinstall" container into the final image:

    docker commit towerinstall andrefernandes/docker-ansible-tower

* Please observe the mount points that must be managed:

    * /opt/data/tower : this is mounted as "/etc/tower" by both *runinstall.sh* (that
      populates it) and *runtower.sh* (uses it).




