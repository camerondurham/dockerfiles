USERNAME=camerondurham
XMR_BASIC_REPO=xmr
TAG=alpine-3.14.2
ARM_SUFFIX=armv7
XMR_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)
XMR_ARM_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)-$(ARM_SUFFIX)

xmr:
	docker build -t $(XMR_NAME) -f ./xmr/Dockerfile ./xmr

xmr-arm:
	docker buildx build -t $(XMR_ARM_NAME) --platform linux/arm/v7 -f ./xmr/Dockerfile.multiarch ./xmr

xmr-multiarch:
	docker buildx build -t $(XMR_NAME) --platform linux/amd64,linux/arm64,linux/arm/v7 -f ./xmr/Dockerfile.multiarch --push ./xmr


push-xmr: xmr
	docker push $(XMR_NAME)

exec-xmr: xmr
	docker run -it $(XMR_NAME) /bin/sh

.PHONY: xmr push-xmr exec-xmr
