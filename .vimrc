syntax enable " enable syntax highlighting
set nocompatible " use vim settings rather than vi

set autoindent " always set autoindenting on
set shiftwidth=4 " 4 spaces for indenting
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in TAB when editing
set expandtab " tabs are spaces
set smartindent
set smarttab

set number " show line numbers
set showcmd " show command in bottom bar
" set cursorline " highlight current line

filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]

set incsearch " search as characters are entered
set hlsearch " highligh matches
set smartcase " Enable smart-case search
set ignorecase " Always case-insensitive

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
" move vertically by visual line
nnoremap j gj
nnoremap k gk

set termencoding=UTF-8
set sessionoptions=curdir,buffers,tabpages

set wrap " enable line wrapping
set linebreak " avoid wrapping a line in the middle of a word 

set history=1000 " increase the undo limit
