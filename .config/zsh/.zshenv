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
DOTNET_ROOT=/usr/lib/dotnet
if [ -d "$DOTNET_ROOT" ]; then
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_ROOT
	export DOTNET_INSTALL=$HOME/.dotnet
	export DOTNET_ASPIRE_CONTAINER_RUNTIME=podman
	export PATH=$DOTNET_INSTALL:$DOTNET_INSTALL/tools:$PATH
fi

if [ -d "/usr/local/go" ]; then
	export PATH=$PATH:/usr/local/go/bin
	export PATH=$PATH:~/go/bin
fi
# node
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
