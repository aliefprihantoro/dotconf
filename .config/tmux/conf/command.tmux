# plugins
set -ag command-alias 'installPlugins=run-shell "bash ~/.config/tmux/bin/installPlugin.bash"'
set -ag command-alias 'updatePlugins=run-shell "bash ~/.config/tmux/bin/updatePlugin.bash"'
set -ag command-alias 'updateWhichkey=run-shell "bash ~/.config/tmux/bin/updateWichkey.bash"'

# goto window
set -ag command-alias 'windowNext=select-window -t :+'
set -ag command-alias 'windowPrev=select-window -t :-'

# goto pane
# goto session
set -ag command-alias 'sessionNext=switch-client -n'
set -ag command-alias 'sessionPrev=switch-client -p'

# move windows
set -ag command-alias 'windowMovePrev=swap-window -t :- ; select-window -t :-'
set -ag command-alias 'windowMoveNext=swap-window -t :+ ; select-window -t :+'

# move panes
set -ag command-alias 'paneMoveLeft=swap-pane -L'
set -ag command-alias 'paneMoveRight=swap-pane -R'
set -ag command-alias 'paneMoveUp=swap-pane -U'
set -ag command-alias 'paneMoveDown=swap-pane -D'