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
  vncserver -kill :\$1
}
source $dc/home/.zshrc
EOF
chmod +x ~/.zshrc

