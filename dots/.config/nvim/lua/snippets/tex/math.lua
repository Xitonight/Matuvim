local tex_conditions = require "snippets.tex.utils.conditions"
local helpers = require "snippets.helper_functions"
local autosnippet = helpers.autosnippet
local get_visual = helpers.get_visual

return {
  autosnippet(
    { trig = "mk", name = "$..$", dscr = "inline math" },
    fmta(
      [[
    $<>$<>
    ]],
      { d(1, get_visual), i(0) }
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
      { d(1, get_visual), i(0) }
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
    \end{equation<>}
    ]],
      { c(1, { t "*", t "" }), i(2), rep(1) }
    ),
    { condition = helpers.line_begin, show_condition = helpers.line_begin }
  ),
}
