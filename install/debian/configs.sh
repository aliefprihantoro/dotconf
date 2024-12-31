# NOTE: use for change timezone
# dpkg-reconfigure tzdata
# WARNING: DELETE NOT USED CONFIG
mkdir .config
ln -s $dc/.config/* ~/.config
# setup rc
# WARNING: DELETE NOT USED CONFIG
ln -s $dc/home/.* ~/

# setup font
cd
aria2c -x5 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv