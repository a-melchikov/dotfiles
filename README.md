# My Dotfiles

This repository contains my personal configuration files.

## Applications

- `vim`, `vs code`, `pycharm`
- `git`
- `pyenv`, `uv`
- `postman`
- `VirtualBox`
- `postgresql`, `DBeaver`
- `poetry`

## Contents

- `.zshrc`: Zsh configuration file.
- `.zsh_history`: Zsh command history file.
- `.oh-my-zsh`: Directory containing Oh My Zsh configurations and plugins.
- `install.sh`: Installation script to set up the environment on a new machine.
- `alacritty`
- `tmux`

## Additional libraries

bat, exa, htop, git, vim, postgresql, curl, wget, fzf, gcc, g++, make, python3, docker, docker-compose,
pyenv, uv, net-tools

```bash
sudo apt update && sudo apt install -y \
    curl wget git vim neovim nano \
    tmux screen bash-completion fzf exa \
    htop ncdu iotop iftop dstat lsof strace glances \
    build-essential python3 python3-pip nodejs npm docker.io docker-compose virtualenv \
    net-tools iproute2 traceroute mtr nmap openssh-client openssh-server jq \
    rsync tree unzip zip tar parted \
    gnupg fail2ban ufw \
    neofetch cowsay fortune-mod sed awk bc \
    conky xclip
```

```bash
sudo apt update && sudo apt install -y \
    build-essential python3-dev python3-venv \
    libssl-dev libffi-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    libncursesw5-dev libgdbm-dev tk-dev uuid-dev libxml2-dev libxslt1-dev \
    libjpeg-dev libpng-dev libfreetype6-dev
```

<https://github.com/thoughtbot/dotfiles>

## Installation

To set up the environment on a new machine, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/a-melchikov/dotfiles
    ```

2. **Run the installation script:**

    ```bash
    ./install.sh
    ```
