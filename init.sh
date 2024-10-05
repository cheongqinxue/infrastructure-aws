#!/bin/bash

if [ -z "$0" ]; then
    echo "Configuring base environment for terraform"
    conda activate base
else
    echo "Configuring environment for $0"
    conda activate $0
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

# check if NPM is installed
if ! command -v npm &> /dev/null; then
    echo "NPM could not be found, installing..."
    apt update
    apt install -y npm
    echo "NPM installed successfully. version=$(node -v)"
fi

echo "Installing markdownlint-cli & markdown-link-check"
npm install -g markdownlint-cli
npm install -g markdown-link-check

# make sure xz is installed
if ! command -v xz &> /dev/null
then
    echo "xz could not be found, installing..."
    apt update
    apt install -y xz-utils
    echo "xz installed successfully"
fi

echo "Installing shellcheck"
scversion="stable" # or "v0.4.7", or "latest"
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
cp "shellcheck-${scversion}/shellcheck" /usr/bin/
shellcheck --version

conda install typos