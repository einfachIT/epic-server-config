# epicconfig

Stores einfach IT Infrastructure configurations.

## Acceptance Environment
- ssh_tor hostname: ubhkxntypimkfegke3fggj4ope4loh2uh4odywuwbsdphw5gwjqif7id.onion
- users:
  - testuer/peterpan
  - testadmin/peterpan   

Secrets are encrypted using ansible_vault in secrets_<ENV>.yml

## Prerequisites
run the following commands to setup the environment
```console
sudo apt update
sudo apt -y upgrade
sudo apt -y install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  python3 \
  python3-pip \
  python3-venv \
  sshpass
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce-cli
sudo apt-get install -y rustc
```

if you do not use the source.me script to built a virtualenv install also the needed python packages:
```console
pip install --upgrade pip
pip install ansible docker passlib
```
