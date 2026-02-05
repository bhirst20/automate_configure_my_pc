#!/bin/bash

# Ask which IaC tool to install
echo "Which Infrastructure as Code tool would you like to install?"
echo "  1) OpenTofu (default)"
echo "  2) Terraform"
read -p "Enter choice [1]: " iac_choice
iac_choice=${iac_choice:-1}

if [ "$iac_choice" = "2" ]; then
    ./apps/install_terraform.sh
else
    ./apps/install_opentofu.sh
fi

./apps/install_awscli.sh
./apps/install_leapp.sh
