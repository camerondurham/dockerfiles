# Use the Amazon Linux 2 base image
FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Install required packages
RUN yum install -y tar gzip

# Download and extract Java JDK 21
# https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/downloads-list.html
ENV JDK_VERSION=21.0.2.14.1
RUN curl -LO https://corretto.aws/downloads/resources/${JDK_VERSION}/amazon-corretto-${JDK_VERSION}-linux-x64.tar.gz && \
    tar -xzf amazon-corretto-${JDK_VERSION}-linux-x64.tar.gz -C /usr/local/ && \
    rm amazon-corretto-${JDK_VERSION}-linux-x64.tar.gz

# Set environment variables
ENV JAVA_HOME=/usr/local/amazon-corretto-${JDK_VERSION}-linux-x64
ENV PATH=$PATH:/usr/local/amazon-corretto-${JDK_VERSION}-linux-x64/bin

# Verify Java installation
# Output should be something like
# openjdk version "21.0.2" 2024-01-16 LTS
# OpenJDK Runtime Environment Corretto-21.0.2.14.1 (build 21.0.2+14-LTS)
# OpenJDK 64-Bit Server VM Corretto-21.0.2.14.1 (build 21.0.2+14-LTS, mixed mode, sharing)
RUN java -version
