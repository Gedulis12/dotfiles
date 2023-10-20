require("mason").setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings ({
})

cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
        require('luasnip').lsp_expand(args.body)
  end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
	['<C-p'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y'] = cmp.mapping.confirm({ select = true}),
	['<C-Space'] = cmp.mapping.complete(),
    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' },
  },
  {
    { name = 'buffer' },
  })
})

lsp.setup()
