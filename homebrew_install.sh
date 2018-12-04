# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update


binaries=(
  coreutils
  python
  git
  bash
  nvm
  vim
  wget
  terraform
  kubernetes-cli
  kubernetes-helm
  kubernetes-service-catalog-client
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew tap homebrew/cask-fonts

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-sourcecodepro-nerd-font
  font-sourcecodepro-nerd-font-mono
  font-source-code-pro-for-powerline
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}
#https://github.com/caskroom/homebrew-fonts/tree/master/Casks
