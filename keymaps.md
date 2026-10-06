# Keymaps

Reference for every mapping this config sets. Regenerate/update it whenever a
mapping is added.

**Notation**

| Symbol | Means |
| --- | --- |
| `<leader>` | Space |
| `<localleader>` | `\` |
| `<C-x>` | Ctrl + x |
| `<A-x>` | Alt + x (only if your terminal forwards Alt) |
| `<S-x>` | Shift + x |
| **Scope** | *Global* = always active; *Buffer* = only in an LSP-attached buffer; *Insert* / *Terminal* / *Visual* = that mode only |

---

## General

| Key | Action | Scope |
| --- | --- | --- |
| `<leader>w` | Save buffer | Global |
| `<leader>q` | Quit window | Global |
| `<leader>Q` | Quit Neovim | Global |
| `<Esc>` | Clear search highlight | Global |
| `<leader>uw` | Toggle word wrap (per window) | Global |
| `<leader>uc` | Colorscheme picker (live preview) | Global |

## Windows and splits

| Key | Action | Scope |
| --- | --- | --- |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move to window left / down / up / right | Global |
| `<leader>sv` | Split vertically | Global |
| `<leader>sh` | Split horizontally | Global |

## Buffers (bufferline)

| Key | Action | Scope |
| --- | --- | --- |
| `<S-l>` / `<S-h>` | Next / previous buffer | Global |
| `<leader>bd` | Delete current buffer | Global |
| `<leader>bp` | Pick a buffer by letter | Global |
| `<leader>bo` | Close all other buffers | Global |
| `<leader>bh` / `<leader>bl` | Move current buffer left / right | Global |

## File explorer (neo-tree)

| Key | Action | Scope |
| --- | --- | --- |
| `<leader>e` | Toggle file explorer | Global |
| `<leader>E` | Reveal current file in explorer | Global |

Common keys *inside* the neo-tree window: `<CR>` open, `a` add, `d` delete,
`r` rename, `?` help, `q` close.

## Find (Telescope)

| Key | Action | Scope |
| --- | --- | --- |
| `<leader>ff` | Find files | Global |
| `<leader>fg` | Live grep | Global |
| `<leader>fb` | Open buffers | Global |
| `<leader>fh` | Help tags | Global |
| `<leader>fd` | Diagnostics | Global |
| `<leader>fr` | Resume last picker | Global |

Inside a Telescope prompt: `<C-j>` / `<C-k>` move selection, `<CR>` open,
`<Esc>` close (insert mode).

## LSP — jump and actions

All **Buffer** scope: they exist only once a language server attaches.

| Key | Action |
| --- | --- |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References / find usages (quickfix list) |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>ds` | Document symbols (quickfix) |
| `<leader>ih` | Toggle inlay hints |

## LSP — fuzzy pickers

**Buffer** scope. Same data as above, surfaced in a searchable, previewable
Telescope list.

| Key | Action |
| --- | --- |
| `<leader>ld` | Definitions |
| `<leader>lr` | Find usages (references) |
| `<leader>li` | Implementations |
| `<leader>lt` | Type definitions |
| `<leader>ls` | Document symbols |
| `<leader>lS` | Workspace symbols |
| `<leader>lI` | Incoming calls / callers |
| `<leader>lO` | Outgoing calls / callees |

## Diagnostics

| Key | Action | Scope |
| --- | --- | --- |
| `[d` / `]d` | Previous / next diagnostic | Buffer |
| `gl` | Line diagnostics in a float | Buffer |
| `<leader>xd` | All diagnostics to the location list | Global |

## Git (gitsigns)

| Key | Action | Scope |
| --- | --- | --- |
| `]h` / `[h` | Next / previous git hunk | Global |
| `<leader>gs` | Stage hunk | Global |
| `<leader>gr` | Reset hunk | Global |
| `<leader>gp` | Preview hunk | Global |
| `<leader>gb` | Blame line (full) | Global |

## Formatting

| Key | Action | Scope |
| --- | --- | --- |
| `<leader>cf` | Format buffer | Global |

Formatting also runs **on save** (rustfmt for Rust, stylua for Lua).

## Terminal (toggleterm)

| Key | Action | Scope |
| --- | --- | --- |
| `<leader>tt` | Toggle floating terminal | Global |
| `<leader>th` | Toggle horizontal terminal (15 rows) | Global |
| `<leader>tv` | Toggle vertical terminal (80 cols) | Global |
| `<A-i>` / `<A-h>` / `<A-v>` | Same toggles (if Alt is forwarded) | Global + Terminal |
| `<C-x>` | Leave terminal mode | Terminal |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move to window from a terminal | Terminal |

## Debug (nvim-dap / rustaceanvim)

| Key | Action | Scope |
| --- | --- | --- |
| `<leader>dc` | Continue / start | Global |
| `<leader>db` | Toggle breakpoint | Global |
| `<leader>dB` | Conditional breakpoint | Global |
| `<leader>dr` | Open debug REPL | Global |
| `<leader>dt` | Terminate session | Global |
| `<leader>du` | Toggle debug UI | Global |
| `<F10>` / `<F11>` / `<F12>` | Step over / into / out | Global |

## Completion (insert mode)

Handled by nvim-cmp. **Insert** scope.

| Key | Action |
| --- | --- |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Next item, or expand/jump snippet |
| `<S-Tab>` | Previous item, or jump to previous snippet stop |
| `<C-b>` / `<C-f>` | Scroll documentation up / down |

## Editing helpers

| Key | Action | Scope |
| --- | --- | --- |
| `J` / `K` | Move selection down / up (keeps indent) | Visual |
| `gc` / `gcc` | Comment toggle (Neovim built-in, no mapping added) | Global |

## Neovim built-ins relied on

These come from Neovim itself (0.11+), not this config, but are worth knowing:

| Key | Action |
| --- | --- |
| `grn` | Rename (built-in; `gr` above is the config's shortcut) |
| `gra` | Code action |
| `grr` | References |
| `gri` | Implementation |
| `grt` | Type definition |
| `grx` | Run codelens |
| `gO` | Document symbols |
| `<C-s>` | Signature help (insert mode) |

## which-key groups

Press `<leader>` and pause to list these groups.

| Prefix | Group |
| --- | --- |
| `<leader>b` | buffer |
| `<leader>c` | code |
| `<leader>d` | debug |
| `<leader>f` | find |
| `<leader>g` | git |
| `<leader>l` | lsp |
| `<leader>q` | session |
| `<leader>s` | split |
| `<leader>t` | terminal |
| `<leader>u` | ui |
| `<leader>x` | diagnostics |

## Useful Ex commands

| Command | What it does |
| --- | --- |
| `:Lazy` | Plugin manager UI |
| `:Mason` | LSP/formatter installer UI |
| `:ConformInfo` | Show which formatter applies to this buffer |
| `:checkhealth` | Diagnose the setup |
| `:Neotree [toggle\|reveal\|focus]` | File explorer |
| `:Telescope <picker>` | Any picker, e.g. `:Telescope oldfiles` |
| `:ToggleTerm [direction=…] [size=…]` | Terminal |
| `:BufferLinePick` etc. | Buffer tab commands |
| `:TSInstall <lang>` | Treesitter parser |
| `:RustAnalyzer <cmd>` | rustaceanvim (e.g. `:RustAnalyzer status`) |
