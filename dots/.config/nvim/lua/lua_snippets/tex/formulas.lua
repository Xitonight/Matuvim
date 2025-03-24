local helpers = require "luasnip-helper-funcs"
local in_mathzone = helpers.in_mathzone
local get_visual = helpers.get_visual
local line_begin = helpers.line_begin

return {

  s(
    { trig = "([^%a])ff", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\frac{<>}{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = in_mathzone }
  ),

  s(
    { trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%a])jj", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<>//
<>]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        d(1, get_visual),
      }
    )
  ),

  s(
    { trig = "([^%a])pmat", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
      <>\begin{pmatrix}
          <>
       \end{pmatrix}]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
      }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "([^%a])ee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>e^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = in_mathzone }
  ),

  s(
    { trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t "0",
    })
  ),

  s(
    { trig = "hh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\section{<>}]], { i(1) }),
    { condition = line_begin }
  ),

  s(
    { trig = "shh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\section*{<>}]], { i(1) }),
    { condition = line_begin }
  ),

  s(
    { trig = "sh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\subsection{<>}]], { i(1) }),
    { condition = line_begin }
  ),

  s(
    { trig = "ssh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\subsection*{<>}]], { i(1) }),
    { condition = line_begin }
  ),

  s(
    { trig = "new", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "al", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{align*}
          <>
      \end{align*}
    ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "([%d%s%{%}%(%)%[%]])lss", snippetType = "autosnippet" },
    fmta([[<>{}_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = in_mathzone }
  ),

  s(
    { trig = "([%d%s%{%}%(%)%[%]])ss", snippetType = "autosnippet" },
    fmta([[<>_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = in_mathzone }
  ),

  s(
    { trig = "([%d%s%{%}%[%]%(%)])lSs", snippetType = "autosnippet" },
    fmta([[<>{}^{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = in_mathzone }
  ),

  s(
    { trig = "([%d%s%{%}%(%)%[%]])Ss", snippetType = "autosnippet" },
    fmta([[<>^{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = in_mathzone }
  ),
}
