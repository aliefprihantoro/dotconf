TMUX_CONF="$HOME/.config/tmux/"
alias tmuxInstallPlugin='bash $TMUX_CONF/bin/installTPM.bash'
alias tmuxUpdatePlugin='bash $TMUX_CONF/bin/updateConf.bash'
alias t='tmux'
alias ta='tmux attach'
alias tks='tmux kill-server'
export TMUX_PWD=$HOME
# args 1 => name window
# args 2 => cmd execute
addNewTmux() {
  echo "neww -n \"$1\" -c \"$TMUX_PWD\" \\;"
  if [ "$2" != "" ]; then
    echo "send-keys $2 C-m \\; "
  fi
}

LIST_TMUX=('BLANK => tmux rename-session "home"')
LIST_TMUX+=('TMUX QUEST => tmuxquest')
tmuxquest() {
  TMUX_PWD="$dw/quest"
  local COMPILE="pnpm dev"
  local NAME_SESSION='quest'
  local NAME_FIRST_WINDOW='editor'
  local FIRST_CMD="cd $TMUX_PWD && v"
  # first cmd/window
  local ARGS="rename-session \"$NAME_SESSION\" \; "
  ARGS+="rename-window \"$NAME_FIRST_WINDOW\"  \; "
  ARGS+="send-keys \"$FIRST_CMD\" C-m  \; "
  # second cmd
  ARGS+=$(addNewTmux "issue" "v")
  ARGS+=$(addNewTmux "compile" \"$COMPILE\")
  ARGS+=$(addNewTmux "proot" "u C-m sta C-m")
  ARGS="tmux $(echo $ARGS | tr '\n' ' ')"
  eval $ARGS
}

LIST_TMUX+=('TMUX WEB => tmuxweb')
tmuxweb() {
  TMUX_PWD="$dw/alifprihantoro"
  local COMPILE="pnpm\ dev:home"
  local NAME_SESSION='web'
  local NAME_FIRST_WINDOW='editor'
  # first cmd/window
  local ARGS="rename-session \"$NAME_SESSION\" \; "
  ARGS+="rename-window \"$NAME_FIRST_WINDOW\"  \; "
  ARGS+="send-keys \"cd $TMUX_PWD && v\" C-m \; "
  # second cmd
  ARGS+=$(addNewTmux "issue" "v")
  ARGS+=$(addNewTmux "compile" $COMPILE)
  ARGS+=$(addNewTmux "proot" "u C-m sta")
  ARGS="tmux $(echo $ARGS | tr '\n' ' ')"
  eval $ARGS
}

tl() {
  local LIST_TMUX=$(printf '%s\n' "${LIST_TMUX[@]}")
  eval $(echo $LIST_TMUX | fzf | sed 's/.*=> //')
}