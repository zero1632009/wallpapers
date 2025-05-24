# This script renames files in the current directory to a sequential format.
#!/bin/bash

i=1
for file in *; do
  [[ "$file" == *.sh ]] && continue

  ext="${file##*.}"
  if [[ "$file" == "$ext" ]]; then
    name=$(printf "%03d" "$i")
  else
    name=$(printf "%03d.%s" "$i" "$ext")
  fi

  [[ "$file" == "$name" ]] && continue

  mv -- "$file" "$name"
  ((i++))
done
