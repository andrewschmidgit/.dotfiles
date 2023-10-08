#!/bin/sh

if [ $# -eq 1 ]; then
    selected=$1
else
    selected=$(find ~/src ~/src/personal -maxdepth 2 -type d -name .git -exec dirname {} + -prune | fzf)
fi

if [ -z $selected ]; then
    exit 0
fi

name="$(basename $selected)"
tmux_pids="$(pgrep -xf tmux)"

echo $(ps)

if [ -z "$TMUX" -a -z "$tmux_pids" ]; then
    echo "creating new tmux session"
    tmux new-session -c $selected -s $name
    exit 0
fi

session_exists=$(tmux has-session -t $name)
if [ ! session_exists ]; then
    tmux new-session -d -c $selected -s $name
fi

tmux switch-client -t $name
