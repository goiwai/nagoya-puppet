# Puppet module for Kato-san/KMI

See <https://wiki.kek.jp/display/belle2crc/StoRM+Puppet+Module+for+Kato-san+KMI> for detailed instruction.

!See <https://wiki.kek.jp/display/belle2crc/StoRM+Puppet+Module+for+Kato-san+KMI> for detailed instruction.

## Grid-UI Setup Example

```shell
# install puppet5
% sudo yum install https://yum.puppetlabs.com/puppet5-release-el-7.noarch.rpm
% sudo yum install puppet-agent

# install git and something else
% sudo yum install git

% cd /mnt
% sudo git clone https://github.com/goiwai/nagoya-puppet.git

# copy a pair of PKCS#7 keys (not contained in the Git repo)
% sudo cp /path/to/keys/*.pem /mnt/nagoya-puppet/keys/

# general setup
% sudo puppet apply --test /mnt/nagoya-puppet/setup.pp

# service-specific setup
% sudo puppet apply --test /etc/puppetlabs/code/environments/production/manifests/grid-ui.pp
```
