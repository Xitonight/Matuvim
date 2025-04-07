local servers = {
  lua_ls = {},
  html = {},
  cssls = {},
  eslint = {},
  clangd = {},
  taplo = {},
  bashls = {},
  jsonls = {},
  prismals = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },
}

local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

lspconfig.denols.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

vim.diagnostic.config {
  virtual_text = true, -- Enables inline error messages
  signs = true, -- Enables signs in the gutter
  update_in_insert = false, -- Avoids updating while typing
  float = { border = "rounded" }, -- Configures floating windows
}
