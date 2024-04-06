if [ $(uname) != 'Darwin' ]; then
	exit 0
fi

export PATH="/opt/homebrew/bin:$PATH"
