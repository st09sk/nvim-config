return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })

      -- Installs asynchronously. Parsers land in stdpath('data')/site, which is
      -- on the runtimepath, so no build step writes into the config directory.
      require('nvim-treesitter').install({
        'lua',
        'luadoc',
        'vim',
        'vimdoc',
        'query',
        'rust',
        'toml',
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true }),
        desc = 'Treesitter highlighting and folding',
        callback = function()
          pcall(vim.treesitter.start)
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo.foldmethod = 'expr'
        end,
      })
    end,
  },
}
