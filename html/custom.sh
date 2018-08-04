#!/usr/bin/env bash

# The following example
# 1. Installs your dependencies from package.json
# 2. Runs build
# 3. Builds and pushes a docker image (HTTP server) with contents of the build (./build)
# 4. Deploys this image to your HTML app instance

wget -qO- https://api.anaxexp.com/api/v1/get/cli | sh
anaxexp ci init $ANAXEXP_INSTANCE_UUID
anaxexp ci run -i anaxexp/node:8 -- yarn install
anaxexp ci run -i anaxexp/node:8 -- yarn run build
anaxexp ci build --from ./build
anaxexp ci release
anaxexp ci deploy