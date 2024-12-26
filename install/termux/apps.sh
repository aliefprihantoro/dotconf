pkg update -y
pkg upgrade -y
# install cli tools
pkg install bat gh git zsh lsd fzf tmux ripgrep termux-api yq which make man aria2 htop -y
# security apps
pkg openssh
if [ "$isUsePacman" != "n" ]; then
  # add glibc
  pacman -S glibc-runner
fi
# install db
pkg install postgresql mariadb -y
# install language and related tools
pkg install nodejs eslint golang rust php composer python python-pip -y

source $dc/install/lsp.sh

# install bun
# aria2c -x5 https://github.com/oven-sh/bun/releases/latest/download/bun-linux-aarch64.zip bun.zip
# unzip bun.zip
# mkdir -p ~/.bun/bin
# mv bun/bun ~/.bun/bin
# rm -rf bun
# echo '#!/bin/sh\ngrun ~/.bun/bun $@' >~/../usr/bin/bun
# chmod +x ~/../usr/bin/bun