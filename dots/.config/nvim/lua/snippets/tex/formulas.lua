local tex_conditions = require "snippets.tex.utils.conditions"
local helpers = require "snippets.helper_functions"
local autosnippet = helpers.autosnippet

return {

  autosnippet(
    { trig = "([^%a])ff", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta([[<>\frac{<>}{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_conditions.in_mathzone }
  ),

  autosnippet(
    { trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, helpers.get_visual),
    })
  ),

  autosnippet(
    { trig = "([^%a])jj", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<>\\
<>]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
      }
    )
  ),

  autosnippet(
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
    { condition = tex_conditions.in_mathzone }
  ),

  autosnippet(
    { trig = "([^%a])ee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>e^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, helpers.get_visual),
    }),
    { condition = tex_conditions.in_mathzone }
  ),

  autosnippet(
    { trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t "0",
    })
  ),

  autosnippet(
    { trig = "hh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\section{<>}]], { i(1) }),
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "Hh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\section*{<>}]], { i(1) }),
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "sh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\subsection{<>}]], { i(1) }),
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "Sh", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\subsection*{<>}]], { i(1) }),
    { condition = helpers.line_begin }
  ),

  autosnippet(
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
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "([%d%s%{%}%(%)%[%]])lss", snippetType = "autosnippet" },
    fmta([[<>{}_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_conditions.in_mathzone }
  ),

  autosnippet(
    { trig = "([%d%s%{%}%(%)%[%]])ss", snippetType = "autosnippet" },
    fmta([[<>_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_conditions.in_mathzone }
  ),

  autosnippet(
    { trig = "([%d%s%{%}%[%]%(%)])lSs", snippetType = "autosnippet" },
    fmta([[<>{}^{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_conditions.in_mathzone }
  ),

  autosnippet(
    { trig = "([%d%s%{%}%(%)%[%]])Ss", snippetType = "autosnippet" },
    fmta([[<>^{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_conditions.in_mathzone }
  ),
}
