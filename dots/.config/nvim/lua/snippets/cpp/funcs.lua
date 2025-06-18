local helpers = require "snippets.helper_functions"
local autosnippet = helpers.autosnippet
local line_begin = helpers.line_begin

return {
  autosnippet(
    { trig = "([^%a])cin", regTrig = true, wordTrig = false },
    fmt("{}cin >> {};", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, "Your variable here"),
    })
  ),
  autosnippet(
    { trig = "([^%a])cout", regTrig = true, wordTrig = false },
    fmt("{}cout << {};", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, "Your text here"),
    })
  ),
  autosnippet(
    { trig = "func", regTrig = true, wordTrig = false },
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
  autosnippet(
    { trig = "([^%a])if", regTrig = true, wordTrig = false },
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
  autosnippet(
    { trig = "([^%a]%s)elif", regTrig = true, wordTrig = false },
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
  autosnippet(
    { trig = "([^%a]%s)else", regTrig = true, wordTrig = false },
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
  autosnippet(
    { trig = "([^%a])for", regTrig = true, wordTrig = false },
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
