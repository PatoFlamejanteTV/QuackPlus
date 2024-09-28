--[[
	A utility for accurately measuring time.
	To use:
	---
	local timer = Timer.new()
	timer:start()
	-- ... pass some time ...
	local timeDifference = timer:timeElapsed()
	---
	Or, you can use the `time` and `relativeTime`
	to do some measurement yourself.
]]

local Timer = {}
Timer.__index = Timer

-- Constants
local USE_PERFORMANCE = false

-- Utility functions
local function legacyNow()
	return os.time() * 1000 + os.clock() * 1000 % 1000
end

local nowObj = {
	now = if USE_PERFORMANCE and typeof(workspace) ~= "nil" and workspace:IsA("Workspace") then
		workspace.GetServerTimeNow
	elseif os.clock then
		os.clock
	else
		legacyNow
}

function Timer.new(customNowObj)
	local self = setmetatable({}, Timer)
	self.startTime = 0
	self.nowObj = customNowObj or nowObj
	return self
end

function Timer:time()
	return self.nowObj.now() * 1000
end

function Timer:relativeTime()
	return self.nowObj.now() * 1000
end

function Timer:start()
	self.startTime = self.nowObj.now() * 1000
end

function Timer:timeElapsed()
	return self.nowObj.now() * 1000 - self.startTime
end

function Timer.setTimeout(handler, timeout)
	return task.delay(timeout / 1000, handler)
end

function Timer.clearTimeout(timeoutId)
	task.cancel(timeoutId)
end

return Timer

