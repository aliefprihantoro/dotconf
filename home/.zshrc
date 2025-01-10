# for change dir whitout cd
setopt auto_cd
echo -ne "]12;#4a53f0" # color
# autocomplete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# prom shell
MYZSHPLUG=$dc/zsh/plugins
source $dr/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $MYZSHPLUG/p10k.zsh ]] || source $MYZSHPLUG/p10k.zsh
source $MYZSHPLUG/zsh-vi-mode.plugin.zsh
source $MYZSHPLUG/autopair.zsh
source $MYZSHPLUG/syntax-hilight/fast-syntax-highlighting.plugin.zsh

# auto pair
AUTOPAIR_LBOUNDS=(all '[.:/\!]')
AUTOPAIR_LBOUNDS+=(quotes '[]})a-zA-Z0-9]')
AUTOPAIR_LBOUNDS+=(spaces '[^{([]')
AUTOPAIR_LBOUNDS+=(braces '')
AUTOPAIR_LBOUNDS+=('`' '`')
AUTOPAIR_LBOUNDS+=('"' '"')
AUTOPAIR_LBOUNDS+=("'" "'")

AUTOPAIR_RBOUNDS=(all '[[{(<,.:?/%$!a-zA-Z0-9]')
AUTOPAIR_RBOUNDS+=(quotes '[a-zA-Z0-9]')
AUTOPAIR_RBOUNDS+=(spaces '[^]})]')
AUTOPAIR_RBOUNDS+=(braces '')
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# zsh autocomplete
source $MYZSHPLUG/zsh-autosuggestions.zsh

# ENV
# pnpm
export PNPM_HOME="$HOME/.pnpm/"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin/
# export PATH=$PATH:$HOME/.bun/bin/

for GET_PATH in $(find $dc/utils/**/*.sh $dc/alias/**/*.sh $dc/zsh/completion/*.zsh); do
  source $GET_PATH
done
