-- Diagnostics presentation and LSP buffer keymaps.
--
-- There is no mason here, so servers must be installed on the system. Only
-- lua_ls is configured and enabled (see plugins/lsp.lua). This file registers
-- its settings and the shared keymaps.

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = '●' },
  severity_sort = true,
  update_in_insert = false,
  underline = true,
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      completion = { callSnippet = 'Replace' },
      telemetry = { enable = false },
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  desc = 'Buffer-local LSP keymaps',
  callback = function(event)
    local function map(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('gr', vim.lsp.buf.references, 'References')
    map('gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('K', vim.lsp.buf.hover, 'Hover documentation')
    map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('<leader>ds', vim.lsp.buf.document_symbol, 'Document symbols')
    map('gl', vim.diagnostic.open_float, 'Line diagnostics')
    map('[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous diagnostic')
    map(']d', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic')

    -- Same data as the go-to keys above, but surfaced in a Telescope picker so
    -- multi-result jumps (usages especially) are searchable and previewable.
    local telescope = function(picker)
      return function() require('telescope.builtin')[picker]() end
    end
    map('<leader>ld', telescope('lsp_definitions'), 'Definitions (picker)')
    map('<leader>lr', telescope('lsp_references'), 'Find usages (picker)')
    map('<leader>li', telescope('lsp_implementations'), 'Implementations (picker)')
    map('<leader>lt', telescope('lsp_type_definitions'), 'Type definitions (picker)')
    map('<leader>ls', telescope('lsp_document_symbols'), 'Document symbols (picker)')
    map('<leader>lS', telescope('lsp_dynamic_workspace_symbols'), 'Workspace symbols (picker)')
    map('<leader>lI', telescope('lsp_incoming_calls'), 'Incoming calls / callers (picker)')
    map('<leader>lO', telescope('lsp_outgoing_calls'), 'Outgoing calls / callees (picker)')

    -- Neovim only renders inlay hints once a buffer opts in. Enable per
    -- attached buffer, and provide a toggle.
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
      map('<leader>ih', function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
      end, 'Toggle inlay hints')
    end
  end,
})
