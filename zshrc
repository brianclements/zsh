# zsh configuration
source ~/.zsh/zsh.d/checks.zsh
source ~/.zsh/zsh.d/colors.zsh
source ~/.zsh/zsh.d/setopt.zsh
source ~/.zsh/zsh.d/exports.zsh
source ~/.zsh/zsh.d/prompt.zsh
source ~/.zsh/zsh.d/completion.zsh
source ~/.zsh/zsh.d/aliases.zsh
source ~/.zsh/zsh.d/bindkeys.zsh
source ~/.zsh/zsh.d/functions.zsh
source ~/.zsh/zsh.d/history.zsh
source ~/.zsh/zsh.d/zsh_hooks.zsh

# Z
source  ${DOTFILES}/z/z.sh

# Tmuxinator
source ~/.zsh/zsh.d/tmuxinator.zsh

# Tmuxifier
eval "$(tmuxifier init -)"

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
