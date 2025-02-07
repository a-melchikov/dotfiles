" Убираем фон (для прозрачного терминала)
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE


" Устанавливаем кодировку UTF-8 для работы с русскими символами
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251

" Настройки для Python
syntax enable
filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Настройки для русской раскладки и ввода
set langmenu=ru_RU.UTF-8
set iminsert=0
set imsearch=0

" Подсветка ошибок и предупреждений
set number           " отображение номеров строк
set relativenumber   " относительные номера строк
set cursorline       " подсветка текущей строки

" Устанавливаем vim-plug для управления плагинами
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'

call plug#end()

" Цветовая схема (например, Onedark)
" colorscheme onedark
colorscheme dracula

" Автосохранение
set autoread
set backup
set writebackup

" Настройки поиска
set ignorecase
set smartcase
set incsearch
set hlsearch

" Отступы
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Убираем ненужные звуки
set noerrorbells
set novisualbell
set t_vb=

" Включение line numbers
set number

" Настройки для буферов
set splitright
set splitbelow

