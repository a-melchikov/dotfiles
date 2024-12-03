#!/bin/bash

# Функция для установки пакетов на RedOS
install_redos() {
    sudo dnf install neofetch lolcat cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++ -y
    curl https://pyenv.run | bash
}

# Функция для установки пакетов на Arch и Manjaro
install_arch_manjaro() {
    sudo pacman -S neofetch lolcat cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python --noconfirm
    curl https://pyenv.run | bash
}

# Функция для установки alacritty через cargo
install_alacritty() {
    if ! command -v cargo &> /dev/null; then
        echo "Rust и Cargo не установлены. Устанавливаем..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source $HOME/.cargo/env
    fi

    # Клонируем репозиторий alacritty
    git clone https://github.com/alacritty/alacritty.git
    cd alacritty

    cargo build --release

    # Установка terminfo
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

    # Установка desktop entry
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    # Установка manual page
    sudo mkdir -p /usr/local/share/man/man1
    sudo mkdir -p /usr/local/share/man/man5
    scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
    scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
    scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

    # Установка shell completions
    mkdir -p ${ZDOTDIR:-~}/.zsh_functions
    echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
    cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

    cd ..
}

# Функция для копирования конфигурации alacritty
copy_alacritty_config() {
    mkdir -p ~/.config/alacritty
    cp -r ./alacritty ~/.config/alacritty/
}

# Определяем дистрибутив
if [ -f /etc/redos-release ]; then
    DISTRO="RedOS"
elif [ -f /etc/manjaro-release ]; then
    DISTRO="Manjaro"
elif [ -f /etc/arch-release ]; then
    DISTRO="Arch"
else
    echo "Unsupported distribution"
    exit 1
fi

# Перемещаем файлы в нужные директории
mv ./.zshrc ~/ 2>/dev/null || true

# Проверяем, существует ли каталог .oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    mv ./.oh-my-zsh ~/
fi

# Устанавливаем необходимые пакеты в зависимости от дистрибутива
case $DISTRO in
    "RedOS")
        install_redos
        ;;
    "Manjaro"|"Arch")
        install_arch_manjaro
        ;;
esac

install_alacritty
copy_alacritty_config

source ~/.zshrc

echo "install complete success"