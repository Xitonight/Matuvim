local helpers = {}

local s = require("luasnip").snippet

helpers.get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

helpers.line_begin = require("luasnip.extras.expand_conditions").line_begin

helpers.autosnippet = require("luasnip").extend_decorator.apply(s, { snippetType = "autosnippet" })

return helpers
