USERNAME=camerondurham
XMR_BASIC_REPO=xmr-basic
TAG=v0
XMR_BASIC_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)

xmr-basic:
	docker build -t $(XMR_BASIC_NAME) -f ./xmr-basic/Dockerfile ./xmr-basic

push-xmr-basic: xmr-basic
	docker push $(XMR_BASIC_NAME)

exec-xmr-basic: xmr-basic
	docker run -it $(XMR_BASIC_NAME) /bin/sh

.PHONY: xmr-basic push-xmr-basic exec-xmr-basic
