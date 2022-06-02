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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ln -sf ${BASEDIR}/.p10k.zsh ~/
ln -sf ${BASEDIR}/.zshrc ~/

# iTerm Colors
git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git ~/iTerm2-Color-Schemes
~/iTerm2-Color-Schemes/tools/import-scheme.sh 'Solarized Dark - Patched'

#vim
#ln -sf ${BASEDIR}/.vim ~/
#ln -sf ${BASEDIR}/.vimrc ~/
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +qall

#postgres
ln -sf ${BASEDIR}/.psqlrc ~/

# coder workspace only
if [[ ! -z "$CODER_WORKSPACE_ID" ]]; then
    ln -sf ${BASEDIR}/.bash_profile ~/
    ln -sf ${BASEDIR}/.bashrc ~/
    ln -sf ${BASEDIR}/.bash_colors ~/
    ln -sf ${BASEDIR}/.git-completion.bash ~/
    ln -sf ${BASEDIR}/.git-prompt.sh ~/
    mv /opt/asdf/.tool-versions ${HOME}/.tool-versions
fi