portforwad(){
  ssh -L 8081:localhost:8080 -L 8082:localhost:80 root@localhost -p2222
}
sshTermux(){
  ssh 127.0.0.1 -p8022
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