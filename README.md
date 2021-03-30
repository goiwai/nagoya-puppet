# Puppet module for Kato-san/KMI

See <https://wiki.kek.jp/display/~iwai/StoRM+Puppet+Module+for+Kato-san+KMI> for detailed instruction.

## Grid-UI Setup

```shell
# install puppet5
% sudo yum install https://yum.puppetlabs.com/puppet5-release-el-7.noarch.rpm
% sudo yum install puppet-agent
 
# install git and something else
% sudo yum install git

% cd /mnt
% git clone https://github.com/goiwai/nagoya-puppet.git
 
% sudo puppet apply --test /mnt/nagoya-puppet/setup.pp

% sudo puppet apply --test /etc/puppetlabs/code/environments/production/manifests/grid-ui.pp
```
