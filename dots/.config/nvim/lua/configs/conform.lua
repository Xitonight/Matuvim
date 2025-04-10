local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier", "prettierd", stop_after_first = true },
    html = { "prettier", "prettierd", stop_after_first = true },
    javascript = { "prettier", "prettierd", stop_after_first = true },
    typescript = { "prettier", "prettierd", stop_after_first = true },
    typescriptreact = { "prettier", "prettierd", stop_after_first = true },
    json = { "prettier", "prettierd", stop_after_first = true },
    sh = { "shfmt" },
    python = { "black" },
    toml = { "taplo" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
