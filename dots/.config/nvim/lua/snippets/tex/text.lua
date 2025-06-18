local helpers = require "snippets.helper_functions"
local autosnippet = helpers.autosnippet
local get_visual = helpers.get_visual

return {
  autosnippet(
    { trig = "([^%a])tt", regTrig = true, wordTrig = false },
    fmta([[<>\text{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  autosnippet(
    { trig = "([^%a])tit", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\textit{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  autosnippet(
    { trig = "([^%a])nf", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\normalfont{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
}
