return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
      { '<leader>bp', '<cmd>BufferLinePick<cr>', desc = 'Pick buffer' },
      { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'Close other buffers' },
      { '<leader>bh', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer left' },
      { '<leader>bl', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer right' },
    },
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- Keep the bar to the right of the neo-tree sidebar.
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            text_align = 'left',
            separator = true,
          },
        },
      },
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      spec = {
        { '<leader>b', group = 'buffer' },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'debug' },
        { '<leader>f', group = 'find' },
        { '<leader>g', group = 'git' },
        { '<leader>l', group = 'lsp' },
        { '<leader>q', group = 'session' },
        { '<leader>s', group = 'split' },
        { '<leader>t', group = 'terminal' },
        { '<leader>u', group = 'ui' },
        { '<leader>x', group = 'diagnostics' },
      },
    },
  },
}
