LATEST_VERSION := v0.1
REPOSITORY := getupcloud
IMAGE_NAME := rsyslog

.PHONY: default
default: image

.PHONY: image
image: BUILD_DATE := $(shell LC_ALL=C date -u)
image: GIT_COMMIT := $(shell git log --oneline -n 1)
image:
	docker build . -t $(REPOSITORY)/$(IMAGE_NAME):$(LATEST_VERSION)

.PHONY: tag
tag:
	docker tag  $(REPOSITORY)/$(IMAGE_NAME):$(LATEST_VERSION) $(REPOSITORY)/$(IMAGE_NAME):latest

.PHONY: push
push: tag
	docker push $(REPOSITORY)/$(IMAGE_NAME):$(LATEST_VERSION)
	docker push $(REPOSITORY)/$(IMAGE_NAME):latest

release: default tag push
