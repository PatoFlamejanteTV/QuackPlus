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

function QuackPlus.Service(name)
	return game:GetService(name)
end
--[[function wmsg()
	print(QPDData.WelcomeMSG.WelcomeMSG)
end]]
return QuackPlus
-- quack
