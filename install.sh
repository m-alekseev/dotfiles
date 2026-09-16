#!/usr/bin/env bash
set -e

DOTFILES="$HOME/.dotfiles"

mkdir -p "$HOME/.config" "$HOME/.claude" "$HOME/.claude-work" "$HOME/.config/herdr" "$HOME/.config/ghostty"

ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/herdr/config.toml" "$HOME/.config/herdr/config.toml"
ln -sf "$DOTFILES/ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"
ln -sf "$DOTFILES/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -sf "$DOTFILES/claude/skills" "$HOME/.claude/skills"
ln -sf "$DOTFILES/claude/CLAUDE.md" "$HOME/.claude-work/CLAUDE.md"
ln -sf "$DOTFILES/claude/skills" "$HOME/.claude-work/skills"

if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
  rm -rf "$HOME/.config/nvim/.git" "$HOME/.config/nvim/lua"
fi
ln -sf "$DOTFILES/nvim/lua" "$HOME/.config/nvim/lua"
ln -sf "$DOTFILES/nvim/lazyvim.json" "$HOME/.config/nvim/lazyvim.json"

# Herdr resets TERM, losing Ghostty's terminfo (undercurl/Smulx) — install it into ~/.terminfo so it's found regardless
/opt/homebrew/opt/ncurses/bin/infocmp -x -A /Applications/Ghostty.app/Contents/Resources/terminfo xterm-ghostty | /opt/homebrew/opt/ncurses/bin/tic -x -o "$HOME/.terminfo" -
