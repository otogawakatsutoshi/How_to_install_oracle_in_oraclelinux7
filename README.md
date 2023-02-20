# How_to_install_oracle_in_oraclelinux

```shell
# experiment in oracle linux8


# silent install oracle database.
mkdir /xe_logs 
ORACLE_PASSWORD=yourpassword
curl -o oracle-database-xe-18c-1.0-1.x86_64.rpm -L https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-18c-1.0-1.x86_64.rpm
dnf -y install oracle-database-xe-18c-1.0-1.x86_64.rpm > /xe_logs/XEsilentinstall.log 2>&1
sed -i 's/LISTENER_PORT=/LISTENER_PORT=1521/' /etc/sysconfig/oracle-xe-18c.conf
(echo $ORACLE_PASSWORD; echo $ORACLE_PASSWORD;) | /etc/init.d/oracle-xe-18c configure >> /xe_logs/XEsilentinstall.log 2>&1
```

```shell
# oracle database launch and, be available.

# these command is operationing in oracle user. oracle is OS user.oracle user belong to dbaoper.
echo "startup;" | sqlplus / as sysdba
launchctl start
```
# example script
this project has Vagrantfile.
```shell
vagrant up
```
oracle-fedora environment is being launch.

# install sample schemas

```shell
# change user and read .bash_profile.
sudo su
source ~/.bash_profile

# execute bash function.
enable_sampleschema

# if you uninstall schema, execute below function
disable_sampleschema
```

# if you want to create vagrant box from vagrant file.

```shell
# stop vagrant environment
vagrant halt

# search virtualbox environment.
ls -1 ~/VirtualBox\ VMs/

# packaging your vagrant virtualbox environment. 
vagrant package --base <yourvirtualbox_environment_name> --output oraclelinux8-oracle-xe-18.box

# add box
vagrant box add localhost/oraclelinux8-oracle-xe-18 oraclelinux8-oracle-xe-18.box
```