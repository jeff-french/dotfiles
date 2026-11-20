# Secrets loaded into every shell from 1Password via `op inject`.
# This file holds only 1Password secret references, never secret values, so it is safe to commit.
# Reference format: vault/item/field after the op scheme. Items should be stored in the zsh_secrets vault.
# Don't write the literal op-colon-slash-slash prefix in comments: op inject parses it there too and fails.
# To get an exact reference, use the field's dropdown menu in the 1Password app: "Copy Secret Reference".

export GITHUB_PAT="{{ op://zsh_secrets/github_pat/password }}"
export GITHUB_PERSONAL_ACCESS_TOKEN="{{ op://zsh_secrets/github_pat/password }}"
export TFE_TOKEN="{{ op://zsh_secrets/terraform/password }}"
export CLOUDFLARE_API_TOKEN="{{ op://zsh_secrets/cloudflare_moonswitch/password }}"
export CLOUDFLARE_ACCOUNT_ID="{{ op://zsh_secrets/cloudflare_moonswitch/account_id }}"
export CLOUDFLARE_EMAIL="{{ op://zsh_secrets/cloudflare_moonswitch/username }}"
