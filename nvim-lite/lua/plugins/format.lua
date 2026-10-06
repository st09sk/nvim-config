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
        -- stylua must be installed on the system; there is no mason here.
        lua = { 'stylua' },
      },
      formatters = {
        -- stylua defaults to tabs; keep the 2-space style used everywhere else.
        stylua = {
          prepend_args = { '--indent-type', 'Spaces', '--indent-width', '2' },
        },
      },
      -- Give a slow formatter a way out so it cannot stall a write.
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      },
    },
  },
}
