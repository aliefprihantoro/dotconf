if [[ $- == *i* ]]; then

LIST_CMD+=('kill proccess => kp')
kp() {
  local pid
  if [[ "${UID}" != "0" ]]; then
    pid=$(ps -f -u ${UID} | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [[ "x$pid" != "x" ]]; then
    echo $pid | xargs kill "-${1:-9}"
  fi
  zle reset-prompt
}
zle     -N     fzf-kill-widget
bindkey '^X^K' fzf-kill-widget

fi