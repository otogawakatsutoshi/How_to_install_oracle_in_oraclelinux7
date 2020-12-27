# How_to_install_oracle_in_oraclelinux

```shell
# experiment in oracle linux 8

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
# How to use these scripts
this project has vagrant and packer environment.

## vagrant
```shell
# you want to create vagrant environment
cd vagrant
vagrant up
```
oracle-fedora environment is being launch.

## packer
```shell
# you want to create vagrant box dependent virtualbox.
cd packer
packer build --only=virtualbox-iso fedora.json
```
output to *output-virtualbox-iso*

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
