local Lists = {}
Lists.__index = Lists -- metatable thing(?)

local HttpService = game:GetService("HttpService")

function checkItem(tocheck, wherecheck) -- important note: do NOT USE THIS WITH BIG LISTS!!!
    -- tocheck - para checar, lista que vai ser pesquisada
    -- wherecheck - que lista procurar
    local list = require(wherecheck)
    local result = HttpService:JSONDecode(list)

    for _, item in ipairs(result) do
        if item == tocheck then
            return true
        end
    end
    return false
end
