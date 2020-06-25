# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey '^v' edit-command-line

bindkey -v
bindkey -M vicmd "h" vi-insert
bindkey -M vicmd "H" vi-insert-bol
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "^j" vi-beginning-of-line
bindkey -M vicmd "^l" vi-end-of-line
bindkey -M vicmd "i" up-line-or-history
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd "u" undo
#bindkey -M vicmd "-" vi-rev-repeat-search
bindkey -M vicmd "=" vi-repeat-search
bindkey -M vicmd "g" vi-forward-word-end

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^p' up-history
bindkey '^n' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^u' history-substring-search-up
bindkey '^o' history-substring-search-down


# allow ctrl-j and ctrl-l to move to beginning/end of line
bindkey '^j' beginning-of-line
bindkey '^l' end-of-line


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

zle -N zle-line-init
zle -N zle-keymap-select

KEYTIMEOUT=1


#function vi-accept-line() {
#  VI_KEYMAP=main
#  zle accept-line
#}
#
#zle -N vi-accept-line


