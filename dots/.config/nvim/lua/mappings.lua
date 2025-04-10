require "nvchad.mappings"

-- add yours here

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

map("v", "<C-c>", '"+y', { desc = "Yank into system clipboard" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save current open buffer" })

map(
  "n",
  "<Leader>L",
  '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/luasnippets"})<CR>'
)
