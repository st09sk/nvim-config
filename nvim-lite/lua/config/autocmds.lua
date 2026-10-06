local augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- Briefly highlight yanked text.
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight yanked text',
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

-- Markdown uses 4-space indents; everything else keeps the global 2.
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'markdown' },
  desc = 'Four-space indent for markdown',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Wrap prose filetypes; code keeps wrap off so long lines scroll.
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'markdown', 'text', 'gitcommit', 'rst', 'tex', 'mail' },
  desc = 'Wrap prose filetypes',
  callback = function()
    vim.wo.wrap = true
  end,
})

-- Reopen a file at the last cursor position.
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  desc = 'Restore last cursor position',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
