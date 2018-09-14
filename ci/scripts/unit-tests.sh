#!/usr/bin/env bash
set -e

# Configuration
PROJECT_SRC=${GOPATH}/src/github.com/hellofresh/wine-order-service

# Move go code to the source directory
mkdir -p "${PROJECT_SRC}"
cp -r . "${PROJECT_SRC}"
cd "${PROJECT_SRC}"

# Run the unit tests
make test-unit

# Upload coverage results
# Example https://github.com/codecov/example-go
# go test -race -coverprofile=coverage.txt -covermode=atomic
bash <(curl -s https://codecov.io/bash) -t "${CODECOV_TOKEN}" -e unittests -f coverage.txt
