return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    keys = {
      { '<leader>dc', function() require('dap').continue() end, desc = 'Continue / start' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle breakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Conditional breakpoint' },
      { '<leader>dr', function() require('dap').repl.open() end, desc = 'Open REPL' },
      { '<leader>dt', function() require('dap').terminate() end, desc = 'Terminate' },
      { '<leader>du', function() require('dapui').toggle() end, desc = 'Toggle UI' },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup({})

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- codelldb comes from mason and is picked up by rustaceanvim; step
      -- mappings are the only part dap does not ship.
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Step over' })
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Step into' })
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'Step out' })
    end,
  },
}
