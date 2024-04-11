FROM public.ecr.aws/amazonlinux/amazonlinux:latest
RUN yum install -y tar \
  gzip \
  git \
  findutils # findutils needed for gradle/xargs

# Download and extract Java JDK 17
# https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/downloads-list.html
ENV JDK_VERSION=17.0.10.8.1
COPY run.gradle /tmp
RUN curl -LO https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz && \
    tar -xzf amazon-corretto-17-x64-linux-jdk.tar.gz  -C /usr/local/ && \
    rm amazon-corretto-17-x64-linux-jdk.tar.gz && \
    export JAVA_HOME=/usr/local/amazon-corretto-${JDK_VERSION}-linux-x64 && \
    export PATH=$PATH:/usr/local/amazon-corretto-${JDK_VERSION}-linux-x64/bin && \
    git clone https://github.com/opensearch-project/OpenSearch.git && \
    cd OpenSearch && \
    cp /tmp/run.gradle ./gradle/run.gradle

ENV JAVA_HOME=/usr/local/amazon-corretto-${JDK_VERSION}-linux-x64
ENV PATH=$PATH:/usr/local/amazon-corretto-${JDK_VERSION}-linux-x64/bin
