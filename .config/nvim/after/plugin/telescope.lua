local builtin = require("telescope.builtin")
local telescope = require("telescope")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fgf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fgs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fgl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, {})

telescope.setup({
	pickers = {
        find_files = {
            hidden = true
        }
    },
})

