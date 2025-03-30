local conditions = require "luasnippets.tex.utils.conditions"
local auto = require("luasnip").extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  auto({ trig = "ell" }, t "\\ell", { condition = conditions.in_math }),
  auto({ trig = "EE" }, t "&", { condition = conditions.in_math }),
  auto({ trig = "RR" }, fmta([[\mathbb{R}^{<>}]], { i(1) }), { condition = conditions.in_math }),
  auto({ trig = "QQ" }, fmta([[\mathbb{Q}^{<>}]], { i(1) }), { condition = conditions.in_math }),
  auto({ trig = "ZZ" }, fmta([[\mathbb{Z}^{<>}]], { i(1) }), { condition = conditions.in_math }),
}
