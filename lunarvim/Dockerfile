FROM alpine:edge
RUN sh -uelic 'apk add git neovim ripgrep alpine-sdk bash --update && bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) '
VOLUME /root
ENTRYPOINT /root/.local/bin/lvim
