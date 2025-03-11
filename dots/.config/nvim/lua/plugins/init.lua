return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "bash",
        "cpp",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "javascript",
        "typescript",
        "hyprlang",
        "json",
        "toml",
        "yaml",
        "python",
      },
    },
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
}
