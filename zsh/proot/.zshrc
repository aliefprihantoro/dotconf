export dr=/data/data/com.termux/files/home
export dc=$dr/.myconf
sta() {
  rm -r .vnc/:*
  rm -r .vnc/loc*
  rm -r /tmp/.*
  vncserver -geometry 1640x720
}
staf() {
  local OPTION_USER=$(echo "i3\nopenbox --startup $HOME/.config/openbox/autostart\nawesome" | fzf)
  if [ ! -z $OPTION_USER ]; then
    rm -r .vnc/:*
    rm -r .vnc/loc*
    rm -r /tmp/.*
    echo $OPTION_USER >$HOME/.vnc/xstartup
    vncserver -geometry 1640x720
  fi
}
alias sto='
vncserver -kill :1
'
stoo() {
  vncserver -kill :$1
}
source $dc/home/.zshrc
updateDesktop() {
  for file in $dc/desktop/*; do
    filename=$(basename "$file")
    if [ -f "/usr/share/applications/$filename" ]; then
      rm "/usr/share/applications/$filename"
    fi
    cp "$file" "/usr/share/applications/"
  done

}

updateApp() {
  apt-get update -y
  apt-get upgrade -y
  updateDesktop
}

rofiClearCache() {
  rm -rf $HOME/.cache/rofi-drun-desktop.cache
}
export PATH=$PATH:$HOME/.myconf/bin/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export PNPM_HOME="$dr/.pnpm/"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac