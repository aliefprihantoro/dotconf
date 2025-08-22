#!/usr/bin/env bash

source $HOME/.config/tmux/conf/plugins/listPlugins.bash
# Path tujuan clone
TARGET_DIR="$HOME/.config/tmux/plugins/"

# Pastikan direktori tujuan ada
mkdir -p "$TARGET_DIR"

for repo in "${repos[@]}"; do
  # Nama repo
  repo_name=$(basename "$repo")
  # Path tujuan
  repo_path="$TARGET_DIR/$repo_name"

  # Jika sudah ada, lewati clone
  if [ -d "$repo_path/.git" ]; then
    echo "[INFO] Repo $repo_name sudah ada, melewatkan clone."
  else
    echo "[INFO] Mengkloning $repo_name..."
    git clone "https://github.com/$repo.git" "$repo_path"
  fi

  # Pindah ke direktori repo
  cd "$repo_path" || continue

  # Periksa apakah repo punya submodule
  if [ -f ".gitmodules" ]; then
    echo "[INFO] Menemukan submodule di $repo_name, inisialisasi..."
    git submodule update --init --recursive
  else
    echo "[INFO] Tidak ada submodule di $repo_name."
  fi

  echo "-----------------------------------------"
done

echo "Selesai!"