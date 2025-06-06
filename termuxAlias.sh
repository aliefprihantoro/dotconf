alias open='termux-open '
alias openb='termux-open-url '
alias pbcopy='termux-clipboard-set'
alias pbpaste='$(termux-clipboard-get)'
alias term='DISPLAY=:0 PULSE_SERVER=127.0.0.1 alacritty'

catc() {
  cat $1 >$2
}
catp() {
  cat $1 >>$2
}
alias pdl='
proot-distro login debian
'

alias us='
virgl_test_server_android &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
proot-distro login debian --shared-tmp --no-sysvipc
'

# virgl_test_server_android --angle-gl &
alias ux='
proot-distro login debian --shared-tmp --no-sysvipc -- /bin/bash -c "export DISPLAY=:0 PULSE_SERVER=127.0.0.1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.3 MESA_GLES_VERSION_OVERRIDE=3.2 && i3 & /bin/zsh"
'
alias u='
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
virgl_test_server_android &
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &
ux
'
alias sudo='proot-distro login debian -- '

alias postgres_setup='
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql
'
alias postgres_run='
pg_ctl -D $PREFIX/var/lib/postgresql start
'
alias postgres_stop='
pg_ctl -D $PREFIX/var/lib/postgresql stop
'
alias shortcut_sync='
rm -rf ~/.shortcuts
cp $dc/home/.shortcuts ~/
'

# updateNodeProot(){
#   mv $PREFIX/bin/node $PREFIX/bin/node-bin
#   cat <<EOF
# #!/data/data/com.termux/files/usr/bin/sh
# if [ -z "\$IS_PROOT" ]; then
#   exec /data/data/com.termux/files/usr/bin/node-bin "\$@"
# else
#   pd login debian --shared-tmp --no-sysvipc -- node "\$@"
# fi
#   EOF
# }