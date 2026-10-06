# Neovim setup options

Reference for evolving this config over time. Nothing here is required — it is a
menu. Add one group at a time and live with it before adding the next.

Columns:

- **Feature** — what you would be adding.
- **What it adds** — the user-visible benefit.
- **NvChad's pick** — what NvChad ships by default, for reference.
- **Options** — plugins that provide it; pick one unless noted.
- **Notes** — trade-offs or whether you already have it.
- **Added** — tick when it is in the config.

Current config: minimal, one plugin per job, leader = `Space`.

---

## 1. Where you already match NvChad

| Area | NvChad | This config | Notes |
| --- | --- | --- | --- |
| Completion | nvim-cmp | nvim-cmp | Same engine |
| LSP client | mason + nvim-lspconfig | mason + mason-lspconfig + mason-tool-installer | Same core |
| Formatting | conform.nvim | conform.nvim | Yours runs on save |
| Git signs | gitsigns.nvim | gitsigns.nvim | Same |
| Syntax/folds | nvim-treesitter | nvim-treesitter (main) | Same |
| File tree | nvim-tree.lua | neo-tree.nvim | Equivalent |
| Fuzzy finder | Telescope | Telescope | Same |
| Key hints | which-key.nvim | which-key.nvim | Same |
| Theme | base46 engine | tokyonight + picker | Yours persists the choice |

## 2. Where you have more than NvChad

| Feature | Why it matters |
| --- | --- |
| nvim-dap + dap-ui + codelldb | NvChad ships **no debugger** by default |
| Inlay hints enabled | Type hints rendered inline (NvChad leaves this off) |
| rustaceanvim | First-class Rust tooling beyond plain lspconfig |
| rustfmt on save | Rust files format on write |
| Colorscheme persistence | `nvim/.colorscheme` restores your theme across restarts |
| No framework lock-in | Each plugin is swappable without touching a distro |

---

## 3. Gaps: UI chrome

