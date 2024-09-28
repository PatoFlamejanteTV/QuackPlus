local Color = {}

function Color.RGB_BLACK()
    return {r = 0, g = 0, b = 0}
end

function Color.RGB_WHITE()
    return {r = 255, g = 255, b = 255}
end

function Color.decimalToHex(r)
    if r < 0 then
        r = r + 16777216
    end
    local hex = string.format("%06x", r)
    return "#" .. hex
end

function Color.decimalToRgb(r)
    local a = bit32.rshift(r, 24) % 256
    return {
        r = bit32.rshift(r, 16) % 256,
        g = bit32.rshift(r, 8) % 256,
        b = r % 256,
        a = a > 0 and a or 255
    }
end

function Color.hexToRgb(hex)
    hex = hex:gsub("^#?([a-f%d])([a-f%d])([a-f%d])$", function(r, g, b)
        return r .. r .. g .. g .. b .. b
    end)
    local r, g, b = hex:match("^#?([a-f%d][a-f%d])([a-f%d][a-f%d])([a-f%d][a-f%d])$")
    return r and {r = tonumber(r, 16), g = tonumber(g, 16), b = tonumber(b, 16)} or nil
end

function Color.rgbToHex(rgb)
    return Color.decimalToHex(Color.rgbToDecimal(rgb))
end

function Color.rgbToDecimal(rgb)
    return bit32.lshift(rgb.r, 16) + bit32.lshift(rgb.g, 8) + rgb.b
end

function Color.hexToDecimal(hex)
    return Color.rgbToDecimal(Color.hexToRgb(hex))
end

function Color.hsvToRgb(hsv)
    local h = hsv.h % 360
    if h < 0 then
        h = h + 360
    end
    local s = math.max(0, math.min(hsv.s, 1))
    local v = math.max(0, math.min(hsv.v, 1))
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = v - c
    local r, g, b = 0, 0, 0

    if h < 60 then
        r, g, b = c, x, 0
    elseif h < 120 then
        r, g, b = x, c, 0
    elseif h < 180 then
        r, g, b = 0, c, x
    elseif h < 240 then
        r, g, b = 0, x, c
    elseif h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end

    return {
        r = math.floor((r + m) * 255),
        g = math.floor((g + m) * 255),
        b = math.floor((b + m) * 255)
    }
end

function Color.rgbToHsv(rgb)
    local r, g, b = rgb.r / 255, rgb.g / 255, rgb.b / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v = 0, 0, max

    local d = max - min
    s = max == 0 and 0 or d / max

    if max ~= min then
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    return {h = h * 360, s = s, v = v}
end

function Color.mixRgb(rgb1, rgb2, t)
    if t <= 0 then
        return rgb1
    elseif t >= 1 then
        return rgb2
    else
        local e = 1 - t
        return {
            r = e * rgb1.r + t * rgb2.r,
            g = e * rgb1.g + t * rgb2.g,
            b = e * rgb1.b + t * rgb2.b
        }
    end
end

return Color

