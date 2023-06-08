---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
  },
  t = {
    ["<C-]>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  }
}

-- more keybinds!

return M
