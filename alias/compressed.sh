LIST_CMD+=('decompress => decompress')
decompress() {
  local file="$1"
  local ext="${file##*.}" # Get the extension
  case "$ext" in
    tar.gz)
      tar -xvzf "$file"
      ;;
    zip)
      unzip "$file"
      ;;
    7z)
      7z x "$file"
      ;;
    rar)
      unrar x "$file"
      ;;
    gz)
      gunzip "$file"
      ;;
    tar.xz)
      tar -xvJf "$file"
      ;;
    *)
      echo "Ekstensi $ext tidak didukung."
      ;;
  esac
}

LIST_CMD+=('compress => compress')
compress() {
  local file="$1"
  local ext

  # List of supported extensions
  local extensions=("tar.gz" "zip" "7z" "rar" "gz" "tar.xz")

  # Prompt user to select an extension
  ext=$(printf "%s\n" "${extensions[@]}" | fzf --prompt="Pilih ekstensi: ")

  case "$ext" in
    tar.gz)
      tar -czvf "$file.tar.gz" "$file"
      ;;
    zip)
      zip -r "$file.zip" "$file"
      ;;
    7z)
      7z a "$file.7z" "$file"
      ;;
    rar)
      rar a "$file.rar" "$file"
      ;;
    gz)
      gzip "$file"
      ;;
    tar.xz)
      tar -cJvf "$file.tar.xz" "$file"
      ;;
    *)
      echo "Ekstensi $ext tidak didukung."
      ;;
  esac
}