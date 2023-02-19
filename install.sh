#!/bin/sh

# -u: if variable doesn't exist, stop
# -e: if an error occurs, stop
# -o pipefail: if sub-command fails, stop
set -eu -o errexit

# -n: non-interactive
# true: immediately successful command
sudo -n true
test $? -eq 0 || exit 1 "you should run this script as superuser"

FILE=./packages.txt
test -f "$FILE" || echo "$FILE must exist"

apt-get update
apt-get upgrade

while read -r line
do
	[ -z "$line" ] && continue
	apt-get install -y -qq "$line"
done < "$FILE"

# change shell to zsh
echo "run > 'chsh -s $(which zsh)'"

if [ true ]
then
#!/bin/sh

repeat() {
	for i in {1..$2}; do echo "$1"; done
}

line() { echo $(repeat '-' 80); }

# node
node -v

if [ $? -ne 0 ]
then
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh" | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
fi

# rust
which rustc
if [ $? -ne 0 ]
then
line
echo "installing rust"
line
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"
fi
fi

#################
### Configure ###
#################
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


