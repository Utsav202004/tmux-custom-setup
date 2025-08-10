# My Custom Tmux Setup

Automated tmux session setup for learning concerns.

## What it does

Creates a tmux session with 5 pre-configured windows:
- **ml**: Jupyter notebook server
- **ml2**: Git repository for ML learnings  
- **ds**: Data science course materials
- **dsa**: Data structures and algorithms practice
- **extra**: General purpose terminal

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/Utsav202004/tmux-custom-setup.git
cd tmux-custom-setup

```

2. Edit the paths in setup_tmux.sh to match your directory structure

3. Make executable and run:
```bash
chmod +x setup_tmux.sh
./setup_tmux.sh
```

## Requirements

- tmux
- jupyter notebook ( for ml window )

## Usage

```bash
./setup_tmux.sh
```
