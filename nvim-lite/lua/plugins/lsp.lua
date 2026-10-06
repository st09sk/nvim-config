return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    -- No mason in this config, so lua_ls must be on PATH (system package
    -- manager, luarocks, etc.). Its settings live in lua/config/lsp.lua.
    config = function()
      vim.lsp.enable('lua_ls')
    end,
  },
}
