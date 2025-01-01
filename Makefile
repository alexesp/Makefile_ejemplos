BINARY_NAME=hello-makefile
.DEFAULT_GOAL:=run
#myprog
#OBJS = main.go
#CFLAGS = -Wall
# hello:
# 	echo "hello"

build:
#go build -o bin/main main.go
	GOARCH=amd64 GOOS=darwin go build -o ./bin/${BINARY_NAME}-darwin main.go
	GOARCH=amd64 GOOS=linux go build -o ./bin/${BINARY_NAME}-linux main.go
	GOARCH=amd64 GOOS=windows go build -o ./bin/${BINARY_NAME}-windows main.go

run:
	./bin/${BINARY_NAME}-linux
#go run main.go


build_and_run: build run

.PHONY: clean
clean:
# 	@rm -f test.txt
	go clean
	rm -f ./bin/${BINARY_NAME}-darwin
	rm -f ./bin/${BINARY_NAME}-linux
	rm -f ./bin/${BINARY_NAME}-windows