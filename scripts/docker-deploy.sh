#!/bin/bash
# Docker deploy script - uses dedicated deploy key for GitHub

set -e

# Ensure .ssh directory exists with correct permissions
mkdir -p /root/.ssh
chmod 700 /root/.ssh

# The deploy key is mounted at /root/.ssh/id_ed25519
# Copy it so we can set permissions (mounted read-only)
if [ -f /root/.ssh/id_ed25519 ]; then
    cp /root/.ssh/id_ed25519 /tmp/deploy_key
    chmod 600 /tmp/deploy_key
fi

# Create SSH config for GitHub
cat > /root/.ssh/config << 'SSHCONFIG'
Host github.com
    HostName github.com
    User git
    IdentityFile /tmp/deploy_key
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    LogLevel ERROR
SSHCONFIG
chmod 600 /root/.ssh/config

# Configure git
git config --global user.email "${GIT_AUTHOR_EMAIL:-contact@paperswelove.org}"
git config --global user.name "${GIT_AUTHOR_NAME:-Papers We Love}"

# Run the deploy
exec bundle exec middleman deploy
