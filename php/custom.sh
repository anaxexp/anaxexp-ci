#!/usr/bin/env bash

# The following example
# 1. Installs your dependencies from composer.json
# 2. Builds and pushes default images with contents of the current directory (./)
# 3. Deploys build to your app instance

wget -qO- https://api.anaxexp.com/api/v1/get/cli | sh
anaxexp ci init $ANAXEXP_INSTANCE_UUID
anaxexp ci run -v $HOME/.composer:$HOME/.composer -s php -- composer install --prefer-dist -n --no-dev
anaxexp ci build
anaxexp ci release
anaxexp ci deploy
