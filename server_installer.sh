#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



# git
#ln -s ${BASEDIR}/.git ~/
ln -s ${BASEDIR}/.gitconfig ~/
ln -s ${BASEDIR}/.gitignore ~/

# ruby
ln -s ${BASEDIR}/.gemrc ~/
ln -s ${BASEDIR}/.irbrc ~/
ln -s ${BASEDIR}/.railsrc ~/

#web pullers
ln -s ${BASEDIR}/.curlrc ~/
ln -s ${BASEDIR}/.wgetrc ~/

#bashy
#ln -s ${BASEDIR}/.aliases ~/
ln -s ${BASEDIR}/.bash_profile ~/
ln -s ${BASEDIR}/.bashrc ~/
ln -s ${BASEDIR}/.bash_colors ~/
ln -s ${BASEDIR}/.git-completion.bash ~/
ln -s ${BASEDIR}/.git-prompt.sh ~/

#vim
ln -s ${BASEDIR}/.vim ~/
ln -s ${BASEDIR}/.vimrc ~/

#postgres
ln -s ${BASEDIR}/.psqlrc ~/

#hostfile
#ln -s ${BASEDIR}/host_file_update.sh ~/

