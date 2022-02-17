
#ruby garbage collection hacks
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.3

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

# asdf config
source ${ASDF_DIR:-$HOME/.asdf}/asdf.sh
source ${ASDF_DIR:-$HOME/.asdf}/completions/asdf.bash

#Use .bash_local for things that are machine or OS specific so this file can be shared in the dotfiles repo.
if [[ -s "$HOME/.bash_local" ]] ; then source "$HOME/.bash_local" ; fi
