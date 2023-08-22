# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=$PATH:~$USER/.local/bin

export XDG_CONFIG_HOME="$HOME/.config"

###########################
# Alias ###################
###########################
alias vim="nvim"
alias vi="nvim"

# Git
alias g="git"
alias gc="git commit"
alias gs="git status"
alias ga="git add ."

###########################
# Functions ###############
###########################
toggle_audio() {
    default_device="$(pactl get-default-sink)"

    new_device="hdmi"
    case "$default_device" in
	*hdmi*) new_device="pro" ;;
    	*) echo "leaving as hdmi" ;;
    esac

    new_sink="$(pactl list sinks short | grep -i $new_device | awk '{print $2}')"

    pactl set-default-sink $new_sink
}

###########################
# Code ####################
###########################
# node
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
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
