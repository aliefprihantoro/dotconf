root_dir=$HOME/.config/tmux
file_conf=$root_dir/plugins/tmux-which-key/config.yaml
current_dir=$(pwd)
rm -f $file_conf
cd $root_dir/plugins/tmux-which-key
ln -s $root_dir/conf/plugins/which-key/config.yaml
cd $current_dir
tmux source-file $root_dir/tmux.conf