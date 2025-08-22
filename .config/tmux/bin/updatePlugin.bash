
#!/usr/bin/env bash

# Path tujuan
TARGET_DIR="$HOME/.config/tmux/plugins/"

# Daftar repo
repos=(
  "alexwforsythe/tmux-which-key"
  "sainnhe/tmux-fzf"
)

# Pastikan direktori tujuan ada
mkdir -p "$TARGET_DIR"

# Cek apakah direktori kosong
if [ -z "$(ls -A "$TARGET_DIR")" ]; then
  echo "[INFO] Direktori kosong, melakukan clone semua repositori..."

  for repo in "${repos[@]}"; do
    repo_name=$(basename "$repo")
    repo_path="$TARGET_DIR/$repo_name"

    echo "[INFO] Mengkloning $repo_name..."
    git clone "https://github.com/$repo.git" "$repo_path"

    cd "$repo_path" || continue
    if [ -f ".gitmodules" ]; then
      echo "[INFO] Menemukan submodule di $repo_name, inisialisasi..."
      git submodule update --init --recursive
    else
      echo "[INFO] Tidak ada submodule di $repo_name."
    fi
    echo "-----------------------------------------"
  done

else
  echo "[INFO] Direktori sudah berisi repo, melakukan update..."

  for repo_path in "$TARGET_DIR"/*; do
    if [ -d "$repo_path/.git" ]; then
      repo_name=$(basename "$repo_path")
      echo "[INFO] Update $repo_name..."
      cd "$repo_path" || continue
      git pull --ff-only

      if [ -f ".gitmodules" ]; then
        echo "[INFO] Update submodule untuk $repo_name..."
        git submodule update --init --recursive
      fi
      echo "-----------------------------------------"
    fi
  done
fi

echo "[INFO] Selesai!"