local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
        'rebelot/kanagawa.nvim',
        as = 'kanagawa',
        'rose-pine/neovim',
        as = 'rose-pine',
        'morhetz/gruvbox',
        as = 'gruvbox',
		config = function()
			vim.cmd('colorscheme gruvbox')
--			vim.cmd('colorscheme rose-pine')
--			vim.cmd('colorscheme kanagawa')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

    use('mfussenegger/nvim-lint')
    use('mhartington/formatter.nvim')
    use {'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }}

      use({
          "epwalsh/obsidian.nvim",
          tag = "*",  -- recommended, use latest release instead of latest commit
          requires = { "nvim-lua/plenary.nvim", }})

          if packer_bootstrap then
              require("packer").sync()
          end
      end)
