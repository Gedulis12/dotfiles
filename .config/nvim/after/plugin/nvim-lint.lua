require('lint').linters_by_ft = {
  yaml = {'yamllint',},
  json = {'jsonlint'},
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
