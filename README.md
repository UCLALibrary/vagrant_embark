# Vagrant-Embark

A simplistic Vagrant dev environment for starting any sort of web development project that will run on CentOS or RedHat Enterprise Linux/RHEL, and do so with Ansible for provisioning. Uses [Librarian-Ansible](https://github.com/bcoe/librarian-ansible) to handle downloading Ansible roles.

Need more roles? Add them to the Ansiblefile. Call them in the playbook.

This is totally a work in progress, use at your own risk.

## Requirements

* [Virtualization support must be enabled](http://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/), if you have a BIOS-based computer (aka a PC).
* [Vagrant](http://vagrantup.com/) version 1.8.3 or above.
* [VirtualBox](https://www.virtualbox.org/)
* (Optional) A GitHub account with an associated SSH key. This is NOT required, but if you plan to do development with this project and/or create Pull Requests, it is recommended. If you have a local [SSH agent](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) running (or [Pageant/PuTTY](http://www.putty.org/) on Windows, or the [OSX Keychain with a saved passphrase](https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically)), Vagrant will attempt to automatically forward your local SSH key(s) to the VM, so that you will be able to immediately interact with GitHub via SSH on the VM. However, if you are *not* running a key agent, *even if your SSH key does not have a passphrase*, Vagrant will *not* prompt you to enter your passphrase, it will simply fail to run all the provisioning processes. We urge you to consider running a key agent with your SSH key, it will make your life so much more simple.
 * *WARNING:* If you are using an SSH key, we highly recommend that you use an RSA key. The base OS we use, Ubuntu 16.04LTS, uses OpenSSH 7.0, which [*disallows* DSA keys by default](http://viryagroup.com/what-we-do/our-blog-posts/hosting-and-linux-server-managment-blog/ssh-keys-failing-in-ubuntu-16-04-xenial-with-permission-denied-publickey). You can of course work around this, but OpenSSH made this choice for a reason, you will probably be happier in the long run if you switch to an RSA key.

## Do I need to install Ansible?

No, this project uses the [Ansible Local Provisioner](https://www.vagrantup.com/docs/provisioning/ansible_local.html) for Vagrant. That means Ansible is installed and run from the guest VM. You only need the above-mentioned requirements.


## How to use

Standard Vagrant protocol: clone this repository, cd to the root of it, and run

```
vagrant up
```

## Vagrant Plugin Recommendations

Vagrant has a robust community of plugin developers, and some of the plugins are quite nice. [Installing a Vagrant plugin](https://www.vagrantup.com/docs/plugins/usage.html) is simple.

The following Vagrant plugin is *highly-recommended*, if you use a base box with a small drive space allocation (many base box images do this to minimize download time). Installing the Vagrant-Disksize plugin is a good insurance policy, and will help.

* [Vagrant-Disksize](https://github.com/sprotheroe/vagrant-disksize)

The following Vagrant plugins are not required, but they do make using Vagrant more enjoyable.

* [Vagrant-VBGuest](https://github.com/dotless-de/vagrant-vbguest) - *Highly Recommended for VirtualBox* as it keeps VirtualBox Guest Additions up to date
  * `vagrant plugin install vagrant-vbguest`
* [Vagrant-Cachier](https://github.com/fgrehm/vagrant-cachier) - Caches packages between VMs. (Project now unmaintained, see URL)
* [Vagrant-Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
* [Vagrant-Proxyconf](https://github.com/tmatilai/vagrant-proxyconf/)
* [Vagrant-VBox-Snapshot](https://github.com/dergachev/vagrant-vbox-snapshot/)
* [Vagrant-Notify](https://github.com/fgrehm/vagrant-notify)


## Attribution

I've borrowed freely from the following projects:

* [Vagrant-DSpace](http://github.com/dspace/vagrant-dspace) (a bunch of shell provisioners)
* [Double-p/smtf-test](https://github.com/double-p/smtf-test) (inspiration for the Ansible Local provisioner layout)
* [Geerlingguy's Ansible-Vagrant Examples](https://github.com/geerlingguy/ansible-vagrant-examples)


## License

[MIT](https://github.com/hardyoyo/vagrant-ansible-hyrax/blob/master/LICENSE)
