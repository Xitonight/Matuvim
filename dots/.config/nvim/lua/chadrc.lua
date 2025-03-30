-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadwal",
  transparency = true,
}

M.nvdash = { load_on_startup = true }

M.mason = {
  pkgs = {
    "shellcheck",
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
  cmp = {
    lspkind_text = true,
    style = "atom",
  },
  telescope = { style = "bordered" },
  statusline = {
    theme = "minimal",
    separator_style = "round",
    order = { "mode", "file", "diagnostics", "%=", "lsp_msg", "%=", "cwd" },
  },
}

return M
