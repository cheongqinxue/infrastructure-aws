#!/bin/bash
# Install SSM Agent
yum install -y amazon-ssm-agent

# Start and enable the SSM Agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent