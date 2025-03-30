local auto = require("luasnip").extend_decorator.apply(s, { snippetType = "autosnippet" })
local conditions = require "luasnippets.tex.utils.conditions"
local scaffolding = require "luasnippets.tex.utils.scaffolding"

-- brackets
local brackets = {
  a = { "\\langle", "\\rangle" },
  b = { "[", "]" },
  c = { "\\{", "\\}" },
  m = { "|", "|" },
  p = { "(", ")" },
}

return {
  auto(
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
        d(1, scaffolding.get_visual),
        f(function(_, snip)
          local cap = snip.captures[1] or "p"
          return brackets[cap][2]
        end),
        i(0),
      }
    ),
    { condition = conditions.in_math, show_condition = conditions.in_math }
  ),
}
