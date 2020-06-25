export FZF_DEFAULT_OPTS='
  --bind "ctrl-k:down,ctrl-i:up,ctrl-u:top,ctrl-y:execute-silent(echo {} | xclip -selection clipboard)"
  --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O xterm256 --style candy {} || cat {}) 2> /dev/null | head -100"
'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore-vcs --type f --exclude ".git"'
export FZF_CTRL_T_COMMAND='fd --hidden --no-ignore-vcs --exclude ".git"'
export FZF_COMPLETION_TRIGGER='\'
