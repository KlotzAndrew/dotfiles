#! /bin/bash

for file in ~/.{bash_prompt,aliases,functions,path}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
