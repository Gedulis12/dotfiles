-- set leader key to spacebar
vim.g.mapleader = " "

-- leader E to open netrw
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)


-- Shift+q to run current line as a shell command and paste stdout in vim
vim.keymap.set("n", "Q", "!!$SHELL<CR>")

-- alt+v in command mode to paste current line in
vim.keymap.set("n", "<Esc>v", "<C->esubstitute(getline('.'), '^s*(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . ')*s*:*' , '', '')<CR>")

-- <F4> to toggle highlight.
-- let hlstate=0

vim.keymap.set("n", "F4", ":if (hlstate%2 == 0) | nohlsearch | else | set hlsearch | endif | let hlstate=hlstate+1<cr>")

-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to systems clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- map Esc to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- leader d to show error/warning diagnostic
vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', 
  { noremap = true, silent = true }
  )

-- quick note shortcut
vim.keymap.set("n", "<leader>n", ":!quicknote.sh<CR>")

-- no arrowkeys
-- vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Up>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("n", "<Down>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("n", "<Left>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("n", "<Right>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("v", "<Up>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("v", "<Down>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("v", "<Left>", ":echo 'Learn to use HJKL!!!'<CR>")
vim.keymap.set("v", "<Right>", ":echo 'Learn to use HJKL!!!'<CR>")
