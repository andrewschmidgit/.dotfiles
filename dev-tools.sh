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
