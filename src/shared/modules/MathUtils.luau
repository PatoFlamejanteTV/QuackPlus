-- Original ("First Part" of the code) (JavaScript) code by the Scratch Team
-- https://github.com/scratchfoundation/scratch-vm/blob/da68c4faf68014bfdfdb1af263910940d96ddd3a/src/util/math-util.js

-- Original ("Second Part" of the code) (Lua) code by ZenLian
-- https://github.com/ZenLian/dont-starve-together-scripts/blob/master/mathutil.lua
local MathUtil = {}

-- Convert a value from degrees to radians.
-- @param deg number: Value in degrees.
-- @return number: Equivalent value in radians.
function MathUtil.degToRad(deg)
	return deg * math.pi / 180
end

-- Convert a value from radians to degrees.
-- @param rad number: Value in radians.
-- @return number: Equivalent value in degrees.
function MathUtil.radToDeg(rad)
	return rad * 180 / math.pi
end

-- Clamp a number between two limits.
-- If n < min, return min. If n > max, return max. Else, return n.
-- @param n number: Number to clamp.
-- @param min number: Minimum limit.
-- @param max number: Maximum limit.
-- @return number: Value of n clamped to min and max.
function MathUtil.clamp(n, min, max)
	return math.min(math.max(n, min), max)
end

-- Keep a number between two limits, wrapping "extra" into the range.
-- e.g., wrapClamp(7, 1, 5) == 2
-- wrapClamp(0, 1, 5) == 5
-- wrapClamp(-11, -10, 6) == 6, etc.
-- @param n number: Number to wrap.
-- @param min number: Minimum limit.
-- @param max number: Maximum limit.
-- @return number: Value of n wrapped between min and max.
function MathUtil.wrapClamp(n, min, max)
	local range = (max - min) + 1
	return n - (math.floor((n - min) / range) * range)
end

-- Convert a value from tan function in degrees.
-- @param angle number: Angle in degrees
-- @return number: Correct tan value
function MathUtil.tan(angle)
	angle = angle % 360
	if angle == -270 or angle == 90 then
		return math.huge
	elseif angle == -90 or angle == 270 then
		return -math.huge
	else
		return tonumber(string.format("%.10f", math.tan((math.pi * angle) / 180)))
	end
end

-- Given an array of unique numbers,
-- returns a reduced array such that each element of the reduced array
-- represents the position of that element in a sorted version of the
-- original array.
-- E.g. {5, 19. 13, 1} => {1, 3, 2, 0}
-- @param elts table: The elements to sort and reduce
-- @return table: The array of reduced orderings
function MathUtil.reducedSortOrdering(elts)
	local sorted = table.clone(elts)
	table.sort(sorted)
	local result = {}
	for i, e in ipairs(elts) do
		result[i] = table.find(sorted, e) - 1
	end
	return result
end

-- Return a random number given an inclusive range and a number in that
-- range that should be excluded.
-- For instance, (1, 5, 3) will only pick 1, 2, 4, or 5 (with equal probability)
-- @param lower number: The lower bound (inclusive)
-- @param upper number: The upper bound (inclusive), such that lower <= upper
-- @param excluded number: The number to exclude (MUST be in the range)
-- @return number: A random integer in the range [lower, upper] that is not "excluded"
function MathUtil.inclusiveRandIntWithout(lower, upper, excluded)
	local possibleOptions = upper - lower
	local randInt = lower + math.floor(math.random() * possibleOptions)
	if randInt >= excluded then
		return randInt + 1
	end
	return randInt
end

-- Scales a number from one range to another.
-- @param i number: number to be scaled
-- @param iMin number: input range minimum
-- @param iMax number: input range maximum
-- @param oMin number: output range minimum
-- @param oMax number: output range maximum
-- @return number: scaled number
function MathUtil.scale(i, iMin, iMax, oMin, oMax)
	local p = (i - iMin) / (iMax - iMin)
	return (p * (oMax - oMin)) + oMin
end

---------------------------------------------------------------------------------

function MathUtil.Lerp(a,b,t)
	return a + (b - a) * t
end

--Remap a value (i) from one range (a - b) to another (x - y)
function MathUtil.Remap(i, a, b, x, y)
	return (((i - a)/(b - a)) * (y - x)) + x
end

--Round a number to idp decimal points. 0.5-values are always rounded up.
function MathUtil.RoundBiasedUp(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

--Round a number to idp decimal points. 0.5-values are always rounded down.
function MathUtil.RoundBiasedDown(num, idp)
	local mult = 10^(idp or 0)
	return math.ceil(num * mult - 0.5) / mult
end

--Rounds numToRound to the nearest multiple of "mutliple"
function MathUtil.RoundToNearest(numToRound, multiple)
	local half = multiple/2
	return numToRound+half - (numToRound+half) % multiple
end

return MathUtil