# Host Certificate

## `hostkey.pem` -> `encrypted-hostkey.pem`

```shell
% pwd
/Users/iwai/grid-vm-config/puppet/kekcc/files/certs

# encrypt private keys
% for d in *.local; do cd $d; if test -f hostkey.pem; then cmd="/opt/puppetlabs/puppet/bin/eyaml encrypt --file=hostkey.pem --output=string --pkcs7-public-key=$HOME/grid-vm-config/nagoya-puppet/keys/public_key.pkcs7.pem --pkcs7-private-key=$HOME/grid-vm-config/nagoya-puppet/keys/private_key.pkcs7.pem | tr -d '[:cntrl:]' > encrypted-hostkey.pem"; echo $cmd; eval $cmd; fi; cd ..; done

# do not commit or push private keys to any public repository
% rm */hostkey.pem

# decrypt encripted private keys
% for d in *.local; do cd $d; if test -f encrypted-hostkey.pem; then cmd="/opt/puppetlabs/puppet/bin/eyaml decrypt --file=encrypted-hostkey.pem --pkcs7-public-key=$HOME/grid-vm-config/nagoya-puppet/keys/public_key.pkcs7.pem --pkcs7-private-key=$HOME/grid-vm-config/nagoya-puppet/keys/private_key.pkcs7.pem > decrypted-hostkey.pem"; echo $cmd; eval $cmd; chmod 400 decrypted-hostkey.pem; fi; cd ..; done
```
