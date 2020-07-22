#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Save history for elixir interactive console
export ERL_AFLAGS="-kernel shell_history enabled"

# Default editor
export EDITOR=vim

#
# Version Manager
#

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

###-tns-completion-start-###
if [ -f /Users/leksster/.tnsrc ]; then
    source /Users/leksster/.tnsrc
fi
###-tns-completion-end-###
