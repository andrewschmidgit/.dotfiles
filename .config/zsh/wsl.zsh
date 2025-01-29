[ -z "$WSL_DISTRO_NAME" ] && return

# vagrant
if [ $(command -v "vagrant") ]; then
	export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=/mnt/c/Users/aschmid
	export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1
	export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
fi
