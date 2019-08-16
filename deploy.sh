#!/bin/bash

stg=$1
[ "$stg" = "" ] && stg="dev"

handler_dir="./src/handler"
bin_dir="./.aot"

rm -rf ./bootstrap $bin_dir
mkdir $bin_dir

cat <<EOF > ./bootstrap
#!/bin/sh

bin_dir="\$LAMBDA_TASK_ROOT/.aot"
\$bin_dir/dartaotruntime \$bin_dir/\$_HANDLER.dart.aot
EOF
chmod +x ./bootstrap || exit 1

docker run --rm -v $(pwd):/work -w /work google/dart cp /usr/lib/dart/bin/dartaotruntime ./.aot
sudo chmod +x $bin_dir/dartaotruntime || exit 1

pub get || exit 1

cat ./serverless.yml |
grep 'handler'       |
awk '{print $2}'     |
while read line; do
    dart2aot $handler_dir/$line.dart $bin_dir/$line.dart.aot || exit 1
done &&
sls deploy -s $stg

