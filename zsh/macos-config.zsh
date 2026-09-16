# Herdr resets TERM to xterm-256color, losing Ghostty's undercurl (Smulx) capability
[[ -n "$HERDR_ENV" ]] && export TERM=xterm-ghostty

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth

# Don't add certain commands to the history file.
export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"

# Fish-like syntax highlighting and autosuggestions
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Use history substring search
source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_BASE="$(brew --prefix)/opt/fzf"
