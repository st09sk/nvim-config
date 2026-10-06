local map = vim.keymap.set

-- Files and windows
map('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save buffer' })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit window' })
map('n', '<leader>Q', '<cmd>qa<cr>', { desc = 'Quit Neovim' })
map('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })
map('n', '<leader>sv', '<C-w>v', { desc = 'Split vertical' })
map('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontal' })

-- Wrapping is per window; prose filetypes turn it on automatically.
map('n', '<leader>uw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = 'Toggle word wrap' })

map('n', '<C-h>', '<C-w>h', { desc = 'Go to window left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to window up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to window right' })

-- Buffers. Cycle/move keys live in the bufferline spec in plugins/ui.lua.
map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

-- Move the current selection and re-indent it
map('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
map('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })

-- Diagnostics
map('n', '<leader>xd', vim.diagnostic.setloclist, { desc = 'Diagnostics to location list' })
