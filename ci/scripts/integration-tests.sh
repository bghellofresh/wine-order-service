#!/usr/bin/env bash
set -e

# Configuration
ROOT_DIR="$(dirname "$(pwd)")"
PROJECT_SRC=${GOPATH}/src/github.com/hellofresh/wine-order-service

# Load environment variables
# shellcheck source=/dev/null
. "${ROOT_DIR}/docker/docker_ports"
if [ ! -z "${PROJECT_VARS}" ]; then
    eval "${PROJECT_VARS}"
    unset PROJECT_VARS
fi

# Move go code to the source directory
mkdir -p "${PROJECT_SRC}"
cp -r . "${PROJECT_SRC}"
cd "${PROJECT_SRC}"

# Run the integration tests
make test-integration

# Upload coverage results
# Example https://github.com/codecov/example-go
# go test -race -coverprofile=coverage.txt -covermode=atomic
bash <(curl -s https://codecov.io/bash) -t "${CODECOV_TOKEN}" -e integrationtests -f coverage.txt
