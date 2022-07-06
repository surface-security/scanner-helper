#!/bin/sh

cd $(dirname $0)
cd ..
. tests/common.sh

setup

mkdir -p tests/data/empty
mkdir -p tests/data/almost/empty
mkdir -p tests/data/cool/
touch tests/data/cool/some.file
touch tests/data/cool/some.file2

OUTPUT=$(docker run --rm -v $(pwd)/tests/data:/output:rw $IMAGE cleanup)
assert "$OUTPUT" $'MARK'
test -f tests/data/cool/some.file
test -f tests/data/cool/some.file2
