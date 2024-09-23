.PHONY: all
all: simple

BINARY=simple
MODULE=simple
build_dir= ./build
VERSION=0.0.1
FULL_NAME=${BINARY}-${VERSION}
ARCHIVE_NAME=${FULL_NAME}.tar.gz
${BINARY}:
	@go build -o ${build_dir}/${FULL_NAME}/$@ ${MODULE}

.PHONY: clean
clean:
	@rm -rf ${build_dir}

.PHONY: package
package: ${BINARY}
	cd ${build_dir} && tar -czvf ${ARCHIVE_NAME} ${FULL_NAME}
	mkdir -p ${build_dir}/rpm/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
	cp rpm.spec ${build_dir}/rpm/SPECS
	cp ${build_dir}/${ARCHIVE_NAME} ${build_dir}/rpm/SOURCES
	cd ${build_dir}/rpm && rpmbuild --define "_topdir `pwd`" -v -bb SPECS/rpm.spec
