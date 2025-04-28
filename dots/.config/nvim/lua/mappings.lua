require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<C-h>", function()
  vim.cmd "TmuxNavigateLeft"
end, { desc = "window left" })

map("n", "<C-l>", function()
  vim.cmd "TmuxNavigateRight"
end, { desc = "window right" })

map("n", "<C-j>", function()
  vim.cmd "TmuxNavigateDown"
end, { desc = "window down" })

map("n", "<C-k>", function()
  vim.cmd "TmuxNavigateUp"
end, { desc = "window up" })

map("n", "<leader>e", function()
  vim.cmd "NvimTreeToggle"
end, { desc = "toggle NvimTree" })

map("n", "<leader>ru", function()
  local filetype = vim.bo.filetype
  if filetype == "typescript" or filetype == "typescriptreact" then
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { "source.removeUnused.ts" },
        diagnostics = {},
      },
    }
  else
    vim.notify("This command is only available for TypeScript files.", vim.log.levels.WARN)
  end
end, { desc = "Remove Unused Imports (TypeScript)" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action {
    apply = false,
    context = {
      diagnostics = {},
    },
  }
end, { desc = "Open Code Action Menu" })

map("v", "<C-c>", '"+y', { desc = "Yank into system clipboard" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save current open buffer" })

map(
  "n",
  "<Leader>L",
  '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/luasnippets"})<CR>'
)
