.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = sonar-scanner
MY_PWD = $(shell pwd)

all: build

build:
ifdef NOCACHE
	docker build --no-cache -t $(IMAGE_BASE)/$(IMAGE) .
else
	docker build -t $(IMAGE_BASE)/$(IMAGE) .
endif

push:
	docker push $(IMAGE_BASE)/$(IMAGE)

run:
	docker run --rm --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE) bash
