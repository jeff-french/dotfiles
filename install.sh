#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
#ln -sf ${BASEDIR}/.git ~/
ln -sf ${BASEDIR}/.gitconfig ~/
ln -sf ${BASEDIR}/.gitignore_global ~/

# ruby
ln -sf ${BASEDIR}/.gemrc ~/
ln -sf ${BASEDIR}/.irbrc ~/
ln -sf ${BASEDIR}/.railsrc ~/

#web pullers
ln -sf ${BASEDIR}/.curlrc ~/
ln -sf ${BASEDIR}/.wgetrc ~/

# aliases
ln -sf ${BASEDIR}/.aliases ~/


# asdf
ln -sf ${BASEDIR}/.asdfrc ~/

# zsh
# TODO: add zsh and omyzsh configs

#vim
#ln -sf ${BASEDIR}/.vim ~/
#ln -sf ${BASEDIR}/.vimrc ~/
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +qall

#postgres
ln -sf ${BASEDIR}/.psqlrc ~/

# coder workspace only
if [ -z "$CODER_WORKSPACE_ID" ] then
    echo "Not a coder workspace."
else 
    ln -sf ${BASEDIR}/.bash_profile ~/
    ln -sf ${BASEDIR}/.bashrc ~/
    ln -sf ${BASEDIR}/.bash_colors ~/
    ln -sf ${BASEDIR}/.git-completion.bash ~/
    ln -sf ${BASEDIR}/.git-prompt.sh ~/
    mv /opt/asdf/.tool-versions ${HOME}/.tool-versions
fi