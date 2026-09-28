return {
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = {
        icons = {
          package_installed = '',
          package_pending = '',
          package_uninstalled = '',
        },
      },
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = { 'lua_ls' },
      -- rust-analyzer is installed through rustup and driven by rustaceanvim,
      -- so keep mason-lspconfig out of it.
      automatic_enable = { exclude = { 'rust_analyzer' } },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        'stylua', -- Lua formatter used by conform.nvim
        'codelldb', -- debug adapter used by rustaceanvim via nvim-dap
      },
      run_on_start = true,
      auto_update = false,
    },
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^9',
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              cargo = { allFeatures = true },
              check = { command = 'clippy' },
              files = { excludeDirs = { '.direnv', '.git', 'target' } },
              inlayHints = {
                bindingModeHints = { enable = false },
                closureReturnTypeHints = { enable = 'never' },
                lifetimeElisionHints = { enable = 'never' },
                parameterHints = { enable = true },
                typeHints = { enable = true },
              },
            },
          },
        },
        tools = {
          float_win_config = { border = 'rounded' },
        },
      }
    end,
  },
}
