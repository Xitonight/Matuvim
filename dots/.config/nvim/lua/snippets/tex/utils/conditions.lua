local M = {}

-- math / not math zones
function M.in_math()
  return vim.api.nvim_eval "vimtex#syntax#in_mathzone()" == 1
end

-- comment detection
function M.in_comment()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

-- document class
function M.in_beamer()
  return vim.b.vimtex["documentclass"] == "beamer"
end

-- general env function
function M.env(name)
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

function M.in_preamble()
  return not M.env "document"
end

function M.in_text()
  return M.env "document" and not M.in_math()
end

function M.in_tikz()
  return M.env "tikzpicture"
end

function M.in_bullets()
  return M.env "itemize" or M.env "enumerate"
end

function M.in_align()
  return M.env "align" or M.env "align*" or M.env "aligned"
end

return M
