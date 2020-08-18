#!/bin/sh

set -o xtrace
set -o errexit
set -o pipefail
set -o nounset

mkdir /proto
cd /proto

unset GOPATH

go mod init github.com/cilium/hubble/protoc

go get google.golang.org/grpc/cmd/protoc-gen-go-grpc@8bec2f5d898f
go build google.golang.org/grpc/cmd/protoc-gen-go-grpc

go get github.com/mitchellh/protoc-gen-go-json@8fbb6f3
go build github.com/mitchellh/protoc-gen-go-json

go get github.com/golang/protobuf@v1.4.2
go build github.com/golang/protobuf/protoc-gen-go
