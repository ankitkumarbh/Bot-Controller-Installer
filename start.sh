#!/bin/bash

echo "  Downloading source code ..."
test -d BOT && rm -rf BOT
git clone $REPO_URL BOT

cd BOT

python -m SaitamaRobot