| Feature | What it adds | NvChad's pick | Options | Notes | Added |
| --- | --- | --- | --- | --- | --- |
| Indent guides | Vertical `│` markers per indent level, optional scope line | indent-blankline.nvim | lukas-reineke/indent-blankline.nvim, echasnovski/mini.indentscope, shellRaining/hlchunk.nvim | ibl = exact parity; mini = lighter; hlchunk = also shows code chunks | [ ] |
| Buffer tabline | A bar of open buffers at the top (NvChad's "tabufline") | nvchad/ui (built-in) | akinsho/bufferline.nvim, romgrk/barbar.nvim, tiagovla/scope.nvim, folke/snacks.nvim | bufferline is closest; scope.nvim changes buffer/tab behaviour rather than drawing a bar | [ ] |
| Startup dashboard | Landing screen with menu/shortcuts instead of an empty buffer | nvchad/ui (built-in) | goolord/alpha-nvim, nvimdev/dashboard-nvim, echasnovski/mini.starter, folke/snacks.nvim | All equivalent; choose by look | [ ] |
| Cheatsheet | A window listing all keymaps, searchable | `:NvCheatsheet` | folke/which-key.nvim (already installed), sudormrfbin/cheatsheet.nvim | which-key can already show everything — only a keymap is missing | [ ] |
| Inline color preview | Renders `#rrggbb` / `rgb()` as its actual colour | nvzone/minty (Huefy/Shades) | catgoose/nvim-colorizer.lua, brenoprata10/nvim-highlight-colors, uga-rosa/ccc.nvim | ccc.nvim also lets you pick colours | [ ] |
| Terminal management | Toggleable float/horizontal/vertical shells | nvchad.term (`<A-i>`, `<A-h>`, `<A-v>`) | akinsho/toggleterm.nvim, folke/snacks.nvim, plain `:terminal` + keymaps | toggleterm is the standard choice | [ ] |
| Notifications / cmdline UI | Fancier messages, LSP progress, cmdline popups | not in core | rcarriga/nvim-notify, folke/noice.nvim, j-hui/fidget.nvim | fidget is the lightest (LSP progress only) | [ ] |
| UI toggles | Quick toggles for numbers, wrap, spell, diagnostics | nvchad/ui | folke/snacks.nvim, or hand-written keymaps | ~5 lines to hand-write if you only want two or three | [ ] |
| Smooth scroll / animations | Animated scrolling and cursor effects | not in core | karb94/neoscroll.nvim, nvzone/nebula, folke/snacks.nvim | Cosmetic; entirely optional | [ ] |

## 4. Gaps: Editing ergonomics

| Feature | What it adds | NvChad's pick | Options | Notes | Added |
| --- | --- | --- | --- | --- | --- |
| Auto-pairs | Closes `(){}[]""` as you type | nvim-autopairs | windwp/nvim-autopairs, echasnovski/mini.pairs, altermo/ultimate-autopair.nvim | nvim-autopairs integrates with cmp's confirm | [ ] |
| Commenting | Comment/uncomment lines and blocks | built-in `gc`, mapped to `<leader>/` | no plugin needed (Neovim 0.10+ ships `gc`/`gcc`), numToStr/Comment.nvim | You only need to add the `<leader>/` keymap | [ ] |
| Snippets | Insertable boilerplate (fn, match, impl, test…) with tab stops | LuaSnip + friendly-snippets | L3MON4D3/LuaSnip + rafamadriz/friendly-snippets, echasnovski/mini.snippets, keep vim-vsnip + hrsh7th/vim-vsnip-integ | You have vim-vsnip but **no snippet collection**, so you effectively have none | [ ] |
| Text objects | `af`/`if`-style motions for functions, args, classes | not in core | nvim-treesitter/nvim-treesitter-textobjects, echasnovski/mini.ai, chrisgrieser/nvim-various-textobjs | treesitter-textobjects works with your main-branch treesitter | [ ] |
| Surround | Add/change/delete surrounding brackets and quotes | not in core | kylechui/nvim-surround, echasnovski/mini.surround | Pairs well with text objects | [ ] |
| Motion / jump | Jump to any visible word/char with two keys | not in core | folke/flash.nvim, echasnovski/mini.jump, smoka7/hop.nvim | flash is the most popular (used by LazyVim) | [ ] |
| Undo tree UI | Visualise and jump through edit history | not in core | mbbill/undotree, jiaoshijie/undotree, folke/snacks.nvim | You already have persistent undo (`undofile`) | [ ] |
| Session persistence | Save/restore a working set of buffers and layout | not in core | folke/persistence.nvim, rmagatti/auto-session | persistence.nvim is manual (`:Session`) | [ ] |
| Harpoon / marks | Pin a few files and jump to them instantly | not in core | ThePrimeagen/harpoon (harpoon2 branch), otavioschwanck/arrow.nvim, folke/snacks.nvim | Useful once you juggle many files | [ ] |

## 5. Gaps: Finder extras

| Feature | What it adds | NvChad's pick | Options | Notes | Added |
| --- | --- | --- | --- | --- | --- |
| More Telescope pickers | oldfiles, marks, fuzzy-find in buffer, git commits/status, terms, find-all | yes, as keymaps | no plugin needed — all are Telescope builtins | Only keymaps are missing; see the table in section 9 | [ ] |
| fzf-native sorter | Faster, more accurate Telescope ranking | configured | nvim-telescope/telescope-fzf-native.nvim | Small build step (needs `make`/cc) | [ ] |
| Alternative picker | Replace Telescope entirely | no | ibhagwan/fzf-lua | Only if Telescope feels slow; a lateral move | [ ] |

## 6. Gaps: LSP / diagnostics extras

| Feature | What it adds | NvChad's pick | Options | Notes | Added |
| --- | --- | --- | --- | --- | --- |
| Diagnostics panel | A list of all problems with preview and jump | not in core | folke/trouble.nvim | The standard; complements `[d`/`]d` | [ ] |
| Inline diagnostics | Diagnostic text rendered at end of line, styled | tiny-inline-diagnostic | rachartier/tiny-inline-diagnostic.nvim | You already show virtual text; this is prettier | [ ] |
| Linting | Non-LSP linters (shellcheck, markdownlint…) | not in core | mfussenegger/nvim-lint | You currently have LSP diagnostics only | [ ] |

## 7. Gaps: Treesitter extras

| Feature | What it adds | NvChad's pick | Options | Notes | Added |
| --- | --- | --- | --- | --- | --- |
| Sticky context | Pins the enclosing function/class at the top while scrolling | not in core | nvim-treesitter/nvim-treesitter-context | Very handy in long functions | [ ] |
| Rainbow delimiters | Colours nested brackets by depth | not in core | HiPhish/rainbow-delimiters.nvim | Cosmetic | [ ] |

---

## 8. Mapping-scheme differences

Nothing is missing here — only muscle memory differs. Change individual keys if
the NvChad defaults feel more natural.

| Action | NvChad | This config |
| --- | --- | --- |
| Tree toggle | `<C-n>` | `<leader>e` |
| Tree focus current file | `<leader>e` | `<leader>E` |
| Next / prev buffer | `<Tab>` / `<S-Tab>` | `<S-l>` / `<S-h>` |
| Close buffer | `<leader>x` | `<leader>bd` |
| Save file | `<C-s>` | `<leader>w` |
| Format | `<leader>fm` | `<leader>cf` |
| Find files | `<leader>ff` | `<leader>ff` |
| Live grep | `<leader>fw` | `<leader>fg` |
| Theme switch | `<leader>th` | `<leader>uc` |
| Cheatsheet | `<leader>ch` | (none) |
| All keymaps | `<leader>wK` | (none) |
| Toggle comment | `<leader>/` | built-in `gcc`/`gc` |
| New / toggle terminal | `<leader>h`, `<A-i>` | (none) |

## 9. Cheap wins (no new plugins)

These are keymaps/config only, using what is already installed:

| Win | How |
| --- | --- |
| `<leader>/` to toggle a comment | map to `gcc` (normal) and `gc` (visual) |
| More Telescope pickers | add `<leader>fo` oldfiles, `<leader>fm` marks, `<leader>fz` current-buffer fuzzy find, `<leader>gc` git commits, `<leader>gs` git status |
| Full keymap list | `<leader>wK` → `:WhichKey`, `<leader>wk` → `:WhichKey <query>` |
| Toggle line numbers | `<leader>un` → `:set nu!<CR>`, `<leader>uN` → `:set rnu!<CR>` |
| Longest-line / diagnostics nav | already have `[d`, `]d`, `gl`, `Space x d` |

---

## 10. A sensible adoption order

Start with ergonomics that affect every file, then chrome, then extras. Re-evaluate
after each step; skip anything you have not missed.

1. **Snippets** (LuaSnip + friendly-snippets) and **auto-pairs** — biggest daily difference.
2. **Text objects** + **surround** — make editing motions feel complete.
3. **Indent guides** and **bufferline** — the two most visible NvChad UI pieces.
4. **Cheap wins** from section 9 (no dependencies).
5. **Trouble** or **tiny-inline-diagnostic** — diagnostics presentation.
6. **Terminal management** (toggleterm) if you use shells inside Neovim.
7. The rest only when you personally feel the lack of it.

---

## Sources

- NvChad default plugins: https://raw.githubusercontent.com/NvChad/NvChad/master/lua/nvchad/plugins/init.lua
- NvChad default mappings: https://raw.githubusercontent.com/NvChad/NvChad/master/lua/nvchad/mappings.lua
- NvChad repository: https://github.com/NvChad/NvChad
