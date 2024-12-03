# If you come from bash you might have to change your $PATH.
export PATH=$HOME/go/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux history sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ===========================================

# if [[ $(ps --no-header -p $PPID -o comm) =~ '^alacritty$' ]]; then
#         for wid in $(xdotool search --pid $PPID); do
#             xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
# fi

if [ -x "$(command -v exa)" ]; then
    alias l="exa --long --all --group"
fi

alias i="sudo pacman -S"
alias m="make"
alias n="nvim"
alias v="vim"
alias c="clear"
alias e="exit"
alias v=". ./venv/bin/activate"
alias run="python manage.py runserver"
alias cur="/home/andrey/code/django-projects/django-blogtest-project"
alias docker-compose="/usr/lib/docker/cli-plugins/docker-compose"
alias dc="/usr/lib/docker/cli-plugins/docker-compose"
alias gh="git hist"
alias gcn="git fetch --prune"

alias pym="python main.py"

alias pgstart="sudo systemctl start postgresql"
alias pgstop="sudo systemctl stop postgresql"
alias psqlconnect="psql -h localhost -U postgres"

volume() {
  if [[ "$1" =~ ^[+-][0-9]+$ ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ "$1%"
  elif [[ "$1" == "current" ]]; then
    pactl list sinks | grep -A 15 'RUNNING' | grep 'Volume:' | head -n 1 | awk '{print $5}'
  else
    echo "Использование: volume [+|-]x или volume current"
  fi
}

pgcli_connect() {
    # Параметры по умолчанию
    local DEFAULT_USER="postgres"
    local DEFAULT_DB="demo"
    local PGCLI_PATH="$HOME/.venvs/pgcli-env/bin/pgcli"

    # Проверка наличия pgcli
    if [[ ! -f "$PGCLI_PATH" ]]; then
        echo "Ошибка: pgcli не найден. Убедитесь, что активировано виртуальное окружение."
        return 1
    fi

    # Получение параметров
    local USER="${1:-$DEFAULT_USER}"
    local DB="${2:-$DEFAULT_DB}"

    # Попытка подключения
    "$PGCLI_PATH" -h localhost -U "$USER" -d "$DB" || {
        echo "Ошибка подключения к базе данных '$DB' с пользователем '$USER'. Проверьте ваши учетные данные и настройки."
        return 1
    }
}


export FZF_CTRL_R_OPTS="--preview 'echo {}'"
export PATH=/home/andrey/.python3.12/bin:$PATH
export NEOFETCH_LOGO=/home/andrey/labs/neof/neo3.png
neofetch | lolcat

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
