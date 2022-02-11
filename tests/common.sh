export IMAGE=surfacesecurity/helper:dev

function setup() {
    rm -fr tests/data
    mkdir -p tests/data
}

function assert() {
    if [[ "$1" != "$2" ]]; then
        echo "FAILED ASSERT at ${BASH_SOURCE[1]}:${BASH_LINENO}"
        echo "$1 is not $2"
        exit 1
    fi
}
