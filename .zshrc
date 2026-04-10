# ~/.zshrc - Migrated from Oh My Zsh to Starship
# Backup: ~/.zshrc.ohmyzsh.backup.20260409225029
# Rollback: cp ~/.zshrc.ohmyzsh.backup.20260409225029 ~/.zshrc && source ~/.zshrc

# ============================================
# Basic Zsh Settings
# ============================================
setopt AUTO_CD              # cd by typing directory name
setopt AUTO_PUSHD           # push old dir onto stack
setopt PUSHD_IGNORE_DUPS    # don't push duplicates
setopt CORRECT              # command auto-correction

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Completion - 只每天检查一次
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ============================================
# Plugins (brew installed)
# ============================================
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ============================================
# Prompt - Starship
# ============================================
eval "$(starship init zsh)"

# ============================================
# Dotfiles Management
# ============================================
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# ============================================
# Git Aliases (from oh-my-zsh git plugin)
# ============================================
alias gst='git status'
alias gaa='git add --all'
alias gc='git commit -v'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout develop'
alias gl='git log --oneline --decorate -10'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gba='git branch -a'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

# ============================================
# User Environment Variables
# ============================================
# Homebrew Python & Java（放到 PATH 最前面，优先于系统版本）
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:/opt/homebrew/opt/openjdk@21/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@21

# Antigravity
export PATH="/Users/yaoyao/.antigravity/antigravity/bin:$PATH"

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

# OpenCode
export PATH=/Users/yaoyao/.opencode/bin:$PATH

# Go - Homebrew
export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# ============================================
# Other Tools
# ============================================
# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# NVM - 延迟加载（只在需要时加载）
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  node "$@"
}
npm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  npm "$@"
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# EnvX
fpath=($HOME/.envx/completions $fpath)
[ -f "$HOME/.envx/envx.sh" ] && source "$HOME/.envx/envx.sh"
