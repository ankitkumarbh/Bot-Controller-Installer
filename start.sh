#!/bin/bash

echo "  Downloading source code ..."

git clone $REPO_URL BOT

cd BOT

python -m SaitamaRobot
