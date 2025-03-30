local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s(
    { trig = "([^%a])cin", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmt("{}cin >> {};", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, "Your variable here"),
    })
  ),
  s(
    { trig = "([^%a])cout", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmt("{}cout << {};", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, "Your text here"),
    })
  ),
  s(
    { trig = "func", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
        <><> <>(<>) {
          <>
        } <>
      ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1, "type"),
        i(2, "name"),
        i(3, "params"),
        i(4),
        i(5),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "([^%a])if", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
        <>if (<>) {
          <>
         } <>
      ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1, "condition"),
        i(2),
        i(3),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "([^%a]%s)elif", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
        <>else if (<>) {
          <>
        } <>
      ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1, "condition"),
        i(2),
        i(3),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "([^%a]%s)else", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
        <>else {
          <>
        }
        <>
      ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "([^%a])for", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
        <>for (<>; <>; <>) {
          <>
         }
         <>
      ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
      }
    ),
    { condition = line_begin }
  ),
}
