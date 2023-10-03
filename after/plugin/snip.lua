local ls = require("luasnip")


local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


local fori = function() 
    return [[for(int i = 0; i < 1; i++){}]]
end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "fori",
            namr = "For",
            dscr = "",
        }, {
            func(fori, {}),
        }),
    },
})


