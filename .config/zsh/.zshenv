export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# bin
export PATH="$HOME/.local/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# cargo
. "$HOME/.cargo/env"

# dotnet
DOTNET="$HOME/.dotnet/tools"
[ -d $DOTNET ] && PATH+=$DOTNET

# node
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
