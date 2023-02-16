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
