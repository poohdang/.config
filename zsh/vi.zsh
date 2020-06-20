# Updates editor information when the keymap changes.
#function zle-keymap-select() {
#  # update keymap variable for the prompt
#  VI_KEYMAP=$KEYMAP
#
#  zle reset-prompt
#  zle -R
#}
#
#zle -N zle-keymap-select

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[5 q'
}

_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)




#function vi-accept-line() {
#  VI_KEYMAP=main
#  zle accept-line
#}
#
#zle -N vi-accept-line


bindkey -v
bindkey -M vicmd "h" vi-insert
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "^j" vi-beginning-of-line
bindkey -M vicmd "^l" vi-end-of-line
bindkey -M vicmd "i" up-line-or-history
bindkey -M vicmd "k" down-line-or-history
#bindkey -M vicmd "K" vi-insert-bol
bindkey -M vicmd "u" undo
#bindkey -M vicmd "-" vi-rev-repeat-search
# bindkey -M vicmd "=" vi-repeat-search
#bindkey -M vicmd "g" vi-forward-word-end



# use custom accept-line widget to update $VI_KEYMAP
#bindkey -M vicmd '^J' vi-accept-line
#bindkey -M vicmd '^M' vi-accept-line

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey '^v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^p' up-history
bindkey '^n' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^j' beginning-of-line
bindkey '^l' end-of-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
