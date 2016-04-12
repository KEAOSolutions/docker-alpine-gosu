CURRENT_DIRECTORY := $(shell pwd)
include environment

build:
	sed -i.bak 's|^FROM.*|FROM $(DOCKER_BASE)|' Dockerfile && \
	docker build --build-arg GOSU_VERSION=$(GOSU_VERSION) --build-arg GOSU_DOWNLOAD_URL=$(GOSU_DOWNLOAD_URL) --tag $(DOCKER_USER)/gosu:latest . && \
	mv Dockerfile.bak Dockerfile
