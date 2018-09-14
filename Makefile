NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
BINARY_NAME?=wine-order-service
REPO=github.com/hellofresh/wine-order-service
BINARY_SRC=${REPO}/cmd/wine-order-service
GO_LINKER_FLAGS=-ldflags "-s"
DIR_OUT=$(CURDIR)/out
ROOT_DIR=$(PWD)

.PHONY: all clean deps build install

all: clean deps build install

clean:
	@printf "$(OK_COLOR)==> Cleaning project$(NO_COLOR)\n"
	if [ -d ${DIR_OUT} ] ; then rm -f ${DIR_OUT}/* ; fi

deps:
	@printf "$(OK_COLOR)==> Installing deps using gopkg.toml$(NO_COLOR)\n"
	@go get -u github.com/golang/dep/cmd/dep
	@dep ensure

build:
	@printf "$(OK_COLOR)==> Building binary$(NO_COLOR)\n"
	@go build -o ${DIR_OUT}/${BINARY_NAME} ${GO_LINKER_FLAGS} ${BINARY_SRC}

install:
	@printf "$(OK_COLOR)==> Installing binary$(NO_COLOR)\n"
	@go install -v ${BINARY_SRC}

test-unit:
	@printf "$(OK_COLOR)==> Unit Testing$(NO_COLOR)\n"
	@go test -v -race -cover ${PACKAGES}
