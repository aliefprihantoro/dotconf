# maps
# copy mode
list-keys -T copy-mode-vi
bind -T copy-mode-vi 'v' send -X begin-selection
bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

# kill session/window
unbind-key x               # unbind-key “x” from it’s current job of “ask and then close”
bind-key x confirm-before "kill-pane" # rebind-key it to just “close”
bind-key C-x confirm-before "kill-pane" # rebind-key it to just “close”
bind-key X confirm-before "kill-server"    # key combo for killing tmux

# add new window/session
unbind-key n
bind-key -r C-n new-window -a -c "#{pane_current_path}"
bind-key -r N new-session -c "#{pane_current_path}"

# split window
bind-key | split-window -h -c "#{pane_current_path}" # let's open pane with current directory with -c option
bind-key _ split-window -v -c "#{pane_current_path}"

# togle rezise
bind-key -r i resize-pane -Z
bind-key -r C-i resize-pane -Z

# Window
bind-key -r C-h windowPrev
bind-key -r C-l windowNext
bind-key -r Left windowPrev
bind-key -r Right windowNext

# session
bind-key -r C-j switch-client -n
bind-key -r C-k switch-client -p
bind-key -r Down switch-client -n
bind-key -r Up switch-client -p

# pane
bind-key -r j select-pane -D
bind-key -r k select-pane -U
bind-key -r h select-pane -L
bind-key -r l select-pane -R

# copy paste
# Vim Style in Copy-Mode "<prefix> ["
# Interacting with Paste Buffer
bind-key -T copy-mode-vi C-c send -X cancel
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi V send -X select-line
bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
bind-key C-b choose-buffer # view the buffer stack