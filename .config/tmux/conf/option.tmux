new -n WindowName zsh --login
set -g focus-events on
set-window-option -g mode-keys vi
# set -g default-terminal "xterm-256color"
# set -ag terminal-overrides ",xterm-256color:RGB"
# set -g default-terminal "xterm-256color-italic"
set -ga terminal-overrides ",xterm-256color:Tc"
set -g default-terminal "rxvt-unicode-256color"
# set -g status off
# unbind-key C-b              # free the original bind-key key
set-option -g prefix C-a    # setting the prefix from C-b to C-a
bind-key C-a send-prefix    # ensure that we can send Ctrl-A to other apps or the shell that your interacting
# word separators for automatic word selection
set-window-option -g word-separators ' @"=()[]'  # default => ‘ -_@’.
# if want use zsh
set-option -g default-shell ~/../usr/bin/zsh

set-option -g display-time 2000            # By default, status msg disappears in the blink of an eye (750ms)
set-option -g display-panes-time 2000      # By default, pane number disappears in 1 s
set-option -g history-limit 50000          # maximum number of lines held in window history - crank it up from 2k default
set-option -g lock-after-time 3600         # lock the session after 60 mins of inactivity. Sometimes, it is good to protect your screen to make sure other's can't see enough.
# set-option -wg automatic-rename off
# count from 1
set-option -g base-index 1                # window index will start with 1
set-window-option -g pane-base-index 1    # pane index will start with 1
set-option -g renumber-windows on
# tmux adds a short, almost imperceptible delay between the commands that can cause funny behavior when running vim inside tmux.
set-option -s escape-time 0
# Command Prompt Movements:  within the tmux command prompt and the command prompt is accessed using <P>: (in the status line)
set-option -g status-keys vi
# To navigating through output in quick way, enable vim navigation keys
set-window-option -g mode-keys vi


set -g visual-activity off
set -g visual-bell off
set -g visual-silence on