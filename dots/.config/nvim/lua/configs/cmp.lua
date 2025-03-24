local cmp = require "cmp"
local defaults = require "nvchad.configs.cmp"

local custom_settings = {
  filetype = {
    tex = {
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "vimtex" },
        { name = "luasnip" },
      },
    },
  },
}

local final_config = vim.tbl_deep_extend("force", defaults, custom_settings)

cmp.setup(final_config)
