# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Tooling: Homebrew for the few things mise can't manage, mise for everything else.
# ~/.local/bin holds mise itself, uv, and uv-installed tools.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:$HOME/.local/bin"
eval "$(~/.local/bin/mise activate zsh)"
. ~/.aliases

export XDG_CONFIG_HOME=~/.config
export EDITOR="vim"
export PAGER="less -F"
export MISE_NODE_COREPACK="true"

# Secrets from 1Password: the template holds op:// references only, values never touch disk.
if command -v op >/dev/null && [ -f ~/.config/zsh/secrets.zsh.tpl ]; then
  if _op_secrets=$(op inject -i ~/.config/zsh/secrets.zsh.tpl); then  # op's errors go to stderr
    eval "$_op_secrets"
  else
    echo "1Password: secrets not loaded, see op error above (template: ~/dotfiles/secrets.zsh.tpl)" >&2
  fi
  unset _op_secrets
fi

# Aws SSO Helpers
# Uses the Chrome binary so --new-tab is honored even if the profile already has a window.
# Args:
#   $1 = SSO session name in ~/.aws/config (e.g., moonswitch, otto)
#   $2 = Chrome profile directory name (e.g., "Moonswitch", "Otto", "Default", "Profile 1")
aws_sso_login_with_chrome () {
  bash ~/aws_login.sh "$1" "$2"
}

# convenience wrappers
aws-login-ms   () { aws_sso_login_with_chrome "moonswitch" "Profile 1"; }
aws-login-otto () { aws_sso_login_with_chrome "otto"       "Profile 5"; }

eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
