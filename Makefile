HUGO_VERSION = 0.47.1

DOCKER_IMAGE = 360cloud/hugo

.PHONY: all build push

all: build push

build:
	docker build . --tag $(DOCKER_IMAGE):$(HUGO_VERSION) --build-arg HUGO_VERSION=$(HUGO_VERSION)

push:
	docker push $(DOCKER_IMAGE):$(HUGO_VERSION)

