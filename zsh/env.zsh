# Nodejs
VERSION=v14.4.0
DISTRO=linux-x64
export PATH=$PATH:/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/share/openvswitch/scripts
export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=vi
export RANGER_LOAD_DEFAULT_RC=FALSE
export P4_HOME=~/Workspace/P4
export TERM=xterm-256color
