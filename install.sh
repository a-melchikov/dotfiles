#!/bin/bash

# Функция для установки пакетов на RedOS
install_redos() {
    sudo dnf install neofetch lolcat -y
    curl https://pyenv.run | bash
}

# Функция для установки пакетов на Arch и Manjaro
install_arch_manjaro() {
    sudo pacman -S neofetch lolcat --noconfirm
    curl https://pyenv.run | bash
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

source ~/.zshrc

echo "install complete success"