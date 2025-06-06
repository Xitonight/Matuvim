local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier", "prettierd", stop_after_first = true },
    cmake = { "cmake_format" },
    html = { "prettier", "prettierd", stop_after_first = true },
    javascript = { "prettier", "prettierd", stop_after_first = true },
    typescript = { "prettier", "prettierd", stop_after_first = true },
    typescriptreact = { "prettier", "prettierd", stop_after_first = true },
    json = { "prettier", "prettierd", stop_after_first = true },
    sh = { "shfmt" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    toml = { "taplo" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
