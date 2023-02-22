vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
 
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = true

vim.opt.smarttab = true
vim.opt.tabstop=4
vim.opt.expandtab = true
vim.opt.shiftwidth=4
vim.opt.autoindent = true

vim.opt.termguicolors = true

--" Shift+q to run current line as a shell command and paste stdout in vim
--noremap Q !!$SHELL<CR>

--" alt+v in command mode to paste current line in
--cnoremap <Esc>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>

--" ctrl+c to toggle highlight.
--let hlstate=0

--nnoremap <F4> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
