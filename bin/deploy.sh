#!/usr/bin/env bash

# Import the SSH deployment key
openssl aes-256-cbc -K $encrypted_32b6c04b6d48_key -iv $encrypted_32b6c04b6d48_iv -in deploy-key.enc -out ~/.ssh/deploy-key -d
mv deploy-key ~/.ssh/id_rsa

ssh $SERVER_USER@$SERVER_IP:22 "cd SpaceX-API && git checkout master && git pull && yarn --production && pm2 reload spacex-api"