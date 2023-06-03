#!/bin/sh

# change shell to zsh
echo "run > 'chsh -s $(which zsh)'"

if [ $DEVTOOLS = true ]
then
    repeat() {
        for i in {1..$2}; do echo "$1"; done
    }

    line() { echo $(repeat '-' 80); }

    # node
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh" | bash
    NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install node

    # rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
