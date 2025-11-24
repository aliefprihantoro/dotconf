alias cdg='prev_dir=$(pwd)
cd $(git rev-parse --show-toplevel)'
zzz=$dr/zzz
# db=$dc/bash
dssh=$dr.ssh
dp=$dr/project
dw=$dp/web
dm=$dw/muryp
dvp=$dr/.local/share/nvim/site/pack/packer/
dv=$dr/.config/nvim

alias dr='cd $dr'
alias zzz='cd $zzz'
alias dc='cd $dc'
alias db='cd $db'
alias dv='cd $dv'
alias dssh='cd $dssh'
alias dp='cd $dp'
alias dw='cd $dw'
alias dm='cd $dm'
alias dvc='cd $dvc'
alias dvp='cd $dvp'
LIST_CMD+=('add folder bookmark => addFolder <name>')
addFolder() {
  local NAME=$1
  local CURR_PATH=$(pwd)
  echo "$NAME => $CURR_PATH" >>$HOME/.muryp/LIST_PROJECT
}
LIST_CMD+=('delete node_modules => deleteNodeModules')
deleteNodeModules(){
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}