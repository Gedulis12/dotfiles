function ColorMyPencils(color)
--	color = color or "rose-pine"
--	color = color or "kanagawa"
    color = color or "gruvbox"
	vim.cmd.colorscheme(color)

--    vim.api.nvim_set_hl(0, "normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "normalFloat", { bg = "none" })
end

 ColorMyPencils()
