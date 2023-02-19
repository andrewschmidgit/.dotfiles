#!/bin/sh

usage() {
    echo "Usage: $0 [ -d ]"
}

quiet() {
    "$@" >/dev/null
}

DEVTOOLS=false

while getopts "dh" arg
do
    case "$arg" in
        d)
            DEVTOOLS=true
            ;;
        h)
            usage; exit 0
            ;;
        *)
            usage; exit 1
            ;;
    esac
done

# -u: if variable doesn't exist, stop
# -e: if an error occurs, stop
# -o pipefail: if sub-command fails, stop
set -eu -o errexit

# Install submodules
git submodule update --init --recursive

FILE=./packages.txt
test -f "$FILE" || echo "$FILE must exist"

brew update
brew upgrade

while read -r line
do
    [ -z "$line" ] && continue
    brew install  -q "$line"
done < "$FILE"

# change shell to zsh
echo "run > 'chsh -s $(which zsh)'"

if [ $DEVTOOLS = true ]
then
    echo "installing devtools"

    repeat() {
        for i in {1..$2}; do echo "$1"; done
    }

    line() { echo $(repeat '-' 80); }

    # node
    node -v

    if [ $? -ne 0 ]
    then
        echo "installing node"
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
    quiet stow -D $folder
    quiet stow $folder
done
