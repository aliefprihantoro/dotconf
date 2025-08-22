LIST_CMD+=('convert iso to chd => convert_iso_to_chd')
convert_iso_to_chd() {
  local input_iso="$1"
  local output_chd=$(echo $1 | sed 's/\.iso$/.chd/')
  local EXT=$(echo "$input_iso" | sed 's/.*\.//')
  if [ "$EXT" != "iso" ]; then
    echo "Error: Input file is not an ISO file."
    return 1
  fi
  local cmd="chdman createcd -i \"$input_iso\" -o \"$output_chd\""
  eval "$cmd"
  echo "complete Convert $input_iso to $output_chd"
}