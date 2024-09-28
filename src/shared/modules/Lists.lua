local Lists = {}
Lists.__index = Lists -- metatable thing(?)

function checkIfIs(tocheck, wherecheck)
-- tocheck - para checar, lista que vai ser pesquisada
-- wherecheck - que lista procurar
local list = require(wherecheck)
local JSON = require(script.Parent.JSON)
end