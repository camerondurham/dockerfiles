FROM amazonlinux:2

RUN \
  yum remove cmake && \
  yum install -y gcc-c++ wget tar gzip make git && \
  cd /tmp && \
  wget https://cmake.org/files/v3.10/cmake-3.10.0.tar.gz && \
  tar -xvzf cmake-3.10.0.tar.gz && \
  cd cmake-3.10.0 && \
  ./bootstrap  && \
  make && \
  make install && \
  pip-3.7 install neovim --upgrade && \
  cd "$(mktemp -d)" && \
  git clone https://github.com/neovim/neovim.git && \
  cd neovim && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  echo "finally done!"

CMD /bin/bash
