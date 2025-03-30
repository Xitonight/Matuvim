return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
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
}
