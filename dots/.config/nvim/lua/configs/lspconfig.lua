local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()

local servers = {
  bashls = {},
  cmake = {},
  clangd = {},
  cssls = {},
  -- denols = {}, -- Disabled as conflicts with ts_ls and can't fix it since neovim 0.11
  eslint = {
    settings = {
      format = false,
    },
  },
  html = {},
  jsonls = {},
  lua_ls = {},
  prismals = {},
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
    root_markers = {
      "main.py",
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
      ".git",
    },
  },
  svelte = {},
  taplo = {},
  tailwindcss = {},
  ts_ls = {},
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end
