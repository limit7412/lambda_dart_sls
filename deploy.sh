#!/bin/bash

stg=$1
[ "$stg" = "" ] && stg="dev"

rm -rf ./bootstrap
pub get || exit 1

# TODO: change use cross compile
sudo docker run --rm -v $(pwd):/work -w /work google/dart bash -c "pub get && dart2native ./src/main.dart -o ./bootstrap" &&
sudo chmod 755 ./bootstrap || exit 1

sls deploy -s $stg &&
pub get


