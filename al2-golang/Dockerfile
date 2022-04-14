ARG TAG=2.0.20201111.0
FROM public.ecr.aws/amazonlinux/amazonlinux:${TAG}
ARG GO_VERSION=1.17.7
ARG GO_ARCH=arm64
RUN yum install -y \
      gcc \
      gzip \
      tar \
      && \
      curl -fsSL "https://dl.google.com/go/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz" | tar Cxz /usr/local \
      && \
      yum remove -y \
      gcc \
      gzip \
      tar \
      && \
      yum clean all \
      && \
      rm -rf /var/cache/yum

ENV PATH=/usr/local/go/bin:$PATH
ENV      GO111MODULE=on

CMD ["/bin/bash"]
