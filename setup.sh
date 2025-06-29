stow -t $HOME/.config .config

stow -t $HOME/.local .local

stow -t $HOME/.oh-my-zsh .oh-my-zsh

# this removes zsh files from ~
ln -s $XDG_CONFIG_HOME/zsh/.zshenv $HOME
