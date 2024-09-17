-- set leader key to spacebar
vim.g.mapleader = " "

-- leader E to open netrw
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

-- Shift+q to run current line as a shell command and paste stdout in vim
vim.keymap.set("n", "Q", "!!$SHELL<CR>")

-- alt+v in command mode to paste current line in
vim.keymap.set("c", "<Esc>v", "<C-\\>esubstitute(getline('.'), '^\\s*\\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\\)*\\s*:*' , '', '')<CR>")


-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to systems clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- map Esc to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- leader d to show error/warning diagnostic
vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- run format
vim.keymap.set("n", "<leader>F", ":Format<CR>")
vim.keymap.set("v", "<leader>F", ":Format<CR>")

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

--- toggle quickfix list
vim.api.nvim_set_keymap(
	"n",
	"<leader>q",
	':lua require("gedas.qftoggle").toggle_qf()<CR>',
	{ noremap = true, silent = true }
)

-- goto errors
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- obsidian
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>og", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>")
vim.keymap.set("n", "<leader>ocl", ":ObsidianLink<CR>")
vim.keymap.set("n", "<leader>onl", ":ObsidianLinkNew<CR>")
vim.keymap.set("n", "<leader>ofl", ":ObsidianFollowLink<CR>")
vim.keymap.set("n", "<leader>od", ":ObsidianDailies<CR>")
vim.keymap.set("n", "<leader>oc", ":ObsidianToggleCheckbox<CR>")
vim.keymap.set("n", "<leader>oi", ":ObsidianTOC<CR>")
