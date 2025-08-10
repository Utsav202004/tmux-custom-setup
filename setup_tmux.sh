#!/bin/bash

# User Configuration - Edit these paths for your setup
USER_HOME="/Users/utsavgoyal"  # Change this to your username
SESSION_NAME="${1:-all}"       # Session name is the first parameter, 'all' is the default name

# Directory paths - edit these as needed
ML_BASE_DIR="$USER_HOME/Documents/Courses/100-days-of-ml"
ML_GIT_DIR="$USER_HOME/Documents/Courses/100-days-of-ml/git-ml-learnings"
DS_DIR="$USER_HOME/Documents/Courses/data-science-course"
DSA_DIR="$USER_HOME/Documents/Courses/dsa-by-apna-college"
HOME_DIR="$USER_HOME"

# Checking if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session '$SESSION_NAME' already exists. Attaching to existing session..."
    tmux attach-session -t $SESSION_NAME
    exit 0
fi

# The following is executed if the session doesn't exist, so we will be creating a new one
echo "Creating new session '$SESSION_NAME'..."
tmux new-session -d -s $SESSION_NAME

# Configuring Window 1: ml - for running Jupyter notebook
tmux rename-window -t $SESSION_NAME:1 'ml'
tmux send-keys -t $SESSION_NAME:1 "cd '$ML_BASE_DIR'" C-m
tmux send-keys -t $SESSION_NAME:1 'jupyter notebook' C-m

# Configuring Window 2: ml2 - for git folder of ml
tmux new-window -t $SESSION_NAME:2 -n 'ml2'
tmux send-keys -t $SESSION_NAME:2 "cd '$ML_GIT_DIR'" C-m
tmux send-keys -t $SESSION_NAME:2 'clear' C-m

# Configuring Window 3: ds - for data science
tmux new-window -t $SESSION_NAME:3 -n 'ds'
tmux send-keys -t $SESSION_NAME:3 "cd '$DS_DIR'" C-m
tmux send-keys -t $SESSION_NAME:3 'clear' C-m

# Configure Window 4: dsa
tmux new-window -t $SESSION_NAME:4 -n 'dsa'
tmux send-keys -t $SESSION_NAME:4 "cd '$DSA_DIR'" C-m
tmux send-keys -t $SESSION_NAME:4 'clear' C-m

# Configure Window 5: extra
tmux new-window -t $SESSION_NAME:5 -n 'extra'
tmux send-keys -t $SESSION_NAME:5 "cd $HOME_DIR" C-m
tmux send-keys -t $SESSION_NAME:5 'clear' C-m

# Returning to first window
tmux select-window -t $SESSION_NAME:1

# Attaching to the session
tmux attach-session -t $SESSION_NAME
