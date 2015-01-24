#PS1="\[\e[01;32m\]\u@\h \[\e[01;34m\]\W \`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\` \[\e[01;34m\]$\[\e[00m\]"

export BUNDLER_EDITOR=subl

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

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#Use nvm for managing Node version
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export LIQUIBASE_HOME=/usr/local/Cellar/liquibase/3.3.1/libexec
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:/Users/jfrench/.nvm/v0.10.35/bin:/Users/jfrench/.rvm/gems/ruby-2.2.0/bin:/Users/jfrench/.rvm/gems/ruby-2.2.0@global/bin:/Users/jfrench/.rvm/rubies/ruby-2.2.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jfrench/.rvm/bin:/Users/jfrench/.rvm/bin
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jfrench/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
