LIST_CMD+=('rename/format name icon => formatName')
formatName() {
  show_help() {
    echo
    echo "Usage:"
    echo "  $0 [options]"
    echo
    echo "Description:"
    echo "  This script renames files by removing all characters except"
    echo "  letters (A–Z, a–z) and digits (0–9) from filenames."
    echo "  If a new filename already exists, a random 5-character suffix"
    echo "  is added to prevent overwriting."
    echo
    echo "Options:"
    echo "  -d <directory>    Target directory to process (default: current directory)."
    echo
    echo "  -p <pattern>      File name pattern (supports glob, e.g. \"*.mp3\")."
    echo "                    Default: \"*\" (all files)."
    echo
    echo "  -e <extension>    Filter files by extension (without dot)."
    echo "                    Example: -e jpg → processes only .jpg files."
    echo
    echo "  -r                Recursive mode."
    echo "                    When enabled, processes all subdirectories."
    echo "                    Default: enabled automatically when no flags are used."
    echo
    echo "  -h                Show this help message and exit."
    echo
    echo "Examples:"
    echo "  $0                         → Process all files recursively in current dir"
    echo "  $0 -d ./music -e mp3       → Rename only .mp3 files in ./music"
    echo "  $0 -d ./docs -p \"*.pdf\"    → Rename PDF files matching the pattern"
    echo "  $0 -r -d /sdcard/Download  → Recursive rename in /sdcard/Download"
    echo
    exit 0
  }

  # Default values
  target_dir="."
  pattern="*"
  ext_filter=""
  recursive=false

  # Parse arguments
  while getopts "d:p:e:rh" opt; do
    case "$opt" in
      d) target_dir="$OPTARG" ;;
      p) pattern="$OPTARG" ;;
      e) ext_filter="$OPTARG" ;;
      r) recursive=true ;;
      h) show_help ;;
      *) show_help ;;
    esac
  done

  # If no flag is provided → enable full recursive mode by default
  if [ $OPTIND -eq 1 ]; then
    recursive=true
    target_dir="."
    pattern="*"
    ext_filter=""
  fi

  # Ensure directory exists
  if [ ! -d "$target_dir" ]; then
    echo "Error: Directory not found → $target_dir"
    exit 1
  fi

  # Gather files
  if [ "$recursive" = true ]; then
    file_list=$(find "$target_dir" -type f)
  else
    file_list=$(find "$target_dir" -maxdepth 1 -type f)
  fi

  # Process each file
  while IFS= read -r f; do
    filename=$(basename "$f")
    dirpath=$(dirname "$f")

    # Apply pattern (glob)
    [[ $filename == $pattern ]] || [ "$pattern" = "*" ] || continue

    # Filter by extension if given
    if [ -n "$ext_filter" ]; then
      file_ext="${filename##*.}"
      [ "$file_ext" = "$ext_filter" ] || continue
    fi

    ext="${filename##*.}"
    name="${filename%.*}"

    # Handle files with no extension
    if [ "$ext" = "$filename" ]; then
      ext=""
      name="$filename"
    fi

    # Clean: keep only letters, space and numbers
    clean_name=$(echo "$name" | tr -cd '[:alnum:] ')
    [ -z "$clean_name" ] && clean_name="file"

    if [ -n "$ext" ]; then
      new_name="$clean_name.$ext"
    else
      new_name="$clean_name"
    fi

    # Skip if unchanged
    if [ "$filename" = "$new_name" ]; then
      continue
    fi

    # Add random suffix if file already exists
    if [ -e "$dirpath/$new_name" ]; then
      rand_suffix=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 5)
      if [ -n "$ext" ]; then
        new_name="${clean_name}_${rand_suffix}.$ext"
      else
        new_name="${clean_name}_${rand_suffix}"
      fi
    fi

    echo "→ $filename  →  $new_name"
    mv -n "$dirpath/$filename" "$dirpath/$new_name"
  done <<<"$file_list"

}

