export ZSH="$HOME/.oh-my-zsh"

export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"
export HISTFILE="$ZSH_CACHE_DIR/history"

export ZSH_THEME="agnoster"

fpath+="$ZDOTDIR/.zfunc"

plugins=(git)

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

# offline
alias offline="sudo unshare -n sudo -u $(whoami)"

# completions
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
