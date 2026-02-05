#!/bin/bash

curl -o bootstrap-salt.sh -L https://github.com/saltstack/salt-bootstrap/releases/latest/download/bootstrap-salt.sh
sudo sh bootstrap-salt.sh -P stable 3007.11
