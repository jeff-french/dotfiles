# Login shells, including the environment macOS GUI apps and non-interactive tools inherit.
# Interactive setup (oh-my-zsh, mise activate, aliases, secrets) lives in .zshrc.

# mise shims: make mise-managed tools (aws, node, terraform, ...) available to scripts,
# IDE tasks and other non-interactive processes. In interactive shells, `mise activate`
# in .zshrc takes precedence and handles per-project versions.
export PATH="$HOME/.local/share/mise/shims:$PATH"

# ~/.local/bin: mise itself, uv, and uv-installed Python CLI tools
export PATH="$PATH:$HOME/.local/bin"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
