portforwad() {
  ssh -L 8081:localhost:8080 -L 8082:localhost:80 root@localhost -p2222
}
LIST_CMD+=('connect to termux => sshTermux')
sshTermux() {
  eval "$(ssh-agent -s)" && ssh-add ~/.ssh/termux
  ssh 127.0.0.1 -p8022
}
LIST_CMD+=('ssh generate key => ssh-genKey <email> <filename>')
ssh-genKey() {
  local email="$1"
  local filename="$2"
  ssh-keygen -t ed25519 -a 100 -f "$HOME/.ssh/$filename" -C "$email"
  echo "✅ Key generated at ~/.ssh/$filename"
}

# arg :
# port:server:port (ssh server to localhost)
# iphost
# porthost
#
# jika ada warning
# ssh-keygen -R [localhost]:2222
#
# jika tidak bisa forwad
# /etc/sshd/sshd_config
# AllowTcpForwarding yes