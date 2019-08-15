#!/bin/bash

stg=$1
[ "$stg" = "" ] && stg="dev"

handler_dir="./src/handler"
bin_dir="./.aot"

rm -rf $bin_dir
mkdir $bin_dir

docker run --rm -v $(pwd):/work -w /work google/dart cp /usr/lib/dart/bin/dartaotruntime ./.aot
sudo chmod +x $bin_dir/dartaotruntime || exit 1

pub get || exit 1

cat ./serverless.yml |
grep 'handler' |
awk '{print $2}' |
while read line; do
    dart2aot $handler_dir/$line.dart $bin_dir/$line.dart.aot || exit 1
done &&
sls deploy -s $stg

