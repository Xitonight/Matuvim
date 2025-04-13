local cmp = require "cmp"

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

local final_config = vim.tbl_deep_extend("force", custom_settings, require "nvchad.configs.cmp")

return final_config
