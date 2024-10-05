#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Configuring base environment for terraform"
    source activate base
else
    echo "Configuring environment for $1"
    source activate $1
fi

echo "Installing pre-commit"
pip install pre-commit

echo "Installing terraform-docs"
curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.18.0/terraform-docs-v0.18.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs ~/terraform-docs

echo "Installing tflint"
curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

echo "Installing tfsec"
curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash
