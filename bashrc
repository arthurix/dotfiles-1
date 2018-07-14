# System default
# --------------------------------------------------------------------

[ -f /etc/bashrc ] && . /etc/bashrc


# Options
# --------------------------------------------------------------------

### Append to the history file
shopt -s histappend

### Check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize


# Environment variables
# --------------------------------------------------------------------

### man bash
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
unset HISTSIZE
unset HISTFILESIZE
[ -z "$TMPDIR" ] && TMPDIR=/tmp

### Global
export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib

### OS X
export COPYFILE_DISABLE=true

### rbenv
eval "$(rbenv init - --no-rehash)"


# Prompt
# --------------------------------------------------------------------

__git_ps1() { :;}
[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh
PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'


# Shortcut functions
# --------------------------------------------------------------------

repeat() {
  local _
  while true
  do
    eval "$1"
  done
}

replace() {
  find . -type f \( -name \*.rb -o -name \*.haml \) -exec sed -i '' "$1" {} +
}


# Git completion
# --------------------------------------------------------------------

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash

  __git_complete g __git_main
fi


# Aliases
# --------------------------------------------------------------------

alias ls='ls -alFG'

alias vi='vim'

alias g='git'

alias be='bundle exec'
