function Nohl()
    vim.api.nvim_set_hl(0, "normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "normalFloat", { bg = "none" })
end

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    Nohl()
end

ColorMyPencils()

