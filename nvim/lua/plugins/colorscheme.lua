-- Colorscheme selection and persistence.
--
-- The active theme can be changed live from inside Neovim, either with
-- `:colorscheme <name>` or the Telescope picker (which previews as you move).
-- Whatever is active when you leave is remembered in a small state file next
-- to the config, so the next launch restores it.

local state_file = vim.fn.stdpath('config') .. '/.colorscheme'

---@return string|nil
local function read_saved()
  local f = io.open(state_file, 'r')
  if not f then
    return nil
  end
  local name = f:read('*l')
  f:close()
  if name and name ~= '' then
    return name
  end
  return nil
end

---@param name string
local function write_saved(name)
  local f = io.open(state_file, 'w')
  if f then
    f:write(name)
    f:close()
  end
end

--- Applies a colorscheme, returning false (instead of raising) when the name
--- is unknown, e.g. a saved theme whose plugin is no longer installed.
---@param name string|nil
---@return boolean
local function apply(name)
  if name and name ~= '' and pcall(vim.cmd.colorscheme, name) then
    return true
  end
  return false
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = { style = 'night' },
    config = function(_, opts)
      require('tokyonight').setup(opts)

      -- Default theme for a fresh start. Respects `opts.style` above.
      apply('tokyonight')

      -- Only persist switches the user makes, not our own startup applies.
      local recording = false
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('UserColorscheme', { clear = true }),
        desc = 'Remember the active colorscheme',
        callback = function()
          if recording and vim.g.colors_name then
            write_saved(vim.g.colors_name)
          end
        end,
      })

      -- Restore the saved theme once every (eagerly loaded) plugin is present,
      -- otherwise a non-tokyonight theme would not be registered yet.
      vim.api.nvim_create_autocmd('VimEnter', {
        once = true,
        callback = function()
          apply(read_saved())
          recording = true
        end,
      })

      -- Live picker with preview. Moving the selection previews the theme;
      -- <CR> keeps it, <Esc> reverts to the theme you had.
      vim.keymap.set('n', '<leader>uc', '<cmd>Telescope colorscheme enable_preview=true<cr>', {
        desc = 'Colorscheme picker',
      })
    end,
  },
}
