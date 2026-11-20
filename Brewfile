# Homebrew: only what mise and uv can't manage.
#   Languages and most CLIs -> mise   (~/.config/mise/config.toml)
#   Python CLI tools        -> uv     (uv tool install, see install.sh)
#
# Install:      brew bundle --file=~/Brewfile
# Check drift:  brew bundle check --file=~/Brewfile
# Show extras:  brew bundle cleanup --file=~/Brewfile   (add --force to remove them)

tap "vjeantet/tap"

brew "direnv"                                  # per-directory env (existing .envrc files)
brew "gnupg"                                   # GPG
brew "tmux"                                    # terminal multiplexer
brew "watch"                                   # rerun a command periodically
brew "vjeantet/tap/alerter", trusted: true     # macOS notifications from the CLI

# VS Code extensions
vscode "atlassian.atlascode"
vscode "bluebrown.yamlfmt"
vscode "editorconfig.editorconfig"
vscode "esbenp.prettier-vscode"
vscode "github.vscode-github-actions"
vscode "hashicorp.terraform"
vscode "ms-kubernetes-tools.vscode-kubernetes-tools"
vscode "ms-vscode-remote.remote-containers"
vscode "ms-vscode-remote.remote-ssh"
vscode "ms-vscode-remote.remote-ssh-edit"
vscode "ms-vscode.remote-explorer"
vscode "pjmiravalle.terraform-advanced-syntax-highlighting"
vscode "redhat.vscode-yaml"
vscode "tim-koehler.helm-intellisense"
vscode "timonwong.shellcheck"
