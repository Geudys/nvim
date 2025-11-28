local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

    s("ld5", {
        t("- "), i(1, "item 1"),
        t({ "", "- " }), i(2, "item 2"),
        t({ "", "- " }), i(3, "item 3"),
        t({ "", "- " }), i(4, "item 4"),
        t({ "", "- " }), i(5, "item 5"),
    }),

    s("lo5", {
        t("1. "), i(1, "item 1"),
        t({ "", "2. " }), i(2, "item 2"),
        t({ "", "3. " }), i(3, "item 3"),
        t({ "", "4. " }), i(4, "item 4"),
        t({ "", "5. " }), i(5, "item 5"),
    }),

}
