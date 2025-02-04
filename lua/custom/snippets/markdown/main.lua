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
local date = function() return {os.date('%m/%d/%Y')} end

return {
  s({ trig = "math", name = "Metadata for Math HW" }, fmta([[
    ---
    title: Math 185 - Homework <>
    author: Ayushmaan Aggarwal
    date: <>
    header-includes: |
      \usepackage{amsmath}
      \newcommand{\lcm}{\operatorname{lcm}}
      \newcommand{\Aut}{\operatorname{Aut}}
      \newcommand{\R}{\mathbb R}
      \newcommand{\C}{\mathbb C}
      \newcommand{\N}{\mathbb N}
      \newcommand{\Q}{\mathbb Q}
      \newcommand{\Z}{\mathbb Z}
      \newcommand{\norm}{\trianglelefteq}
      \newcommand{\lt}{\ensuremath <<}
      \newcommand{\gt}{\ensuremath >>}

      \renewcommand{\P}{\mathbb P}
      \renewcommand{\l}{\langle}
      \renewcommand{\r}{\rangle}
      \renewcommand{\Re}{\operatorname{Re}}
      \renewcommand{\Im}{\operatorname{Im}}
    ---
    
    ]], {i(1), f(date, {})})),

  s({ trig = "cs", name = "Metadata for Math HW" }, fmta([[
    ---
    title: CS170 - Homework <>
    author: Ayushmaan Aggarwal
    date: <>
    header-includes: |
      \usepackage{amsmath}
      \usepackage{amssymb}
      \usepackage[makeroom]{cancel}
      \newcommand{\lcm}{\operatorname{lcm}}
      \newcommand{\Aut}{\operatorname{Aut}}
      \newcommand{\R}{\mathbb R}
      \newcommand{\C}{\mathbb C}
      \newcommand{\N}{\mathbb N}
      \newcommand{\Q}{\mathbb Q}
      \newcommand{\Z}{\mathbb Z}
      \newcommand{\norm}{\trianglelefteq}
      \newcommand{\lt}{\ensuremath <<}
      \newcommand{\gt}{\ensuremath >>}

      \renewcommand{\P}{\mathbb P}
      \renewcommand{\l}{\langle}
      \renewcommand{\r}{\rangle}
      \renewcommand{\Re}{\operatorname{Re}}
      \renewcommand{\Im}{\operatorname{Im}}
  
      \usepackage{float}
      \let\origfigure\figure
      \let\endorigfigure\endfigure
      \renewenvironment{figure}[1][2] {
          \expandafter\origfigure\expandafter[H]
      } {
          \endorigfigure
      }
    ---
    
    \tableofcontents
    \newpage 

    ]], {i(1), f(date, {})})),


  s({ trig = "prob", name = "Problem for Math HW" }, fmt([[
  # Problem {}
  > {}

  **Solution**


  \newpage

    ]], {i(1), i(2)})),

s({ trig = "algo", name = "Problem for CS Algorithm" }, fmt([[
  # Problem {}
  > {}

  **Solution**


  **Algorithm description**
  <!-- This can come in terms of pseudocode, or a description in English. It must be unambiguous, as short as possible (but no shorter), and precise. Your pseudocode does not need to be executable. You should use notation such as “add X to set S” or “for each edge in graph G”. Remember you are writing your pseudocode to be read by a human, not a computer. See DPV for examples of pseudocode.-->

  {}

  **Proof of correctness**
  <!-- Give a formal proof (as in CS 70) of the correctness of your algorithm. Intuitive arguments are not enough. -->

  {}

  **Runtime analysis**
  <!-- You should use big-O notation for your algorithm’s runtime, and justify this runtime with a runtime analysis. This may involve a recurrence relation, or simply counting the complexity and number of operations your algorithm performs-->

  {}

  \newpage

    ]], {i(1), i(2), i(3), i(4), i(5)})),

  s({ trig = "\\\\", name = "Comment" }, fmt([[<!-- {} -->]],
    {i(1)})),

  s({ trig = "fig", name = "Insert Figure" }, fmta([[![<>](./<>){width=300px}]],
    {i(1), i(2)})),

}, {
}
