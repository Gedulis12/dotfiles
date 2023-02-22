" interface
set background=dark
set enc=utf8
set number relativenumber
syntax on
set cursorline
set listchars=tab:\|\ 
set list
 
set hlsearch
set incsearch
set ignorecase
set smartcase
set pastetoggle=<F2>
set showmode


" tabs
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

" Shift+q to run current line as a shell command and paste stdout in vim
noremap Q !!$SHELL<CR>

" alt+v in command mode to paste current line in
cnoremap <Esc>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>

" ctrl+c to toggle highlight.
let hlstate=0

nnoremap <F4> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" toggle pastemode
nnoremap <F2> :set invpaste paste?<CR>

