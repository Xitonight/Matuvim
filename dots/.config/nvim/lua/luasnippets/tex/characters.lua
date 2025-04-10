local tex_conditions = require "luasnippets.tex.utils.conditions"
local helpers = require "luasnippets.helper_functions"
local autosnippet = helpers.autosnippet

return {
  autosnippet({ trig = "ell" }, t "\\ell", { condition = tex_conditions.in_math }),
  autosnippet({ trig = "EE" }, t "&", { condition = tex_conditions.in_math }),
  autosnippet({ trig = "RR" }, fmta([[\mathbb{R}^{<>}]], { i(1) }), { condition = tex_conditions.in_math }),
  autosnippet({ trig = "QQ" }, fmta([[\mathbb{Q}^{<>}]], { i(1) }), { condition = tex_conditions.in_math }),
  autosnippet({ trig = "ZZ" }, fmta([[\mathbb{Z}^{<>}]], { i(1) }), { condition = tex_conditions.in_math }),
}
