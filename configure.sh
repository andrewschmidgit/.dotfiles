#!/usr/bin/env zsh
DOTFILES=$HOME/.dotfiles
STOW_FOLDERS="zsh,nvim"

cd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
	echo "stow $folder"
	stow -D $folder
	stow $folder
done

