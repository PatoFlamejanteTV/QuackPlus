--!strict
--[[
Quack!, or QuackPlus.
    Scripts based/used/imported this
    module should be called "QuackScripts"
    (Btw files exported should be .qps)
                        (QuackPlusScript)
]]
------------------------------------------------------------------------
--[[
Btw [SOME] parts of comments, docs, etc. are NOT IN ENGLISH!
Thats bcause im not vri gud at engrish and im BRASIL!!! :feijoada: :br_miku:
]]
local QuackPlus = {} -- do NOT use "!" in variable names, or else...
QuackPlus.__index = QuackPlus

local Objects = {} -- OOP test
Objects.__index = Objects

function Set:__add(otherSet) -- metatable(?) things
	local result = Set.new()
	for entry in self do
		result[entry] = true
	end
	for entry in otherSet do
		result[entry] = true
	end
	return result
end

function echo(args) -- seems silly, is silly, passed with an 10/10 sillyness test. LITERAL PRINT("")
	print(args)
end

function Objects.New(arg1, arg2) -- silly OOP thing, based on "Roblox OOP (Object Oriented Programming)"
	-- TODO: add more things
	-- https://devforum.roblox.com/t/roblox-oop-object-oriented-programming/1639499
	local newObject = {}
	newObject.arg1 = arg1
	newObject.arg2 = arg2
	setmetatable(newObject, Objects)
	print(newObject) -- debug(?)
	return newObject -- here you are returning the object to the function.
end

return QuackPlus
-- quack