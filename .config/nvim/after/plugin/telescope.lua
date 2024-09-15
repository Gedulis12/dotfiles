local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fgf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fgs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fgl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>fzf", builtin.current_buffer_fuzzy_find, {})

telescope.setup({
	pickers = {
        find_files = {
            hidden = true
        }
    },
})

