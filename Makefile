USERNAME=camerondurham
XMR_BASIC_REPO=xmr
CPP_REPO=cpp-dev
TAG=alpine-3.14.2
CPP_TAG=ubuntu-20.04
ARM_SUFFIX=armv7
K3S_SUFFIX=k3s
XMR_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)
CPP_NAME=$(USERNAME)/$(CPP_REPO):$(CPP_TAG)
XMR_ARM_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)-$(ARM_SUFFIX)
XMR_K3S_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)-$(K3S_SUFFIX)

xmr:
	docker build -t $(XMR_NAME) -f ./xmr/Dockerfile ./xmr

xmr-arm:
	docker buildx build -t $(XMR_ARM_NAME) --platform linux/arm/v7 -f ./xmr/Dockerfile.multiarch ./xmr

xmr-multiarch:
	docker buildx build -t $(XMR_NAME) --platform linux/amd64,linux/arm/v7,linux/arm64 -f ./xmr/Dockerfile.multiarch --push ./xmr

cpp-multiarch-arm:
	docker buildx build -t $(CPP_NAME) --platform linux/arm64 -f ./cs104/Dockerfile --load ./cs104

xmr-k3s:
	docker buildx build -t $(XMR_K3S_NAME) --platform linux/amd64,linux/arm/v7 -f ./xmr/Dockerfile.multiarch-k3s --push ./xmr

xmr-k3s-ld:
	docker buildx build -t $(XMR_K3S_NAME) --platform linux/amd64 -f ./xmr/Dockerfile.multiarch-k3s --load ./xmr

push-xmr: xmr
	docker push $(XMR_NAME)

push-xmr-k3s: xmr-k3s
	docker push $(XMR_K3S_NAME)

exec-k3s: xmr-k3s-ld
	docker run -it $(XMR_K3S_NAME)

exec-xmr: xmr
	docker run -it $(XMR_NAME) /bin/sh

.PHONY: xmr push-xmr exec-xmr xmr-k3s xmr-multiarch cpp-multiarch
