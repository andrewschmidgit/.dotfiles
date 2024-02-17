test $(uname) = "Darwin"
mac=$?

# Path
[ $mac ] && export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
[ ! -d "$ZSH_CACHE_DIR" ] && mkdir -p "$ZSH_CACHE_DIR"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"
export ZSH_THEME="agnoster"

fpath+="$ZDOTDIR/.zfunc"

plugins=(git)

# Mac specific
[ $mac ] && FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

# vim
alias v="nvim"

# git
alias g="git"
alias ga="git add -p"
alias gadd="git add"
alias gc="git commit"
alias gl="git log --graph --abbrev-commit"
alias gp="git push"
alias gpu="git pull"
alias gs="git status"

# completions
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
