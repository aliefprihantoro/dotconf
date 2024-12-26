# NOTE: use for change timezone
# dpkg-reconfigure tzdata
#setup rc
cat >~/.zshrc <<EOF
export dr=/data/data/com.termux/files/home
export dc=$dr/.myconf
sta() {
  rm -r .vnc/:*
  rm -r .vnc/loc*
  rm -r /tmp/.*
  vncserver -geometry 1640x720
}
staf() {
  local OPTION_USER=\$(echo "i3\nopenbox --startup \$HOME/.config/openbox/autostart\nawesome" | fzf)
  if [ ! -z \$OPTION_USER ]; then
    rm -r .vnc/:*
    rm -r .vnc/loc*
    rm -r /tmp/.*
    echo \$OPTION_USER >\$HOME/.vnc/xstartup
    vncserver -geometry 1640x720
  fi
}
alias sto='
vncserver -kill :1
'
stoo() {
  vncserver -kill :
}
source $dc/home/.zshrc
EOF
chmod +x ~/.zshrc
# setup configs
# WARNING: DELETE NOT USED CONFIG
mkdir .config
ln -s $dc/.config/* ~/.config
# setup rc
# WARNING: DELETE NOT USED CONFIG
ln -s $dc/home/.* ~/

# setup font
cd
aria2c -x5 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv