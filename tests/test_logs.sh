#!/bin/sh

cd $(dirname $0)
cd ..
. tests/common.sh

setup

OUTPUT=$(docker run --rm $IMAGE logs)
assert $? 0
assert "$OUTPUT" $'MARK'

# TODO: get a sample of journal logs and testing parsing
