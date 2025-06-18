local helpers = require "snippets.helper_functions"

return {
  s(
    { trig = "tgmod" },
    fmta(
      [[
import { Dispatcher, filters } from "@mtcute/dispatcher";
import i18next from "@utils/i18n";
import { prisma } from "@utils/databases";
import { Module } from "@modules/index";

const dp = Dispatcher.child();
const mod = new Module(import.meta.dirname);

<>

mod.addDispatchers(dp);
export default mod;
    ]],
      {
        i(1),
      }
    ),
    { condition = helpers.line_begin }
  ),
}
