local generate_matrix = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t " & ")
      table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
    table.insert(nodes, t { "\\\\", "" })
  end
  -- fix last node.
  nodes[#nodes] = t "\\\\"
  return sn(nil, nodes)
end
local in_mathzone = require "luasnip-helper-funcs"

return {
  s(
    {
      trig = "([%sbBpvV])Mat(%d+)x(%d+)",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "[bBpvV]matrix of A x B size",
    },
    fmta(
      [[
    \begin{<>}
    <>
    \end{<>}]],
      {
        f(function(_, snip)
          if snip.captures[1] == " " then
            return "matrix"
          else
            return snip.captures[1] .. "matrix"
          end
        end),
        d(1, generate_matrix),
        f(function(_, snip)
          return snip.captures[1] .. "matrix"
        end),
      }
    ),
    { condition = in_mathzone }
  ),
}
