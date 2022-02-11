#!/bin/sh

cd $(dirname $0)
cd ..
. tests/common.sh

setup

OUTPUT=$(docker run --rm $IMAGE list)
assert $? 1
assert "$OUTPUT" $'MARK'

mkdir -p tests/data/empty
mkdir -p tests/data/almost/empty
mkdir -p tests/data/cool/
touch tests/data/cool/some.file
touch tests/data/cool/some.file2

OUTPUT=$(docker run --rm -v $(pwd)/tests/data:/output:ro $IMAGE list)
assert $? 0
assert "$OUTPUT" $'MARK\n/output/cool/some.file2\n/output/cool/some.file'
