#!/bin/sh

cd $(dirname $0)
cd ..
. tests/common.sh

setup

OUTPUT=$(docker run --rm $IMAGE clean)
assert $? 2
assert "$OUTPUT" $'MARK
Usage: /usr/local/bin/clean FILES_TO_DELETE.txt'

mkdir -p tests/data/cool/
touch tests/data/cool/some.file
touch tests/data/cool/some.file2
touch tests/data/cool/some\ file2\ with\ spaces.txt

# wrong paths
echo tests/data/cool/some.file2 > tests/data/cool/input.txt
echo tests/data/cool/some file2 with spaces.txt >> tests/data/cool/input.txt

OUTPUT=$(docker run --rm -v $(pwd)/tests/data:/output $IMAGE clean /output/cool/input.txt)
assert $? 0
assert "$OUTPUT" $'MARK'

# nothing deleted
FILES=$(ls tests/data/cool/)
assert "$FILES" $'input.txt
some file2 with spaces.txt
some.file
some.file2'

# good paths
echo /output/cool/some.file2 > tests/data/cool/input.txt
echo /output/cool/some file2 with spaces.txt >> tests/data/cool/input.txt

OUTPUT=$(docker run --rm -v $(pwd)/tests/data:/output $IMAGE clean /output/cool/input.txt)
assert $? 0
assert "$OUTPUT" $'MARK'

# nothing deleted
FILES=$(ls tests/data/cool/)
assert "$FILES" $'input.txt
some.file'
