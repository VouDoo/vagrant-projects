#!/bin/sh
#
# install LocalStack on "centos/7" box.
#
# note: do not run this script as "root" user, run it as "vagrant" user.
#
# related documenation(s):
# - Get LocalStack Up and Running <https://docs.localstack.cloud/get-started/>
# - AWS Command Line Interface (CLI) with LocalStack <https://docs.localstack.cloud/integrations/aws-cli/>

# install LocalStack Python module
python3 -m pip install --user localstack

# install awscli-local Python module (wrapper for LocalStack)
python3 -m pip install --user awscli-local

# set default AWS credentials (access for LocalStack)
mkdir -p ~/.aws
sudo tee ~/.aws/credentials <<EOF
[default]
aws_access_key_id=test
aws_secret_access_key=test
EOF
