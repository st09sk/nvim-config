return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle floating terminal' },
      {
        '<leader>th',
        '<cmd>ToggleTerm direction=horizontal size=15<cr>',
        desc = 'Toggle horizontal terminal',
      },
      {
        '<leader>tv',
        '<cmd>ToggleTerm direction=vertical size=80<cr>',
        desc = 'Toggle vertical terminal',
      },
      -- NvChad-style Alt toggles, where the terminal forwards them.
      {
        '<A-i>',
        '<cmd>ToggleTerm direction=float<cr>',
        desc = 'Toggle floating terminal',
        mode = { 'n', 't' },
      },
      {
        '<A-h>',
        '<cmd>ToggleTerm direction=horizontal size=15<cr>',
        desc = 'Toggle horizontal terminal',
        mode = { 'n', 't' },
      },
      {
        '<A-v>',
        '<cmd>ToggleTerm direction=vertical size=80<cr>',
        desc = 'Toggle vertical terminal',
        mode = { 'n', 't' },
      },
    },
    opts = {
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      direction = 'float',
      float_opts = { border = 'rounded' },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      -- Leave terminal mode without reaching for the default <C-\><C-n>.
      vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
      -- Window navigation while a terminal has focus.
      for _, key in ipairs({ 'h', 'j', 'k', 'l' }) do
        vim.keymap.set('t', '<C-' .. key .. '>', '<C-\\><C-n><C-w>' .. key, {
          desc = 'Go to window ' .. key,
        })
      end
    end,
  },
}
