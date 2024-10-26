if [ $(uname) != 'Darwin' ]; then
	return
fi

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
