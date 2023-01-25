" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"color schemes
Plug 'morhetz/gruvbox'

"code-completion engine for Vim
"Plug 'ycm-core/YouCompleteMe'

"auto-pairs
Plug 'jiangmiao/auto-pairs'

"fugitive.vim
Plug 'tpope/vim-fugitive'

"vim-gitgutter
Plug 'airblade/vim-gitgutter'

"ctrlp.vim full path fuzzy file, buffer, meny, tag ... finder for vim
Plug 'kien/ctrlp.vim'

"easy motion
Plug 'easymotion/vim-easymotion'

"this plugin provides mappings to easily delete, change and add such
"surroundings in pairs
"use ':help surround' for help
Plug 'tpope/vim-surround'

" Улучшенная строка состояния
Plug 'vim-airline/vim-airline'

" Плагин для иконок и шрифтов в Airline
Plug 'ryanoasis/vim-devicons'

call plug#end()

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
set foldenable " отклключить фолдинг по умолчанию
"set foldmethod=syntax " определять блоки на основе синтаксиса файла
set foldmethod=indent " определять блоки на основе отступов
set shiftwidth=4 ""
set foldnestmax=5       "deepest fold is 5 levels
set foldcolumn=3 " показать полосу для управления сворачиванием
set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них

set number relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set fileformat=unix
set incsearch
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
set scrolloff=7
set colorcolumn=79
set encoding=UTF-8
set cursorline
set mouse=
syntax enable


" Настройки для возможности работы с русской раскладкой без переключения
" системной раскладки
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Настройки для Airline
let g:airline_powerline_fonts = 1 " Включить поддуржку Powerline шрифтов
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" " Кастомная графа положения курсора
let g:Powerline_symbols='unicode' " Поддержка unicode

" mappings
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

let g:markdown_fenced_languages = ['html', 'python', 'vim', 'ruby', 'bash=sh', 'go']
set ttimeoutlen=10 " Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SI = режим замены
let &t_EI.="\e[1 q" "SI = нормальный режим

" Skeleton files
autocmd BufNewFile *.sh 0r ~/scripts/skeletons/bash.sh
autocmd BufNewFile *.go 0r ~/scripts/skeletons/go.go
