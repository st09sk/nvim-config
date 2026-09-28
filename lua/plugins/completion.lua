return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    -- LSP servers read their capabilities when they attach, which can happen
    -- before InsertEnter. Registering them from `init` guarantees the servers
    -- see cmp's capabilities on first launch.
    init = function()
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
              vim.fn.feedkeys(
                vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, false, true),
                ''
              )
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
              vim.fn.feedkeys(
                vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, false, true),
                ''
              )
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vsnip' },
        }, {
          { name = 'path' },
          { name = 'buffer', keyword_length = 2 },
          { name = 'nvim_lua', keyword_length = 2 },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, item)
            local icons = {
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }
            item.menu = icons[entry.source.name]
            return item
          end,
        },
      })
    end,
  },
}
