puppet-jenkins
==============

Puppet manifest to configure and install Jenkins


How to use this manifest
------------------------

At the moment this manifest is meant to be run without a Puppet server (to change soon).  Clone this repository in /etc/puppet/modules:

```
cd /etc/puppet/modules
git clone git://github.com/baremetal/puppet-jenkins.git jenkins
```

Then apply the manifest by running:

```
sudo puppet apply /etc/puppet/modules/jenkins/manifests/init.pp
```
