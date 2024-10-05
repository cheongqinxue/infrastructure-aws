#!/bin/bash
set -xe

find terraform -maxdepth 1 \
    -type d \( ! -name terraform \) \
    -exec sh -c 'fname="$1"; cd "$fname" && tfenv install min-required && tfenv use min-required && terraform init' shell {} \;