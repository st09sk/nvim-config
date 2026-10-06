return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = 'Neotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle file explorer' },
      { '<leader>E', '<cmd>Neotree reveal<cr>', desc = 'Reveal current file' },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
      },
      window = { width = 35 },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Open buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags' },
      { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },
      { '<leader>fr', '<cmd>Telescope resume<cr>', desc = 'Resume last picker' },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { '^%.git/' },
        mappings = {
          i = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
          },
        },
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    keys = {
      { ']h', function() require('gitsigns').nav_hunk('next') end, desc = 'Next git hunk' },
      { '[h', function() require('gitsigns').nav_hunk('prev') end, desc = 'Previous git hunk' },
      { '<leader>gs', function() require('gitsigns').stage_hunk() end, desc = 'Stage hunk' },
      { '<leader>gr', function() require('gitsigns').reset_hunk() end, desc = 'Reset hunk' },
      { '<leader>gp', function() require('gitsigns').preview_hunk() end, desc = 'Preview hunk' },
      { '<leader>gb', function() require('gitsigns').blame_line({ full = true }) end, desc = 'Blame line' },
    },
  },
}
