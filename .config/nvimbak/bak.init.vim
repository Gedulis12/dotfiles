" interface
set background=light
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

" latex preview engine
let g:livepreview_engine = 'xelatex'

" Plugins

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/xiyaowong/nvim-transparent' " Transparancy

call plug#end()

colorscheme parsec
set encoding=UTF-8
"let g:NERDTreeDirArrowExpandable="+"
"let g:NERDTreeDirArrowCollapsible="~"

"NERDTree toggle
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"Tagbar toggle
nmap <F8> :TagbarToggle<CR>

" Autocomplete with tab
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

let g:transparent_enabled = v:true
