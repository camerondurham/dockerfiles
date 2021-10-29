USERNAME=camerondurham
XMR_BASIC_REPO=xmr
TAG=alpine-3.14.2
XMR_BASIC_NAME=$(USERNAME)/$(XMR_BASIC_REPO):$(TAG)

xmr:
	docker build -t $(XMR_BASIC_NAME) -f ./xmr/Dockerfile ./xmr

push-xmr: xmr
	docker push $(XMR_BASIC_NAME)

exec-xmr: xmr
	docker run -it $(XMR_BASIC_NAME) /bin/sh

.PHONY: xmr push-xmr exec-xmr
