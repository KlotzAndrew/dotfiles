#! /bin/bash

for file in ~/.{bash_prompt,aliases,functions,path}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Map caps lock to esc
command -v setxkbmap >/dev/null 2>&1 && setxkbmap -option caps:escape

export EDITOR=/usr/bin/nvim

# fzf solarized dark
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# mobile and optional
export ANDROID_HOME=${HOME}/Library/Android/sdk
export ANDROID_SDK_ROOT=${ANDROID_HOME}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
