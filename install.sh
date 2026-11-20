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
ln -sf ${BASEDIR}/clearaws.sh ~/

# aws
ln -sf ${BASEDIR}/aws_login.sh ~/


# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ln -sf ${BASEDIR}/.p10k.zsh ~/
ln -sf ${BASEDIR}/.zshrc ~/
ln -sf ${BASEDIR}/.zprofile ~/
mkdir -p ~/.config/zsh
ln -sf ${BASEDIR}/secrets.zsh.tpl ~/.config/zsh/

# tools (macOS): Homebrew for what mise/uv can't manage, mise for languages and CLIs,
# uv for Python CLI tools. Each installs from its official installer.
if [[ "$(uname)" == "Darwin" ]]; then
    ln -sf ${BASEDIR}/Brewfile ~/
    mkdir -p ~/.config/mise
    ln -sf ${BASEDIR}/mise-config.toml ~/.config/mise/config.toml

    if [[ ! -x /opt/homebrew/bin/brew ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew bundle --file=~/Brewfile

    [[ -x ~/.local/bin/mise ]] || curl -fsSL https://mise.run | sh
    [[ -x ~/.local/bin/uv ]] || curl -LsSf https://astral.sh/uv/install.sh | sh
    ~/.local/bin/mise install

    # Python CLI tools, each on its own uv-managed Python
    uv_tool() { ~/.local/bin/uv tool install --managed-python "$@"; }
    uv_tool httpie
    uv_tool it2
    uv_tool kubernetes-validate
    uv_tool --python 3.13 flux-local            # 7.x breaks on Python 3.14
    uv_tool --python 3.13 --with "mcp<2" \
        "git+https://github.com/elvismdev/mem0-mcp-selfhosted.git"   # needs the mcp 1.x API
fi

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