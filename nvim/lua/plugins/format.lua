return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function() require('conform').format({ async = true }) end,
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
      },
      formatters = {
        -- stylua defaults to tabs; keep the 2-space style used everywhere else.
        stylua = {
          prepend_args = { '--indent-type', 'Spaces', '--indent-width', '2' },
        },
      },
      -- rustfmt and stylua both write in place quickly; the timeout keeps a
      -- slow formatter from stalling a write.
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      },
    },
  },
}
