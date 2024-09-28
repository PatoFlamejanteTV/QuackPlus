--[[
PlayerEvents
--------------------------

Copyright (C) 2024 PatoflamejanteTV aka. UltimateQuack aka. Batatiz_Alt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	Except as contained in this notice, the name of PatoflamejanteTV aka. UltimateQuack aka. Batatiz_Alt shall not be used in advertising or otherwise to promote the sale, use or other dealings in this Software without prior written authorization from PatoflamejanteTV aka. UltimateQuack aka. Batatiz_Alt.
]]

local PlayerEvents = {}

function PlayerEvents.Join(f)
	game.Players.PlayerAdded:Connect(f)
end

function PlayerEvents.Changed(f)
	game.Players.Changed:Connect(f)
end

function PlayerEvents.Destroying(f)
	game.Players.Destroying:Connect(f)
end

function PlayerEvents.WhenUserJoins(f)
	game.Players.PlayerAdded:Connect(f)
end

function PlayerEvents.ChildRemoved(f)
	game.Players.ChildRemoved:Connect(f)
end

function PlayerEvents.PlayerRemoving(f)
	game.Players.PlayerRemoving:Connect(f)
end

return PlayerEvents
