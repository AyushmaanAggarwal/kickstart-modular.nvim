local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


--TODO: 
-- local tex = require("/home/ayushmaan/.dotfiles/config/snippets/utils/conditions")

local tab_snips = {
  -- Simple Tab Complete Snippets
  s("gint", t([[\int_{\gamma} ]])),
  s("int",  fmta([[\int_{<>}^{<>}]], {i(1), i(2)})),
  s("sum",  fmta([[\sum_{<>}^{<>}]], {i(1), i(2)})),
  s("diff", fmta([[\frac{\partial <>}{\partial <>}]], {i(1), i(2)})),
  s("txt", fmta([[\text{<>}]], {i(1)})),
  s("mk", fmta([[$<>$]], {i(1)})),
  s("set", fmta([[\{<>\}]], {i(1)})),
  s("cirset", fmta([[C_{<>}(<>)]], {i(1, "r"), i(2)})),
  s("diskset", fmta([[D_{<>}(<>)]], {i(1, "r"), i(2)})),
  s("inr", fmta([[\in\R]], {})),
  s("inc", fmta([[\in\C]], {})),

  -- Multi line Tab Complete Snippets
  s("bn", fmta([[
    \begin{<>}
    <>
    \end{<>}
    ]], {i(1), i(2), rep(1)})),

  s("align", fmta([[
    \begin{align<>}
    <>
    &= <> \\
    \end{align<>}
    ]], {i(1), i(2), i(3), rep(1)})),

  s("eqn", fmta([[
    \begin{equation<>}
    <>
    \end{equation<>}
    ]], {i(1), i(2), rep(1)})),


  s("sys", fmta([[
    \begin{cases}
    <> \\
    <> 
    \end{cases}
    ]], {i(1), i(2)})),

  s({ trig="diff(%d)", regTrig=true, name="exponent"},
    fmta("\\frac{\\partial^<>}{\\partial <>^<>}",
    { f(function(_, snip) return snip.captures[1] end),
    i(1),
    f(function(_, snip) return snip.captures[1] end)})),

}

local auto_snips = {
  -- Simple Auto Complete Snippets
  s({ trig="(%w+)%^", regTrig=true, name="exponent"}, fmta("<>^{<>}",
    {f(function(_, snip) return snip.captures[1] end), i(1)})),
  s({ trig="(%w+)%_", regTrig=true, name="subscript"}, fmta("<>_{<>}",
    {f(function(_, snip) return snip.captures[1] end), i(1)})),

  s({ trig="(%s+)([^%s%.%/]+)/", regTrig=true, wordTrig=false, name='fraction'},
      fmta([[ \frac{<>}{<>}]],
      { f(function(_, snip) return snip.captures[2] end), i(1) })),

  s({ trig='(%a)(%d)', regTrig=true, name='auto subscript'},
      fmta([[<>_<>]],
      { f(function(_, snip) return snip.captures[1] end),
      f(function(_, snip) return snip.captures[2] end) })),

  s({ trig='(%a)_(%d%d)', regTrig=true, name='auto subscript 2'},
      fmta([[<>_{<>}]],
      { f(function(_, snip) return snip.captures[1] end),
      f(function(_, snip) return snip.captures[2] end)})),

  -- Multi line Auto Complete Snippets
  s({ trig="==", regTrig=true, name="align"}, fmta([[
  &<> <> \\
  ]],{ c(1, {t("="), t("\\leq"), i(1)}), i(2)})),
}


return tab_snips, auto_snips
