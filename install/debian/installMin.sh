apt-get update -y
apt-get upgrade -y
apt-get install wget chromium firefox-esr tigervnc-standalone-server tigervnc-common kitty lxappearance thunar -y
# install
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman
if [ "$isTermuxProot" != "y" ]; then
  # chromium
  rm /bin/chromium_real
  mv /bin/chromium /bin/chromium_real
  touch /bin/chromium
  chmod +x /bin/chromium
  cat >/bin/chromium <<EOF
#!/bin/bash
if [[ \$(id -u) -ne 0 ]]; then
  /bin/chromium_real $@
else
  /bin/chromium_real --no-sandbox $@
fi
EOF
  # brave
  rm /bin/brave-browser-stable-bin
  mv /bin/brave-browser-stable /bin/brave-browser-stable-bin
  touch /bin/brave-browser-stable
  chmod +x /bin/brave-browser-stable
  cat >/bin/brave-browser-stable <<EOF
#!/bin/bash
if [[ \$(id -u) -ne 0 ]]; then
  /bin/brave-browser-stable $@
else
  /bin/brave-browser-stable-bin --no-sandbox $@
fi
EOF
fi
# setup chrome for default using no sandbox
# install postman
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman

# add vscdoeium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg |
  gpg --dearmor |
  dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' |
  tee /etc/apt/sources.list.d/vscodium.list
apt update && apt install codium

apt install curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser

# TODO: install libreoffice, ink, gimp, mongo compas

# add/rewrite desktop info
ln -sf $dc/desktop/* /usr/share/applications/

# rofi dmenu
apt-get install rofi -y
git clone --depth=1 https://github.com/adi1090x/rofi.git