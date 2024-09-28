local Color = require(script.Parent.Color)

--[[
 * @fileoverview
 * Utilities for casting and comparing Scratch data-types.
 * Scratch behaves slightly differently from JavaScript in many respects,
 * and these differences should be encapsulated below.
 * For example, in Scratch, add(1, join("hello", world")) -> 1.
 * This is because "hello world" is cast to 0.
 * In JavaScript, 1 + Number("hello" + "world") would give you NaN.
 * Use when coercing a value before computation.
]]

local Cast = {}

--[[
 * Scratch cast to number.
 * Treats NaN as 0.
 * In Scratch 2.0, this is captured by `interp.numArg.`
 * @param {*} value Value to cast to number.
 * @return {number} The Scratch-casted number value.
]]
function Cast.toNumber(value)
	if type(value) == "number" then
		if value ~= value then -- Check for NaN
			return 0
		end
		return value
	end
	local n = tonumber(value)
	if n ~= n then -- Check for NaN
		return 0
	end
	return n
end

--[[
 * Scratch cast to boolean.
 * In Scratch 2.0, this is captured by `interp.boolArg.`
 * Treats some string values differently from JavaScript.
 * @param {*} value Value to cast to boolean.
 * @return {boolean} The Scratch-casted boolean value.
]]
function Cast.toBoolean(value)
	if type(value) == "boolean" then
		return value
	end
	if type(value) == "string" then
		if value == "" or value == "0" or string.lower(value) == "false" then
			return false
		end
		return true
	end
	return value and true or false
end

--[[
 * Scratch cast to string.
 * @param {*} value Value to cast to string.
 * @return {string} The Scratch-casted string value.
]]
function Cast.toString(value)
	return tostring(value)
end

--[[
 * Cast any Scratch argument to an RGB color array to be used for the renderer.
 * @param {*} value Value to convert to RGB color array.
 * @return {Array.<number>} [r,g,b], values between 0-255.
]]
function Cast.toRgbColorList(value)
	local color = Cast.toRgbColorObject(value)
	return {color.r, color.g, color.b}
end

--[[
 * Cast any Scratch argument to an RGB color object to be used for the renderer.
 * @param {*} value Value to convert to RGB color object.
 * @return {RGBOject} [r,g,b], values between 0-255.
]]
function Cast.toRgbColorObject(value)
	local color
	if type(value) == "string" and string.sub(value, 1, 1) == "#" then
		color = Color.hexToRgb(value)
	else
		color = Color.decimalToRgb(Cast.toNumber(value))
	end
	return color
end

--[[
 * Determine if a Scratch argument is a white space string (or null / empty).
 * @param {*} val value to check.
 * @return {boolean} True if the argument is all white spaces or null / empty.
]]
function Cast.isWhiteSpace(val)
	return val == nil or (type(val) == "string" and #string.gsub(val, "%s", "") == 0)
end

--[[
 * Compare two values, using Scratch cast, case-insensitive string compare, etc.
 * In Scratch 2.0, this is captured by `interp.compare.`
 * @param {*} v1 First value to compare.
 * @param {*} v2 Second value to compare.
 * @returns {number} Negative number if v1 < v2; 0 if equal; positive otherwise.
]]
function Cast.compare(v1, v2)
	local n1 = tonumber(v1)
	local n2 = tonumber(v2)
	if n1 == 0 and Cast.isWhiteSpace(v1) then
		n1 = 0/0 -- NaN
	elseif n2 == 0 and Cast.isWhiteSpace(v2) then
		n2 = 0/0 -- NaN
	end
	if n1 ~= n1 or n2 ~= n2 then -- Check for NaN
		local s1 = string.lower(tostring(v1))
		local s2 = string.lower(tostring(v2))
		if s1 < s2 then
			return -1
		elseif s1 > s2 then
			return 1
		end
		return 0
	end
	-- Handle the special case of Infinity
	if (n1 == math.huge and n2 == math.huge) or (n1 == -math.huge and n2 == -math.huge) then
		return 0
	end
	-- Compare as numbers.
	return n1 - n2
end

--[[
 * Determine if a Scratch argument number represents a round integer.
 * @param {*} val Value to check.
 * @return {boolean} True if number looks like an integer.
]]
function Cast.isInt(val)
	if type(val) == "number" then
		if val ~= val then -- Check for NaN
			return true
		end
		return val == math.floor(val)
	elseif type(val) == "boolean" then
		return true
	elseif type(val) == "string" then
		return not string.find(val, "%.")
	end
	return false
end

Cast.LIST_INVALID = "INVALID"
Cast.LIST_ALL = "ALL"

--[[
 * Compute a 1-based index into a list, based on a Scratch argument.
 * Two special cases may be returned:
 * LIST_ALL: if the block is referring to all of the items in the list.
 * LIST_INVALID: if the index was invalid in any way.
 * @param {*} index Scratch arg, including 1-based numbers or special cases.
 * @param {number} length Length of the list.
 * @param {boolean} acceptAll Whether it should accept "all" or not.
 * @return {(number|string)} 1-based index for list, LIST_ALL, or LIST_INVALID.
]]
function Cast.toListIndex(index, length, acceptAll)
	if type(index) ~= "number" then
		if index == "all" then
			return acceptAll and Cast.LIST_ALL or Cast.LIST_INVALID
		end
		if index == "last" then
			if length > 0 then
				return length
			end
			return Cast.LIST_INVALID
		elseif index == "random" or index == "any" then
			if length > 0 then
				return 1 + math.floor(math.random() * length)
			end
			return Cast.LIST_INVALID
		end
	end
	index = math.floor(Cast.toNumber(index))
	if index < 1 or index > length then
		return Cast.LIST_INVALID
	end
	return index
end

return Cast