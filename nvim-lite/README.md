# nvim-lite

A lean Neovim config: [`../nvim`](../nvim) minus Rust tooling, treesitter,
the debugger (nvim-dap), and mason. It is a standalone copy, not generated
from the main config.

Still included: lazy.nvim, LSP (lua_ls only), nvim-cmp, telescope, neo-tree,
gitsigns, bufferline/lualine, toggleterm, conform, tokyonight, which-key.

## Usage

A separate `NVIM_APPNAME` gives this config its own config dir, plugin dir,
and state, fully isolated from the main config:

```sh
ln -s ~/path/to/neovim/nvim-lite ~/.config/nvim-lite
NVIM_APPNAME=nvim-lite nvim
```

Handy alias:

```sh
alias nvim-lite='NVIM_APPNAME=nvim-lite nvim'
```

Plugins install to `~/.local/share/nvim-lite`.

## External requirements

Mason is not included, so these must be on `PATH` if you want them:

- `lua_ls` — Lua language server
- `stylua` — Lua formatter used by conform.nvim
- a Nerd Font for devicons and the LSP/diagnostic signs

Without `lua_ls`/`stylua` the config still loads; LSP just never attaches and
formatting is skipped.
