rails-cookbook
==============

ruby, node, mysql, nginx



cook before
-----------

node

```bash
$ yum update -y
$ useradd ${WORK_USER}
$ passwd ${WORK_USER}
$ usermod -G wheel ${WORK_USER}
$ visudo
## Same thing without a password
%wheel  ALL=(ALL)       NOPASSWD: ALL

$ su ${WORK_USER}
$ mkdir ~/.ssh
$ chmod 700 ~/.ssh
```

workstation: generate key

```bash
$ cd ~/.ssh
$ ssh-keygen -t rsa -v
$ chmod 600 ~/.ssh/id_rsa.pub
$ scp ~/.ssh/id_rsa.pub ${WORK_USER}:${NODE_HOST} ~/.ssh/authorized_keys
```

node

```bash
$ chmod 644 ./authorized_keys
$ vim /etc/profile.d/newrelic_license_key
export NEWRELIC_LICENSE_KEY=${NEWRELIC LICENSE KEY}
```

workstation

```bash
$ knife solo prepare ${WORK_USER}:${NODE_HOST}
```

