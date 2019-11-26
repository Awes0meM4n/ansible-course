## For Ubuntu users

Vagrant (tested with 2.2.6), virtualbox (tested with 5.2.32_Ubuntu r132056)

```
# Install Virtualbox
$ apt install -y virtualbox=5.2.32-dfsg-0~ubuntu18.04.1

# Install Vagrant (from repo)
$ apt update
$ apt install -y apt install vagrant=1:2.2.6

# Install Vagrant (from official web)
$ wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
$ sudo dpkg -i vagrant_2.2.6_x86_64.deb
```

## For Windows users
Vagrant (tested with 2.2.6), virtualbox (tested with 5.2.32)

* **Virtuabox installation**

   Download and install from https://download.virtualbox.org/virtualbox/5.2.32/VirtualBox-5.2.32-132073-Win.exe

* **Vagrant installation**

   Download and install from https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.msi

   You must ensure that Hyper-V is not enabled on Windows. You can turn off the feature by running this Powershell command:

   ```
   Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
   ```

# Usage

Before creating the cluster environment we can download the vagrant box base we will be using during the course Labs. In order to do that, we can use Vagrant CLI:

```
$ vagrant box add centos/7 --box-version 1710.01 --provider virtualbox
```

After the box is downloaded, we can create the cluster environment using Vagrant CLI:

```
$ vagrant up
```

When the cluster is created, we can access to the instances using Vagrant CLI:

```
$ vagrant ssh server1
$ vagrant ssh server2
$ vagrant ssh server3
```
