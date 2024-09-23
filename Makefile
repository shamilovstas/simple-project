.PHONY: all
all: simple

BINARY=simple
MODULE=simple
build_dir= ./build
VERSION=0.0.1

${BINARY}:
	@go build -o ${build_dir}/$@-${VERSION}/$@ ${MODULE}
	@cd ${build_dir} && tar -czvf $@-${VERSION}.tar.gz $@-${VERSION} 

.PHONY: clean
clean:
	@rm -rf ${build_dir}
