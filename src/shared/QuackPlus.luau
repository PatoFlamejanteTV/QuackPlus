--!strict
--[[
Quack!, or QuackPlus.
    Somethime im going to make an "mini"
    scripting language called QuackIntScript
    (Quack Internal Script) just for using in
    this project...
]]
------------------------------------------------------------------------

local QP = {} -- do NOT use "!" in variable names, or else...
QP.__index = QP

function QP.Service(name)
	return game:GetService(name)
end

function QP.GetIP() -- get ip using http://ip-api.com/json/
	return game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync("http://ip-api.com/json/"))
end

function QP.GetPlayers()
	-- get the amount of players
	return #game:GetService("Players"):GetPlayers()
end

function QP.CurrentX() -- for GUIs
	return game:GetService("GuiService"):GetGuiInset().X
end

function QP.CurrentY() -- for GUIs
	return game:GetService("GuiService"):GetGuiInset().Y
end

function QP.Play(audio, loop)
	if loop then
		return audio:Play(), audio.Looped == true
	end if not loop then
		return audio:Play(), audio.Looped == false
	end
	--print("Playing " .. audio)
end

function QP.emojiToEmoticon(string)
	local emoticons =
		{
			":D",
			":)",
			":0",
			":(",
			">:)",
		}
	local emojis =
		{
			"😄",
			"😃",
			"😮",
			"☹️", -- WHAT (only this emoji is small on studio)
			"😈"
		}
	local function convert(convertedstring) -- convert the string
		for i, v in pairs(emojis) do
			if convertedstring == emoticons[i] then
				return v
			end
		end
		return convertedstring
	end
	return convert(string)
end


return QP