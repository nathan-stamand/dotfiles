local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local myFirstSnippet = s("myFirstSnippet", {
    t('this is my first snippet '),
    i(1, 'placeholder text'),
    t({'', " this is another text node"})
})
table.insert(snippets, myFirstSnippet)

local mySecondSnippet = s('mySecondSnippet', fmt([[
local {} = function({})
    {} {{ this will be in brackies }}
end
]], {
    i(1, 'myVar'),
    c(2, {t'', i(1,'myArg')}),
    i(3, '-- TODO: Something'),
}))
table.insert(snippets, mySecondSnippet)

local myFirstAutoSnippet = s({trig = 'digit(%d)(%d)', regTrig = true}, {
    i(1, " uppercase me "),
    f(function(arg, snip)
        return arg[1][1]:upper() .. arg[2][1]:lower()
    end, {1, 2}),
    i(2, " LOWERCASE ME ")
})
table.insert(autosnippets, myFirstAutoSnippet)



return snippets, autosnippets
