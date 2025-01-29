export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"
export HISTFILE="$ZSH_CACHE_DIR/history"
export ZSH_THEME=""

fpath+="$ZDOTDIR/.zfunc"
fpath+="$ZDOTDIR/pure"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

export EDITOR=nvim

# aliases
. $ZDOTDIR/alias.zsh

# brew
. $ZDOTDIR/brew.zsh

# wsl config
. $ZDOTDIR/wsl.zsh

# completions
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
