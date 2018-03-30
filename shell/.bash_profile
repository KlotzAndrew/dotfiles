#! /bin/bash

for file in ~/.{bash_prompt,aliases,functions}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    echo $file
		source "$file"
	fi
done
