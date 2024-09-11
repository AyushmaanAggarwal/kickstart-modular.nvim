local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

-- ================================================
--      My Configuration
-- ================================================
ls.add_snippets("markdown", {
    s({ trig = "math", name = "Metadata for Math HW",}, { fmta([[
    ---
    title: Math <> - Homework <>
    author: Ayushmaan Aggarwal
    date: 
    header-includes: |
    \\usepackage{amsmath}
    \\newcommand{\\Ima}{\\operatorname{Im}}
    \\newcommand{\\lcm}{\\operatorname{lcm}}
    \\newcommand{\\Aut}{\\operatorname{Aut}}
    \\newcommand{\\R}{\\mathbb R}
    \\newcommand{\\C}{\\mathbb C}
    \\newcommand{\\N}{\\mathbb N}
    \\renewcommand{\\P}{\\mathbb P}
    \\newcommand{\\Q}{\\mathbb Q}
    \\newcommand{\\Z}{\\mathbb Z}
    \\renewcommand{\\l}{\\langle}
    \\renewcommand{\\r}{\\rangle}
    \\newcommand{\\norm}{\\trianglelefteq}
    \\newcommand{\\lt}{\\ensuremath <<}
    \\newcommand{\\gt}{\\ensuremath >>}
    ---
    ]], {i(1), i(0)}
    )}),
})


