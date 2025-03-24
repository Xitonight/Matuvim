local helpers = require "luasnip-helper-funcs"
local in_mathzone = helpers.in_mathzone

return {
  s(
    { trig = "([%d%$%s%\\%(%)%[%]%{%}]);", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),
  s({ trig = "\\a", snippetType = "autosnippet" }, { t "\\alpha" }, { condition = in_mathzone }),
  s({ trig = "\\b", snippetType = "autosnippet" }, { t "\\beta" }, { condition = in_mathzone }),
  s({ trig = "\\g", snippetType = "autosnippet" }, { t "\\gamma" }, { condition = in_mathzone }),
  s({ trig = "RR", snippetType = "autosnippet" }, fmta([[\mathbb{R}^{<>}]], { i(1) }), { condition = in_mathzone }),
  s({ trig = "QQ", snippetType = "autosnippet" }, fmta([[\mathbb{Q}^{<>}]], { i(1) }), { condition = in_mathzone }),
  s({ trig = "ZZ", snippetType = "autosnippet" }, fmta([[\mathbb{Z}^{<>}]], { i(1) }), { condition = in_mathzone }),
  s(
    { trig = "([^%w])ee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>&]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = in_mathzone }
  ),
}
