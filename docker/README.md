# hiera_keyvault example

## Description
A sample setup for hiera_keyvault function

Creates a standalone puppet server container and populates with sample puppet repo
## Usage
To use this you will need to:

1. Set up an Azure keyvault and add a secret named the-secret
1. Copy `code/sample_hiera.yaml` to `code/hiera.yaml` and edit as necessary
1. Copy `code/data/sample_keyvault.conf` to 'data/keyvault.conf'
1. Generate eyaml keys and edit `data/keyvault.conf`
```sh
./puppet_server.sh createkeys
bundle exec eyaml edit data/keyvault.conf
```
1. Add git ssh keys to the `puppet-server` folder e.g:
``` 
puppet-server/.ssh/       # For git repo ssh access 
    id_rsa
    id_rsa.pub  
puppet-server/keys/       # For eyaml 
    private_key.pkcs7.pem  
    public_key.pkcs7.pem
```
1. Build, start and attach to the puppet server:
```sh
./puppet_server.sh build
./puppet_server.sh start
./puppet_server.sh attach
```
1. Run Install the function and gems in the attached puppet server
```sh
cd /etc/puppetlabs/code/environments/production
r10k puppetfile install
puppet agent -t
```
1. You can then test using:
```sh
puppet lookup not_secret --explain    # normal hiera yaml lookup
puppet lookup eyaml_secret --explain  # secret encrypted with eyaml
puppet lookup the-secret --explain    # secret from key vault
```
1. To stop the puppet server (this will also remove the container)
```sh
./puppet_server.sh stop
```