# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git extract vi-mode tmux fzf)

case "$(uname)" in
  Darwin) source "$HOME/.dotfiles/zsh/macos-config.zsh" ;;
  Linux)  source /usr/share/cachyos-zsh-config/cachyos-config.zsh ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias gis="git status"
alias vim="nvim"
alias vi="nvim"

alias claude-work='CLAUDE_CONFIG_DIR=~/.claude-work claude'
alias cwv='HTTPS_PROXY="http://localhost:12334" NO_PROXY="localhost,127.0.0.1,.dev002.local" CLAUDE_CONFIG_DIR=~/.claude-work command claude'
alias claude='HTTPS_PROXY="http://localhost:12334" NO_PROXY="localhost,127.0.0.1,.dev002.local" command claude'
alias pi='HTTPS_PROXY="http://localhost:12334" NO_PROXY="localhost,127.0.0.1,.dev002.local" command pi'

# opencode
export PATH=/home/user/.opencode/bin:$PATH
alias opencode='HTTPS_PROXY="http://localhost:12334" NO_PROXY="localhost,127.0.0.1,.dev002.local" command opencode'

# Let node/require() find globally npm-installed packages from any directory
export NODE_PATH="$(npm root -g)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/user/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions
