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

local dumpAndDie = s('dd', {
    t("echo \"<pre>\" . print_r("),
    i(1, '$var'),
    t(", 1) . \"</pre>\";die();"),
})
table.insert(snippets, dumpAndDie)

local customField = s('customField', fmt([[
${} = $PageLoad->LOAD_CUSTOM_CONTENT("{}", {}, "{}", $User);
]], {
        i(1, 'customFieldVariable'),
        f(function(arg, snip)
            return string.gsub(arg[1][1], '%_', '-')
        end, 1),
        c(2, {t('true'), t('false')}),
        i(3, ""),
    }))
table.insert(snippets, customField)

local customFieldLoader = s('customFieldLoader', fmt([[
$loop_id = "{}";
$search_for = [{}];

${} = [];
foreach ($search_for as $s) {{
    ${}[$s] = $PageLoad->LOAD_CUSTOM_CONTENT("{}-$s", false, '', $User) ?:
        $PageLoad->LOAD_CUSTOM_CONTENT("{}-$s", false, '{}', $User);
}}
]], {
    i(1, 'loop-identifier'),
    i(2, '"heading", "message", "button-text", "button-link"'),
    i(3, 'storageVar'),
    rep(3),
    rep(1),
    rep(1),
    i(4, 'fallback page id')
    }))
table.insert(snippets, customFieldLoader)


return snippets, autosnippets
