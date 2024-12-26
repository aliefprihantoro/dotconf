alias open='termux-open '
alias openb='termux-open-url '
alias pbcopy='termux-clipboard-set'
alias pbpaste='$(termux-clipboard-get)'

catc() {
  cat $1 >$2
}
catp() {
  cat $1 >>$2
}
alias u='
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &
proot-distro login debian --shared-tmp --no-sysvipc
export DISPLAY=:0
i3 &
'
alias u2='
virgl_test_server_android --angle-gl &
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &
proot-distro login debian --shared-tmp --no-sysvipc
export DISPLAY=:0 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.6COMPAT MESA_GLES_VERSION_OVERRIDE=3.2
i3 &
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