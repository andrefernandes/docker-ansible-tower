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
"service" tasks are also broken on containers.


