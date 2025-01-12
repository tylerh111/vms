# Development VMs

## Vagrant

### **Environment**

It is recommended to install vagrant from the official vagrant packages.
See [Install Vagrant](https://developer.hashicorp.com/vagrant/install) for more information.

### **Usage**

User the following command to interact with vagrant vms.
All vms are defined within the Vagrantfile in the repository root.
User the "name" of the vm to control that vm.

```bash
# control
vagrant up        <name>  # start
vagrant provision <name>  # provision
vagrant reload    <name>  # restart
vagrant suspend   <name>  # suspend
vagrant resume    <name>  # resume
vagrant halt      <name>  # stop
vagrant destroy   <name>  # delete
vagrant snapshot  <name>  # save

# information
vagrant status [<name>]
vagrant port   [<name>]

# connect
vagrant ssh <name>
vagrant rdp <name>
vagrant upload <source> <destination> <name>  # upload file
```

### **Organization**

The following is the organization of the `vagrant` section of the repository.

* `vagrant`: vagrant related files that define vms.
  * Each file must be named `vagrantfile.*.rb`.
  * Each file must have the function `vagrant_define_vm` that takes `Vagrant` and `config`.
* `vagrant/provision`: scripts and configs for setting up a vm.
* `vagrant/provision/configs`: system and user configurations that can used for any vm.
* `vagrant/provision/os`: scripts for specific os versions.
  * All scripts should be categorized by distribution and distribution version.
* `vagrant/provision/extra`: extraneous shared scripts and configs.
  * Only scripts that are not os dependent can be shared.
* `vagrant/vagrantfile`: the overall vm configurations.
  * It includes all vagrant files in `vagrant/`.

```bash
/vms
|-- vagrant
    |-- provision
    |   |-- configs
    |   |   |-- home
    |   |   |-- sys
    |   |-- extra
    |   |-- os
    |       |-- <distro>
    |           |-- <version>
    |-- vagrant
    |-- vagrantfile
```
