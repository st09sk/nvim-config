-- Neovim entry point.
--
-- Order matters. Options, keymaps and LSP client config are registered first,
-- then lazy.nvim loads the plugin specs in lua/plugins/.

require('config.options') -- vim.opt settings
require('config.keymaps') -- global keymaps
require('config.autocmds') -- filetype and event hooks
require('config.lsp') -- diagnostics + vim.lsp.config, before servers enable
require('config.lazy') -- plugin manager
