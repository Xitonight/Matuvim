local tex_conditions = require "snippets.tex.utils.conditions"
local helpers = require "snippets.helper_functions"
local autosnippet = helpers.autosnippet

-- brackets
local brackets = {
  a = { "\\langle", "\\rangle" },
  b = { "[", "]" },
  c = { "\\{", "\\}" },
  m = { "|", "|" },
  p = { "(", ")" },
}

return {
  autosnippet(
    { trig = "lr([abcmp])", name = "left right", dscr = "left right delimiters", regTrig = true, hidden = true },
    fmta(
      [[
    \left<> <> \right<><>
    ]],
      {
        f(function(_, snip)
          local cap = snip.captures[1] or "p"
          return brackets[cap][1]
        end),
        d(1, helpers.get_visual),
        f(function(_, snip)
          local cap = snip.captures[1] or "p"
          return brackets[cap][2]
        end),
        i(0),
      }
    ),
    { condition = tex_conditions.in_math, show_condition = tex_conditions.in_math }
  ),
}
