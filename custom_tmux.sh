#! /bin/zsh

PROJ_NAME=$1

# new session with main wndow
tmux kill-session -t $PROJ_NAME
tmux new-session -s $PROJ_NAME -d
tmux send-keys "cd ~/src/$PROJ_NAME" Enter

# new window for project
tmux new-window -t $PROJ_NAME:1
tmux split-window -t $PROJ_NAME:1 -h -p 25
tmux send-keys "cd ~/src/$PROJ_NAME" Enter
tmux select-pane -t $PROJ_NAME:1 -L
tmux send-keys "cd ~/src/$PROJ_NAME" Enter
tmux send-keys 'vim' Enter

tmux attach -t $PROJ_NAME
