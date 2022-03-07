#!/bin/bash

curl -o ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip || exit $?
unzip ngrok.zip || exit $?
chmod +x ngrok

echo "ssh-rsa $SSH_KEY_PUB" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
echo "Starting sshd..."
sudo systemctl start sshd || exit $?

echo "Starting ngrok..."
./ngrok tcp 22 --authtoken=$NGROK_TOKEN --log=stdout --log-level=debug
echo "ngrok exited $?" 
