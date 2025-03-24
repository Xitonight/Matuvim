local helpers = require "luasnip-helper-funcs"
local get_visual = helpers.get_visual

return {
  s(
    { trig = "([^%a])tt", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\text{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%a])tit", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\textit{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = ";norm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\normalfont{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
}
