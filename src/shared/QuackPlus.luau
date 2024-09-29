--!strict
--local Workspace = game:GetService("Workspace")
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

--[[ Objetivos:
local Part = document.Instance.new("Part")
------------------------------------------
]]

local QuackPlus = {} -- do NOT use "!" in variable names, or else...
QuackPlus.__index = QuackPlus

local Object = {}
Object.__index = Object

--local HttpService = game:GetService("HttpService")

--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--[[local Cast = require(ReplicatedStorage.Shared.modules.Cast)
local Color = require(ReplicatedStorage.Shared.modules.Color)
local PlayerEvents = require(ReplicatedStorage.Shared.modules.PlayerEvents)
local Timer = require(ReplicatedStorage.Shared.modules.Timer)]]

--local RawQPData = ReplicatedStorage.Shared.data.main -- main.json
--local QPDData = HttpService:JSONDecode(RawQPData.source) -- contents, but its never used

function Object.Create(instance, name, arg1, arg2) -- OOP (?)
	local self = setmetatable({}, QuackPlus)
	self.Instance = Instance.new(instance)
	self.Name = name
	self.arg1 = arg1
	self.arg2 = arg2
end

function QuackPlus.Service(name)
	return game:GetService(name)
end
--[[function wmsg()
	print(QPDData.WelcomeMSG.WelcomeMSG)
end]]
return QuackPlus
-- quack
