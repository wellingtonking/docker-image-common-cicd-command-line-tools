# Quickly put together just to get started

IMAGE ?= common-cicd-command-line-tools
REPO ?= wkng

GIT_HASH ?= $(shell git log --format="%h" -n 1)
TAG ?= ${GIT_HASH}

build:
	docker build --tag ${REPO}/${IMAGE}:${TAG} .

push:
	docker push ${REPO}/${IMAGE}:${TAG}
