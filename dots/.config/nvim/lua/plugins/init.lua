return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require "configs.cmp"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
        "bash",
        "cpp",
        "css",
        "html",
        "hyprlang",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown", "quarto" },
  },

  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "dev", to use the latest commit
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_imaps_enabled = false

      vim.g.vimtex_compiler_latexmk = {
        aux_dir = function()
          return vim.fn.expand "~" .. "/.cache/texfiles/" .. vim.fn.expand "%:t:r"
        end,
        out_dir = function()
          return vim.fn.expand "%:t:r"
        end,
      }

      vim.g.vimtex_view_method = "zathura"

      vim.g.vimtex_format_enabled = true
      vim.g.vimtex_format_method = "latexindent"
      vim.g.vimtex_quickfix_open_on_warning = false
      vim.g.vimtex_view_forward_search_on_start = false
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    event = { "BufWritePre", "BufNewFile" },
    opts = {},
  },
}
