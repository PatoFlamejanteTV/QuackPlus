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

local Set = nil 
local HttpService = game:GetService("HttpService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Cast = require(ReplicatedStorage.Shared.modules.Cast)
--local Color = require(ReplicatedStorage.Shared.modules.Color)
local PlayerEvents = require(ReplicatedStorage.Shared.modules.PlayerEvents)
--local Timer = require(ReplicatedStorage.Shared.modules.Timer)

local RawQPData = ReplicatedStorage.Shared.data.main -- main.json
local QPDData = HttpService:JSONDecode(RawQPData.source) -- contents

PlayerEvents.WhenUserJoins(wmsg()) -- le message

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

function Objects.New(arg1, arg2, ...) -- silly OOP thing, based on "Roblox OOP (Object Oriented Programming)"
	-- https://devforum.roblox.com/t/roblox-oop-object-oriented-programming/1639499
	local newObject = {}
	newObject.arg1 = arg1
	newObject.arg2 = arg2
	newObject.other = ...
	setmetatable(newObject, Objects)
	print(newObject) -- debug(?)
	return newObject -- here you are returning the object to the function.
end


function wmsg()
	print(QPDData.WelcomeMSG.WelcomeMSG)
end
return QuackPlus
-- quack
