local helpers = require "snippets.helper_functions"
local autosnippet = helpers.autosnippet

return {
  autosnippet(
    { trig = "h([1-6])", regTrig = true, wordTrig = false },
    fmt([[<h{}>{}</h{}>]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "(div|span|p)", regTrig = true, wordTrig = false },
    fmt(
      [[
<{} className="{}">
  {}
</{}>
]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(2),
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    ),
    { condition = helpers.line_begin }
  ),

  autosnippet(
    { trig = "a", regTrig = true, wordTrig = false },
    fmt(
      [[
<a
  href="{}"
  target="_blank"
  rel="noopener noreferrer"
  className="{}"
>
  {}
</a>
]],
      {
        i(1),
        i(2),
        i(3),
      }
    ),
    { condition = helpers.line_begin }
  ),
}
