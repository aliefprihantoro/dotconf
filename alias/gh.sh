LIST_CMD+=('create label github => ghCreateLabels')
ghCreateLabels() {
  FILE=$1

  # Gunakan yq (command line YAML processor), install dulu: https://github.com/mikefarah/yq
  # Jika belum ada yq, install via:
  #   brew install yq   (Mac)
  #   sudo apt install yq  (Ubuntu)

  # Baca dan buat label satu per satu
  yq eval '.labels[] | [.name, .color, .description] | @tsv' $FILE | while IFS=$'\t' read -r name color description; do
    gh label create "$name" --color "$color" --description "$description" || echo "Label $name already exists"
  done
}

ghDelAllLabels() {
  # Dapatkan semua label yang ada
  gh label list --limit 1000 | cut -f1 | while read label; do
    gh label delete "$label" --yes
  done
}
