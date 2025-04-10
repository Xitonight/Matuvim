local tex_conditions = require "luasnippets.tex.utils.conditions"
local helpers = require "luasnippets.helper_functions"
local autosnippet = helpers.autosnippet

return {
  autosnippet(
    { trig = "mk", name = "$..$", dscr = "inline math" },
    fmta(
      [[
    $<>$<>
    ]],
      { i(1), i(0) }
    )
  ),

  autosnippet(
    { trig = "dm", name = "\\[...\\]", dscr = "display math" },
    fmta(
      [[ 
    \[ 
    <>
    \]
    <>]],
      { i(1), i(0) }
    ),
    { condition = helpers.line_begin, show_condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "ali", name = "align(|*|ed)", dscr = "align math" },
    fmta(
      [[ 
    \begin{align<>}
    <>
    \end{align<>}
    ]],
      { c(1, { t "*", t "", t "ed" }), i(2), rep(1) }
    ), -- in order of least-most used
    { condition = helpers.line_begin, show_condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "==", name = "&= align", dscr = "&= align" },
    fmta(
      [[
    &<> <> \\
    ]],
      { c(1, { t "=", t "\\leq", i(1) }), i(2) }
    ),
    { condition = tex_conditions.in_align, show_condition = tex_conditions.in_align }
  ),

  autosnippet(
    { trig = "gat", name = "gather(|*|ed)", dscr = "gather math" },
    fmta(
      [[ 
    \begin{gather<>}
    <>
    \end{gather<>}
    ]],
      { c(1, { t "*", t "", t "ed" }), i(2), rep(1) }
    ),
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "eqn", name = "equation(|*)", dscr = "equation math" },
    fmta(
      [[
    \begin{equation<>}
    <>
    .\end{equation<>}
    ]],
      { c(1, { t "*", t "" }), i(2), rep(1) }
    ),
    { condition = helpers.line_begin, show_condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "(%d?)cases", name = "cases", dscr = "cases", regTrig = true, hidden = true },
    fmta(
      [[<>
    \begin{cases}
    <>
    \end{cases}
    ]],
      { i(1) }
    ),
    { condition = tex_conditions.in_math, show_condition = tex_conditions.in_math }
  ),
}
