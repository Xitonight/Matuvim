local tex_utils = {}

local ls = require "luasnip"
local sn = ls.snippet_node
local i = ls.insert_node

tex_utils.get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end

tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env "equation"
end

tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env "itemize"
end

tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env "tikzpicture"
end

tex_utils.in_align = function() -- TikZ picture environment detection
  return tex_utils.in_env "align*"
end

tex_utils.line_begin = require("luasnip.extras.expand_conditions").line_begin

return tex_utils
