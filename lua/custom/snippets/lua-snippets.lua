local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- ================================================
--      My Configuration
-- ================================================
-- ls.add_snippets("elixir", {
--   s("el", fmt("<%= {} %>{}", { i(1), i(0) })),
--   s("ei", fmt("<%= if {} do %>{}<% end %>{}", { i(1), i(2), i(0) })),
-- })
ls.add_snippets(nil, {
  lua = {
    s("loc", fmt("local {} = require('{}')", {i(1, "default"), rep(1)})),
  },
})
