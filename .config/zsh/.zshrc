export ZSH="$HOME/.oh-my-zsh"

export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"
export HISTFILE="$ZSH_CACHE_DIR/history"

export ZSH_THEME="agnoster"

fpath+="$ZDOTDIR/.zfunc"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

# aliases
. $ZDOTDIR/alias.zsh

# brew
. $ZDOTDIR/brew.zsh

# completions
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
