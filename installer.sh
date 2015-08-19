#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



# git
#ln -s ${BASEDIR}/.git ~/
ln -s ${BASEDIR}/.gitconfig ~/
ln -s ${BASEDIR}/.gitignore_global ~/

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
#ln -s ${BASEDIR}/.bashrc ~/
ln -s ${BASEDIR}/.bash_colors ~/
ln -s ${BASEDIR}/.git-completion.bash ~/
ln -s ${BASEDIR}/.git-prompt.sh ~/

#vim
ln -s ${BASEDIR}/.vim ~/
ln -s ${BASEDIR}/.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#postgres
ln -s ${BASEDIR}/.psqlrc ~/

#hostfile
ln -s ${BASEDIR}/host_file_update.sh ~/

