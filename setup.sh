stow -t $XDG_CONFIG_HOME .config

stow -t $HOME/.local .local

# this removes zsh files from ~
ln -s $XDG_CONFIG_HOME/zsh/.zshenv $HOME
