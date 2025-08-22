LIST_CMD+=('clear cache => clearCache')
clearCache() {
  # Deteksi platform
  PLATFORM=$(uname --operating-system)

  echo "Platform terdeteksi: $PLATFORM"

  # Hapus cache apt jika di Debian/Ubuntu
  if [[ "$PLATFORM" == "GNU/Linux" ]]; then
    if [ -f /etc/debian_version ]; then
      echo "Membersihkan cache apt (Debian/Ubuntu)..."
      sudo apt clean
      sudo apt autoclean
    fi
  fi

  # Hapus cache pkg jika di Termux (Android)
  if [[ "$PLATFORM" == "Android" ]]; then
    echo "Membersihkan cache pkg (Termux)..."
    pkg clean
  fi

  # Hapus cache npm
  if command -v npm &>/dev/null; then
    echo "Membersihkan cache npm..."
    npm cache clean --force
  fi

  # Hapus cache pnpm
  if command -v pnpm &>/dev/null; then
    echo "Membersihkan cache pnpm..."
    pnpm store prune
  fi

  echo "Pembersihan cache selesai."
}