# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/share/openvswitch/scripts

# Nodejs
VERSION=v14.4.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cuia/.oh-my-zsh"
export XDG_CONFIG_HOME=$HOME/.config
# export EDITOR=nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export P4_HOME=~/Workspace/P4


#   fzf
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# fzf --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
export FZF_DEFAULT_OPTS='
  --bind "ctrl-k:down,ctrl-i:up,ctrl-u:top,ctrl-y:execute-silent(echo {} | xclip -selection clipboard)"
  --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O xterm256 --style candy {} || cat {}) 2> /dev/null | head -100"
'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
# export FZF_TMUX=1
# export FZF_TMUX_HEIGHT='80%'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
# ZSH_THEME="/dracula/dracula"
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  #fzf
  history-substring-search
  git
  vi-mode
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
#export FZF_BASE=/

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c=clear
alias fe="free -h"
alias l="ls -A"
# alias ra="ranger"
alias sr='sudo ranger'
alias s=neofetch
alias shutdown="shutdown -h now"
alias sudo="sudo env PATH=$PATH"
alias f=fzf
alias af="alias | fzf"
alias hf="history | fzf"
alias mk="make"
alias mks="sudo make stop"
alias mkc="sudo make clean"
alias vim='nvim'
alias et="exit"
alias lg="lazygit"
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# lg()
# {
    # export LAZYGIT_NEW_DIR_FILE=~/.config/lazygit

    # lazygit "$@"

    # if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            # cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            # rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    # fi
# }
