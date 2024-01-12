# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"


ZSH_THEME="headline/headline"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:~$USER/.local/bin

export XDG_CONFIG_HOME="$HOME/.config"

###########################
# Add to Path #############
###########################
export PATH=$PATH:~/.local/scripts

source "$HOME/.aliasrc"


###########################
# Keybinds ################
###########################
bindkey -s ^f "tmux-sessionizer\n"

###########################
# Code ####################
###########################
# .net
DOTNET_CLI_TELEMETRY_OPTOUT=1
FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

# node
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export PATH=$PATH:/usr/local/go/bin

# bun completions
[ -s "/home/user/.bun/_bun" ] && source "/home/user/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Turso
export PATH="/home/andrew/.turso:$PATH"
